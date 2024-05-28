using System;
using System.Data;
using System.Windows.Forms;
using LibrarySystem.Includes;

namespace LibrarySystem
{
    public partial class frmBorrow : Form
    {
        public frmBorrow()
        {
            InitializeComponent();
        }

        SQLConfig config = new SQLConfig();
        usableFunction funct = new usableFunction();
        string sql;

        private void txtAccesionNumBorrow_TextChanged(object sender, EventArgs e)
        {
            if (txtAccesionNumBorrow.Text == "")
            {
                txtTitle.Clear();
                txtAuthor.Clear();
                txtDatePublish.Clear();
                txtpublisher.Clear();
                txtbooktype.Clear();
            }
            else
            {
                // Check if the book is available or has been returned
                sql = $"SELECT * FROM tblbooks b, tblcategory c, tblborrow br WHERE b.CategoryId=c.CategoryId AND b.AccessionNo=br.AccessionNo AND br.AccessionNo='{txtAccesionNumBorrow.Text}'";
                config.singleResult(sql);
                if (config.dt.Rows.Count > 0)
                {
                    string bookStatus = config.dt.Rows[0].Field<string>("Status");
                    if (bookStatus == "Available" || bookStatus == "Returned")
                    {
                        txtTitle.Text = config.dt.Rows[0].Field<string>("BookTitle");
                        txtAuthor.Text = config.dt.Rows[0].Field<string>("Author");
                        txtDatePublish.Text = config.dt.Rows[0].Field<DateTime>("PublishDate").ToString();
                        txtpublisher.Text = config.dt.Rows[0].Field<string>("BookPublisher");
                        txtbooktype.Text = config.dt.Rows[0].Field<string>("BookType");
                    }
                    else
                    {
                        MessageBox.Show("The selected book is not available for borrowing.", "Invalid", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        txtAccesionNumBorrow.Clear();
                    }
                }
            }
        }

        private void frmBorrow_Load(object sender, EventArgs e)
        {
            btnNew_Click(sender, e);
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            funct.clearTxt(GroupBox1);
            funct.clearTxt(grp_Bgroup);
            sql = " SELECT br.`AccessionNo`, `BookTitle`, `BookDesc` as 'Description',Concat(`Firstname`,' ', `Lastname`) as 'Borrower',`NoCopies`, `DateBorrowed`, `Purpose`, `DueDate` FROM `tblborrow` br,`tblbooks` b,`tblborrower` bw  WHERE br.AccessionNo=b.AccessionNo AND br.`BorrowerId`=bw.`BorrowerId` ORDER BY BorrowId Desc";
            config.Load_ResultList(sql, dtg_BlistOfBooks);

            sql = "SELECT AccessionNo From tblbooks Where Status = 'Available'";
            config.autocomplete(sql, txtAccesionNumBorrow);

            sql = "SELECT BorrowerId From tblborrower";
            config.autocomplete(sql, txtBorrowerId);
 
        }

        private void txtBorrowerId_TextChanged(object sender, EventArgs e)
        {
            if( txtBorrowerId.Text == "")
            {
                txtName.Clear();
                txtCourse.Clear();
            }
            else
            {
                sql = "SELECT * FROM `tblborrower` WHERE `BorrowerId` = '" + txtBorrowerId.Text + "'";
                config.singleResult(sql);
                if(config.dt.Rows.Count > 0)
                {
                    txtName.Text = config.dt.Rows[0].Field<string>("Firstname") + " " + config.dt.Rows[0].Field<string>("Lastname");
                    txtCourse.Text = config.dt.Rows[0].Field<string>("CourseYear");
                }
                else
                {
                    txtName.Clear();
                    txtCourse.Clear();
                }
            }
        }

        private void btn_Bsave_Click(object sender, EventArgs e)
        {
            if (txtAccesionNumBorrow.Text == "" || txtBorrowerId.Text == "")
            {
                MessageBox.Show("All fields are required.", "Invalid", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            if (cboPurpose.Text == "Select")
            {
                MessageBox.Show("Please choose your purpose.", "Invalid", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            // Check if the book is available or has been returned
            sql = $"SELECT * FROM tblbooks WHERE AccessionNo = '{txtAccesionNumBorrow.Text}' AND (Status = 'Available' OR Status = 'Returned')";
            config.singleResult(sql);

            if (config.dt.Rows.Count == 0)
            {
                MessageBox.Show("The selected book is not available for borrowing.", "Invalid", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            // Check if the number of copies is greater than 0
            sql = $"SELECT NumberOfCopies FROM tblbooks WHERE AccessionNo = '{txtAccesionNumBorrow.Text}'";
            config.singleResult(sql);

            int numberOfCopies = config.dt.Rows.Count > 0 ? config.dt.Rows[0].Field<int>("NumberOfCopies") : 0;

            if (numberOfCopies <= 0)
            {
                MessageBox.Show("The selected book is not available for borrowing as there are no copies left.", "Invalid", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            // Check if the borrower has already borrowed the selected book
            sql = $"SELECT * FROM tblborrow WHERE AccessionNo = '{txtAccesionNumBorrow.Text}' AND BorrowerId = '{txtBorrowerId.Text}' AND Status = 'Borrowed'";
            config.singleResult(sql);

            if (config.dt.Rows.Count > 0)
            {
                MessageBox.Show("The selected book has already been borrowed by this borrower.", "Invalid", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            // Update the book count in tblbooks
            sql = $"UPDATE tblbooks SET NumberOfCopies = NumberOfCopies - 1 WHERE AccessionNo = '{txtAccesionNumBorrow.Text}'";
            config.Execute_Query(sql);

            // Insert the borrow record
            DateTime dueDate;
            switch (cboPurpose.Text)
            {
                case "Photocopy":
                    dueDate = DateTime.Now.AddMinutes(30);
                    txtdue.Text = dueDate.ToString("yyyy-MM-dd HH:mm:ss");
                    break;
                case "Research":
                    if (DateTime.Now.ToString("tt") == "AM")
                    {
                        txtdue.Text = DateTime.Now.ToString("yyyy-MM-dd") + " 11:30:00";
                    }
                    else if (DateTime.Now.ToString("tt") == "PM")
                    {
                        txtdue.Text = DateTime.Now.ToString("yyyy-MM-dd") + " 17:30:00";
                    }
                    break;
                case "Overnight":
                    dueDate = DateTime.Now.AddHours(24);
                    txtdue.Text = dueDate.ToString("yyyy-MM-dd HH:mm:ss");
                    break;
            }

            sql = $"INSERT INTO tblborrow (AccessionNo, NoCopies, DateBorrowed, Purpose, Status, DueDate, BorrowerId) " +
                  $"VALUES ('{txtAccesionNumBorrow.Text}', 1, NOW(), '{cboPurpose.Text}', 'Borrowed', '{txtdue.Text}', '{txtBorrowerId.Text}')";
            config.Execute_CUD(sql, "Error executing query.", "Book has been borrowed in the library");

            // Check if the last copy has been issued
            sql = $"SELECT * FROM tblbooks WHERE AccessionNo = '{txtAccesionNumBorrow.Text}' AND NumberOfCopies = 0";
            config.singleResult(sql);

            if (config.dt.Rows.Count > 0)
            {
                // If the last copy has been issued, update the book status to 'Not Available'
                config.Execute_Query($"UPDATE tblbooks SET Status = 'Not Available' WHERE AccessionNo = '{txtAccesionNumBorrow.Text}'");
            }

            btnNew_Click(sender, e);
        }

        private void check_due_Tick(object sender, EventArgs e)
        {
        //    sql = "SELECT MINUTE(TIMEDIFF(Now(),DateBorrowed)),BorrowId FROM tblborrow Where  Status='Borrowed' AND purpose = 'Photocopy' "
        //checkOverduePurposed(sql, "Photocopy")
        //sql = "SELECT BorrowId FROM tblborrow Where  Status='Borrowed' AND Purpose = 'Research'"
        //checkOverduePurposed(sql, "Research")
        //sql = "SELECT HOUR( TIMEDIFF( NOW( ) ,  `DateBorrowed` ) ) AS  'time',`BorrowId` FROM   `tblborrow` Where Status='Borrowed' AND Purpose = 'Overnight'"
        //checkOverduePurposed(sql, "Overnight")
        //sql = "SELECT HOUR( TIMEDIFF( NOW( ) ,  `DateBorrowed` ) ) AS  'time',`BorrowId` FROM   `tblborrow` Where Status='Borrowed' AND Purpose = 'Overnight'"
        //checkOverduePurposed(sql, "Borrowed for 3days")
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void txt_Search_TextChanged(object sender, EventArgs e)
        {
            sql = " SELECT br.`AccessionNo`, `BookTitle`, `BookDesc` as 'Description',Concat(`Firstname`,' ', `Lastname`) as 'Borrower', `DateBorrowed`, `Purpose`, `DueDate` " +
                    " FROM `tblborrow` br,`tblbooks` b,`tblborrower` bw  " +
                    " WHERE br.AccessionNo=b.AccessionNo AND br.`BorrowerId`=bw.`BorrowerId` AND (BookTitle Like '%" + txt_Search.Text + "' or br.AccessionNo Like '%" + txt_Search.Text + "%' OR Concat(`Firstname`,' ', `Lastname`)  Like '%" + txt_Search.Text + "') ORDER BY BorrowId Desc";
            config.Load_ResultList(sql, dtg_BlistOfBooks);


        }

        private void TabPage3_Click(object sender, EventArgs e)
        {

        }
    }
}
