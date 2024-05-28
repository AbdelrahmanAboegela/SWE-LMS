using System;
using System.Data;
using System.Windows.Forms;
using LibrarySystem.Includes;

namespace LibrarySystem
{
    public partial class frmBooks : Form
    {
        private readonly SQLConfig config = new SQLConfig();
        private readonly usableFunction funct = new usableFunction();
        private string sql;

        public frmBooks()
        {
            InitializeComponent();
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            funct.clearTxt(this);

            // Load book information from the database
            sql = "SELECT `AccessionNo`, `BookTitle`, `BookDesc` as 'Description', `Author`, `PublishDate`, `BookPublisher`, `Category`, BookType as 'TypeOfBooks', NumberOfCopies, Status FROM `tblbooks` b, `tblcategory` c WHERE b.`CategoryId`=c.`CategoryId` ";
            config.Load_ResultList(sql, dtgList);

            // Load category information for combo box
            sql = "SELECT CategoryId, Category FROM tblcategory WHERE Category != 'ALL' ORDER BY CATEGORY ASC";
            config.fiil_CBO(sql, cboCategory);

            btnUpdate.Enabled = false;
            btnSave.Enabled = true;
            btnDelete.Enabled = false;
        }

        private void frmBooks_Load(object sender, EventArgs e)
        {
            // Trigger new button click event when the form loads
            btnNew_Click(sender, e);
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            string datePublish = dtpDatePublish.Text;

            // Validate required fields including the number of copies
            if (string.IsNullOrWhiteSpace(txtAccessionNo.Text) ||
                string.IsNullOrWhiteSpace(txtAuthor.Text) ||
                string.IsNullOrWhiteSpace(txtTitle.Text) ||
                string.IsNullOrWhiteSpace(txtDesc.Text) ||
                string.IsNullOrWhiteSpace(txtPublisher.Text) ||
                string.IsNullOrWhiteSpace(numofcopies.Text))
            {
                MessageBox.Show("All fields are required to be filled up, including the number of copies.", "Invalid", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            // Check if AccessionNo is already in use
            sql = "SELECT * FROM `tblbooks` WHERE `AccessionNo` = '" + txtAccessionNo.Text + "'";
            config.singleResult(sql);

            if (config.dt.Rows.Count > 0)
            {
                MessageBox.Show("Accession number is already in use.", "Invalid", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            // Modified INSERT statement with NumberOfCopies column
            sql = "INSERT INTO `tblbooks` " +
                  "(`AccessionNo`, `BookTitle`, `BookDesc`, `Author`, `PublishDate`, `BookPublisher`, `CategoryId`, `BookQuantity`, `Status`, `BookType`, `NumberOfCopies`) " +
                  $"VALUES ('{txtAccessionNo.Text}', '{txtTitle.Text}', '{txtDesc.Text}', '{txtAuthor.Text}', '{datePublish}', '{txtPublisher.Text}', '{cboCategory.SelectedValue}', 1, 'Available', '{cboType.Text}', {numofcopies.Text})";

            // Execute the INSERT query
            config.Execute_CUD(sql, "Failed to execute the query.", "Books have been saved in the database");

            // Check if the book is already in the tblbooknumber table
            sql = $"SELECT * FROM `tblbooknumber` WHERE `BOOKTITLE` = '{txtTitle.Text}'";
            config.singleResult(sql);

            if (config.dt.Rows.Count > 0)
            {
                // Update the QTY if the book is already in tblbooknumber
                sql = $"UPDATE `tblbooknumber` SET `QTY`=`QTY`+ {numofcopies.Text} WHERE `BOOKTITLE`='{txtTitle.Text}'";
                config.Execute_Query(sql);
            }
            else
            {
                // Insert the book into tblbooknumber if it's not present
                sql = $"INSERT INTO `tblbooknumber` (`BOOKTITLE`, `QTY`, `Desc`, `Author`, `PublishDate`, `Publisher`) " +
                      $"VALUES ('{txtTitle.Text}', {numofcopies.Text}, '{txtDesc.Text}', '{txtAuthor.Text}', '{datePublish}', '{txtPublisher.Text}')";
                config.Execute_Query(sql);
            }

            // Check if the number of copies is zero and update the status
            if (Convert.ToInt32(numofcopies.Text) == 0)
            {
                sql = $"UPDATE `tblbooks` SET `Status`='Not Available' WHERE `AccessionNo`='{txtAccessionNo.Text}'";
                config.Execute_Query(sql);
            }

            // Reload the form data
            frmBooks_Load(sender, e);
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            string datePublish = dtpDatePublish.Text;

            // Validate required fields
            if (string.IsNullOrWhiteSpace(txtAccessionNo.Text) ||
                string.IsNullOrWhiteSpace(txtAuthor.Text) ||
                string.IsNullOrWhiteSpace(txtTitle.Text) ||
                string.IsNullOrWhiteSpace(txtDesc.Text) ||
                string.IsNullOrWhiteSpace(txtPublisher.Text))
            {
                MessageBox.Show("All fields are required to be filled up.", "Invalid", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            // Update book information
            sql = $"UPDATE `tblbooks` SET `BookTitle`='{txtTitle.Text}', `BookDesc`='{txtDesc.Text}', `Author`='{txtAuthor.Text}', " +
                  $"`PublishDate`='{datePublish}', `BookPublisher`='{txtPublisher.Text}', `CategoryId`='{cboCategory.SelectedValue}', " +
                  $"`BookType`='{cboType.Text}', `NumberOfCopies`={numofcopies.Text} WHERE `AccessionNo`='{txtAccessionNo.Text}'";

            // Execute the UPDATE query
            config.Execute_CUD(sql, "Failed to execute the query.", "Books have been updated in the database");

            // If NumberOfCopies reaches 0, set the status to 'Not Available'
            if (Convert.ToInt32(numofcopies.Text) == 0)
            {
                sql = $"UPDATE `tblbooks` SET `Status`='Not Available' WHERE `AccessionNo`='{txtAccessionNo.Text}'";
                config.Execute_Query(sql);
            }

            // Reload the form data
            frmBooks_Load(sender, e);
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            // Delete book from the database
            sql = $"DELETE FROM `tblbooks` WHERE `AccessionNo` = '{txtAccessionNo.Text}'";
            config.Execute_CUD(sql, "Failed to execute the query.", "Books have been deleted from the database");

            // Delete book from tblbooknumber
            sql = $"DELETE FROM `tblbooknumber` WHERE `BOOKTITLE`='{txtTitle.Text}'";
            config.Execute_Query(sql);

            // Reload the form data
            frmBooks_Load(sender, e);
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            // Close the form
            this.Close();
        }

        private void dtgList_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            // Populate text box with selected AccessionNo
            txtAccessionNo.Text = dtgList.CurrentRow.Cells[0].Value.ToString();
        }

        private void txtAccessionNo_TextChanged(object sender, EventArgs e)
        {
            try
            {
                // Load book information based on AccessionNo
                sql = $"SELECT `AccessionNo`, `BookTitle`, `BookDesc`, `Author`, `PublishDate`, `BookPublisher`, `Category`, BookType as 'TypeOfBooks', NumberOfCopies, Status FROM `tblbooks` b, `tblcategory` c WHERE b.`CategoryId`=c.`CategoryId` AND  `AccessionNo`= '{txtAccessionNo.Text}'";
                config.singleResult(sql);

                // Check if book exists
                if (config.dt.Rows.Count > 0)
                {
                    // Populate text boxes with book information
                    txtTitle.Text = config.dt.Rows[0].Field<string>(1);
                    txtDesc.Text = config.dt.Rows[0].Field<string>(2);
                    txtAuthor.Text = config.dt.Rows[0].Field<string>(3);
                    dtpDatePublish.Text = config.dt.Rows[0].Field<DateTime>(4).ToString();
                    txtPublisher.Text = config.dt.Rows[0].Field<string>(5);
                    cboCategory.Text = config.dt.Rows[0].Field<string>(6);
                    cboType.Text = config.dt.Rows[0].Field<string>(7);
                    numofcopies.Text = config.dt.Rows[0].Field<int>(8).ToString();

                    // Enable or disable buttons based on the book status
                    btnUpdate.Enabled = true;
                    btnSave.Enabled = false;
                    btnDelete.Enabled = true;
                }
                else
                {
                    // Clear text boxes and set default values
                    txtTitle.Clear();
                    txtDesc.Clear();
                    txtAuthor.Clear();
                    txtPublisher.Clear();
                    cboType.Text = "Unknown";

                    // Load category information for combo box
                    sql = "SELECT CategoryId, Category FROM tblcategory";
                    config.fiil_CBO(sql, cboCategory);

                    // Set default date
                    dtpDatePublish.Text = DateTime.Now.ToString("yyyy-MM-dd");

                    // Enable or disable buttons based on the book status
                    btnUpdate.Enabled = false;
                    btnSave.Enabled = true;
                    btnDelete.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                // Display exception message
                this.Text = ex.Message;
            }
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            // Load search results based on the search text
            sql = $"SELECT `AccessionNo`, `BookTitle`, `BookDesc` as 'Description', `Author`, `PublishDate`, `BookPublisher`, `Category`, BookType as 'TypeOfBooks', NumberOfCopies, Status FROM `tblbooks` b, `tblcategory` c WHERE b.`CategoryId`=c.`CategoryId` AND (`BookTitle` Like '%{txtSearch.Text}%' OR `Author` Like '%{txtSearch.Text}%' OR `AccessionNo`  Like '%{txtSearch.Text}%')";
            config.Load_ResultList(sql, dtgList);
        }
    }
}
