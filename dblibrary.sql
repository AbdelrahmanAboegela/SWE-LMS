SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
--
-- Database: `dblibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblbooknumber`
--

CREATE TABLE `tblbooknumber` (
  `ID` int(11) NOT NULL,
  `BOOKTITLE` varchar(255) NOT NULL,
  `QTY` int(11) NOT NULL,
  `Desc` varchar(90) NOT NULL,
  `Author` varchar(90) NOT NULL,
  `PublishDate` date NOT NULL,
  `Publisher` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbooknumber`
--

INSERT INTO `tblbooknumber` (`ID`, `BOOKTITLE`, `QTY`, `Desc`, `Author`, `PublishDate`, `Publisher`) VALUES
(5, 'life of juan', 4, 'life of juan', 'unknown', '2016-10-10', 'unknown'),
(6, 'the computerizez system', 2, 'computer', 'unknown', '2016-10-10', 'unknown'),
(7, 'language of us', 2, 'language', 'unknown', '2016-10-10', 'unknown'),
(8, 'science', 2, 'invention of science', 'unknown', '2016-10-10', 'unknown'),
(9, 'book', 4, 'book revised', 'unknown', '2016-10-10', 'unknown'),
(10, 'the only book', 1, 'book', 'unknown', '2016-10-10', 'uknown'),
(11, 'book  now', 2, 'book', 'unknown', '2016-10-10', 'unknown'),
(12, 'the one', 1, 'book1', 'unknown', '2016-10-10', 'unknown'),
(13, 'the life of june', 2, 'journey', 'unknown', '2016-10-10', 'unknown'),
(14, 'title', 1, 'book', 'unknown', '2016-10-10', 'unknown'),
(15, 'sad', 1, 's', 'da', '2018-03-25', 'as'),
(16, '2wqe', 1, 'wqe', 'wqe', '2018-03-25', 'wqe');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooks`
--

CREATE TABLE `tblbooks` (
  `BookID` int(11) NOT NULL,
  `AccessionNo` varchar(90) NOT NULL,
  `BookTitle` varchar(125) NOT NULL,
  `BookDesc` varchar(255) NOT NULL,
  `Author` varchar(125) NOT NULL,
  `PublishDate` date NOT NULL,
  `BookPublisher` varchar(125) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `BookPrice` double NOT NULL,
  `BookQuantity` int(11) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `BookType` varchar(90) NOT NULL,
  `DeweyDecimal` varchar(90) NOT NULL,
  `OverAllQty` int(11) NOT NULL,
  `Donate` tinyint(1) NOT NULL,
  `Remark` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbooks`
--

INSERT INTO `tblbooks` (`BookID`, `AccessionNo`, `BookTitle`, `BookDesc`, `Author`, `PublishDate`, `BookPublisher`, `CategoryId`, `BookPrice`, `BookQuantity`, `Status`, `BookType`, `DeweyDecimal`, `OverAllQty`, `Donate`, `Remark`) VALUES
(1, '12345678', 'life of juan', 'life of jose and maria', 'unknown', '2016-10-10', 'unknown', 10, 175, 1, 'Available', 'Fiction', 'Purchased', 1, 0, 'Donate'),
(2, '12345671', 'the computerizez system', 'computer', 'unknown', '2016-10-10', 'unknown', 1, 200, 1, 'Available', 'Fiction', '000', 1, 0, 'Donate'),
(3, '12345672', 'languages', 'language', 'unknown', '2016-10-10', 'unknown', 5, 180, 1, 'Available', 'Non-Fiction', '400', 1, 0, 'Purchased'),
(4, '12345673', 'science', 'invention of science', 'unknown', '2016-10-10', 'unknown', 6, 185, 1, 'Available', 'Non-Fiction', '500', 1, 0, 'Purchased'),
(5, '1345672', 'life of juan', 'life of juan', 'unknown', '2016-10-10', 'unknown', 10, 175, 1, 'Available', 'Fiction', '900', 1, 0, 'Purchased'),
(6, '1345673', 'life of juan', 'life of juan', 'unknown', '2016-10-10', 'unknown', 10, 185, 1, 'Available', 'Fiction', '900', 1, 0, 'Purchased'),
(7, '14256372', 'science', 'invention of science', 'unknown', '2016-10-10', 'unknown', 6, 185, 1, 'Available', 'Fiction', '500', 1, 0, 'Purchased'),
(8, '15243678', 'book', 'book revised', 'unknown', '2016-10-10', 'unknown', 7, 109, 1, 'Available', 'Fiction', '600', 1, 0, 'Purchased'),
(9, '15263712', 'language of us', 'language', 'unknown', '2016-10-10', 'unknown', 5, 100, 1, 'Available', 'Fiction', '400', 1, 0, 'Donate'),
(10, '19872634', 'book', 'book revised', 'unknown', '2016-10-10', 'unknown', 7, 190, 1, 'Available', 'Fiction', '600', 1, 0, 'Purchased'),
(11, '18293746', 'the only book', 'book', 'unknown', '2016-10-10', 'uknown', 8, 120, 1, 'Available', 'Unknown', '700', 1, 0, 'Donate'),
(12, '11726354', 'book  now', 'book', 'unknown', '2016-10-10', 'unknown', 8, 150, 1, 'Available', 'Unknown', '700', 1, 0, 'Purchased'),
(13, '10928273', 'the one', 'book1', 'unknown', '2016-10-10', 'unknown', 4, 210, 1, 'Available', 'Unknown', '300', 1, 0, 'Purchased'),
(14, '10987654', 'book', 'book3', 'unknown', '2016-10-16', 'unknown', 7, 125, 1, 'Available', 'Unknown', '600', 1, 0, 'Purchased'),
(15, '98172634', 'the life of june', 'journey', 'unknown', '2016-10-10', 'unknown', 6, 100, 1, 'Available', 'Fiction', '500', 1, 0, 'Donate'),
(16, '19282736', 'the life of june', 'journey', 'unknown', '2016-10-16', 'unknown', 6, 100, 1, 'Available', 'Non-Fiction', '500', 1, 0, 'Purchased'),
(17, '9812345', 'book', 'one', 'unkwon', '2016-11-14', 'unkown', 5, 90, 1, 'Available', 'Fiction', '400', 1, 0, 'Purchased'),
(18, '12345670', 'the computerizez system', 'computer', 'un', '2016-10-10', 'unknown', 1, 200, 1, 'Available', 'Fiction', '000', 1, 0, 'Purchased'),
(19, '12345677', 'life of juan', 'life of juan and jose', 'unknown', '2016-10-10', 'unknown', 10, 0, 1, 'Available', 'Fiction', '900', 1, 0, 'Donate'),
(20, '117263548', 'book  now', 'book one', 'unknown', '2016-10-10', 'unknown', 8, 0, 1, 'Available', 'Unknown', '700', 1, 0, 'Purchased'),
(21, '9876547', 'title', 'book', 'unknown', '2016-10-10', 'unknown', 7, 370, 1, 'Available', 'Fiction', '600', 1, 0, 'Purchased');

-- --------------------------------------------------------

--
-- Table structure for table `tblborrow`
--

CREATE TABLE `tblborrow` (
  `BorrowId` int(11) NOT NULL,
  `AccessionNo` varchar(90) NOT NULL,
  `NoCopies` int(11) NOT NULL,
  `DateBorrowed` datetime NOT NULL,
  `Purpose` varchar(90) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `DueDate` datetime NOT NULL,
  `BorrowerId` int(11) NOT NULL,
  `Due` tinyint(1) NOT NULL,
  `Remarks` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblborrow`
--

INSERT INTO `tblborrow` (`BorrowId`, `AccessionNo`, `NoCopies`, `DateBorrowed`, `Purpose`, `Status`, `DueDate`, `BorrowerId`, `Due`, `Remarks`) VALUES
(1, '15263712', 1, '2016-10-10 13:32:12', 'Borrowed for 3days', 'Returned', '2016-10-13 13:32:12', 4321, 0, 'On Time'),
(2, '12345671', 1, '2016-10-10 13:32:38', 'Borrowed for 3days', 'Returned', '2016-10-13 13:32:38', 912, 0, 'On Time'),
(3, '18293746', 1, '2016-10-10 13:37:13', 'Overnight', 'Returned', '2016-10-11 13:37:13', 921, 0, 'On Time'),
(4, '11726354', 1, '2016-10-10 13:37:36', 'Photocopy', 'Returned', '2016-10-10 14:07:36', 9213, 0, 'On Time'),
(5, '12345678', 1, '2016-10-10 13:50:29', 'Borrowed for 3days', 'Returned', '2016-10-13 13:50:29', 9213, 0, 'On Time'),
(6, '12345673', 1, '2016-10-10 13:50:47', 'Overnight', 'Returned', '2016-10-11 13:50:47', 9213, 0, 'On Time'),
(7, '1345672', 1, '2016-10-10 13:51:07', 'Borrowed for 3days', 'Returned', '2016-10-13 13:51:07', 4321, 0, 'On Time'),
(8, '15243678', 1, '2016-10-10 13:51:27', 'Borrowed for 3days', 'Returned', '2016-10-13 13:51:27', 4321, 0, 'On Time'),
(9, '18293746', 1, '2016-10-10 13:55:23', 'Photocopy', 'Returned', '2016-10-10 14:25:23', 9213, 0, 'On Time'),
(10, '11726354', 1, '2016-10-10 13:55:51', 'Photocopy', 'Returned', '2016-10-10 14:25:51', 9213, 0, 'On Time'),
(11, '10928273', 1, '2016-10-10 13:57:44', 'Research', 'Returned', '2016-10-10 17:30:00', 9213, 0, 'On Time'),
(12, '12345678', 1, '2016-10-10 15:34:20', 'Borrowed for 3days', 'Returned', '2016-10-19 15:33:31', 912, 0, 'On Time'),
(13, '98172634', 1, '2016-10-10 15:34:41', 'Borrowed for 3days', 'Returned', '2016-10-19 15:33:53', 912, 0, 'On Time'),
(14, '9812345', 1, '2016-11-08 08:42:09', 'Borrowed for 3days', 'Returned', '2016-11-17 08:40:38', 912, 0, 'On Time'),
(15, '12345673', 1, '2016-11-08 08:46:40', 'Overnight', 'Returned', '2016-11-15 08:45:08', 912, 0, 'On Time'),
(16, '12345673', 1, '2016-11-08 08:53:53', 'Overnight', 'Returned', '2016-11-09 08:52:21', 912, 0, 'Overdue'),
(17, '19872634', 1, '2016-11-08 15:09:46', 'Borrowed for 3days', 'Returned', '2016-11-11 15:09:46', 213, 0, 'On Time'),
(18, '12345673', 1, '2016-11-17 13:58:29', 'Overnight', 'Returned', '2016-11-18 13:58:29', 912, 0, 'Overdue'),
(19, '12345671', 1, '2016-11-17 13:58:59', 'Borrowed for 3days', 'Returned', '2016-11-20 13:58:59', 912, 0, 'Overdue'),
(20, '1345672', 1, '2016-11-22 14:16:03', 'Borrowed for 3days', 'Returned', '2016-11-25 14:16:03', 912, 0, 'Overdue'),
(21, '18293746', 1, '2016-11-22 14:16:24', 'Research', 'Returned', '2016-11-22 17:30:00', 912, 0, 'Overdue'),
(22, '12345678', 1, '2016-11-29 14:19:24', 'Borrowed for 3days', 'Returned', '2016-12-02 14:19:24', 1234, 0, 'On Time'),
(23, '12345673', 1, '2018-02-09 04:03:56', 'Photocopy', 'Returned', '2018-02-09 04:33:56', 123432, 0, 'On Time'),
(24, '12345673', 1, '2018-03-03 07:13:36', 'Research', 'Returned', '2018-03-03 11:30:00', 921, 0, 'On Time'),
(25, '1345673', 1, '2018-03-23 19:01:51', 'Overnight', 'Returned', '2018-03-24 19:01:51', 1234, 0, 'Overdue'),
(26, '1345673', 1, '2018-03-27 01:51:19', 'Research', 'Returned', '2018-03-27 11:30:00', 123432, 0, 'On Time');

-- --------------------------------------------------------

--
-- Table structure for table `tblborrower`
--

CREATE TABLE `tblborrower` (
  `IDNO` int(11) NOT NULL,
  `BorrowerId` varchar(90) NOT NULL,
  `Firstname` varchar(125) NOT NULL,
  `Lastname` varchar(125) NOT NULL,
  `MiddleName` varchar(125) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Sex` varchar(11) NOT NULL,
  `ContactNo` varchar(125) NOT NULL,
  `CourseYear` varchar(125) NOT NULL,
  `BorrowerPhoto` varchar(255) NOT NULL,
  `BorrowerType` varchar(35) NOT NULL,
  `Stats` varchar(36) NOT NULL,
  `IMGBLOB` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblborrower`
--

INSERT INTO `tblborrower` (`IDNO`, `BorrowerId`, `Firstname`, `Lastname`, `MiddleName`, `Address`, `Sex`, `ContactNo`, `CourseYear`, `BorrowerPhoto`, `BorrowerType`, `Stats`, `IMGBLOB`) VALUES
(1, '119', 'jom', 'lozada', 'baron', 'ilog', 'Female', '0920', 'BEED', 'Chrysanthemum.jpg', 'Student', '', ''),
(2, '213', 'Janno', 'Palacios', 'E', 'kabankalan City', 'Male', '0192836383', 'BSIT-2', 'Chrysanthemum.jpg', 'Student', 'Active', ''),
(3, '912', 'lou', 'gotera', 'velez', 'rizal', 'Female', '0930', 'BSIT', 'Hydrangeas.jpg', 'Student', 'Active', ''),
(4, '921', 'joma', 'baron', 'lozada', 'dancalan', 'Female', '0921', '', 'Desert.jpg', 'Student', '', ''),
(5, '1234', 'ambot', 'sure', 'guess', 'unknown', 'Male', '0907', 'ELECTRONICS', 'Koala.jpg', 'Student', 'NotActive', ''),
(6, '4321', 'John Craig', 'Nillos', 'Palacios', 'Dancalan Ilog', 'Male', '1233213123', 'BSIT-1', 'Wonderful-Room-King.jpg', 'Student', 'Active', ''),
(7, '9213', 'lou', 'velez', 'gotera', 'rizal', 'Female', '0930', 'BSIT', 'Lighthouse.jpg', 'Student', 'NotActive', ''),
(8, '54321', 'virgel', 'tem', 'brevilla', 'unknown', 'Female', '0930', 'BEED', 'ARIEL 6.jpg', 'Student', 'Active', ''),
(9, '123432', 'Mark', 'Palacios', 'E', 'Galicia Ilog', 'Male', '09291918272', 'HRM-1', 'Chrysanthemum.jpg', 'Student', 'Active', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `CategoryId` int(11) NOT NULL,
  `Category` varchar(125) NOT NULL,
  `DDecimal` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`CategoryId`, `Category`, `DDecimal`) VALUES
(1, 'Computers, Information and General Reference', '000'),
(2, 'Philosophy and Psychology', '100'),
(3, 'Religion', '200'),
(4, 'Social Science', '300'),
(5, 'Language', '400'),
(6, 'Science', '500'),
(7, 'Technology', '600'),
(8, 'Arts and Recreation', '700'),
(9, 'Literature', '800'),
(10, 'History and Geography', '900'),
(12, 'ALL', 'ALL');

-----------------------------------------------------------

--
-- Table structure for table `tblreturn`
--

CREATE TABLE `tblreturn` (
  `ReturnId` int(11) NOT NULL,
  `BorrowId` int(11) NOT NULL,
  `NoCopies` int(11) NOT NULL,
  `DateReturned` datetime NOT NULL,
  `Remarks` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblreturn`
--

INSERT INTO `tblreturn` (`ReturnId`, `BorrowId`, `NoCopies`, `DateReturned`, `Remarks`) VALUES
(1, 4, 1, '2016-10-10 13:49:44', 'Returned'),
(2, 3, 1, '2016-10-10 13:49:52', 'Returned'),
(3, 2, 1, '2016-10-10 13:49:59', 'Returned'),
(4, 1, 1, '2016-10-10 13:50:03', 'Returned'),
(5, 6, 1, '2016-10-10 13:54:38', 'Returned'),
(6, 5, 1, '2016-10-10 13:59:33', 'Returned'),
(7, 8, 1, '2016-10-10 13:59:38', 'Returned'),
(8, 9, 1, '2016-10-10 13:59:43', 'Returned'),
(9, 7, 1, '2016-10-10 13:59:46', 'Returned'),
(10, 11, 1, '2016-10-10 13:59:51', 'Returned'),
(11, 10, 1, '2016-10-10 13:59:55', 'Returned'),
(12, 12, 1, '2016-10-10 15:38:26', 'Returned'),
(13, 13, 1, '2016-10-10 15:38:31', 'Returned'),
(14, 15, 1, '2016-11-08 08:53:00', 'Returned'),
(15, 14, 1, '2016-11-25 09:00:00', 'Returned'),
(16, 17, 1, '2016-11-16 15:24:56', 'Returned'),
(17, 12345673, 1, '2016-11-22 14:14:14', 'Returned'),
(18, 12345673, 1, '2016-11-22 14:14:28', 'Returned'),
(19, 12345671, 1, '2016-11-22 14:15:33', 'Returned'),
(20, 22, 1, '2018-01-22 09:14:12', 'Returned'),
(21, 18293746, 1, '2018-02-09 03:48:49', 'Returned'),
(22, 1345672, 1, '2018-02-09 03:49:01', 'Returned'),
(23, 23, 1, '2018-02-09 04:04:23', 'Returned'),
(24, 24, 1, '2018-03-26 19:06:39', 'Returned'),
(25, 1345673, 1, '2018-03-26 19:39:09', 'Returned'),
(26, 26, 1, '2018-08-07 10:22:26', 'Returned');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `UserId` int(11) NOT NULL,
  `Fullname` varchar(124) NOT NULL,
  `User_name` varchar(125) NOT NULL,
  `Pass` varchar(125) NOT NULL,
  `UserRole` varchar(125) NOT NULL,
  `Status` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`UserId`, `Fullname`, `User_name`, `Pass`, `UserRole`, `Status`) VALUES
(3, 'Janno Palacios', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Librarian', 'Active'),
(4, 'Craig', 'librarian', '93c768d0152f72bc8d5e782c0b585acc35fb0442', 'Librarian', 'NotActive'),
(5, 'sad', 'sad', 'b4914600112ba18af7798b6c1a1363728ae1d96f', 'Librarian', 'NotActive'),
(6, 'asd', 'sd', '930a0029225aa4c28b8ef095b679285eaae27078', 'Administrator', 'NotActive'),
(7, 'cherry lou velez', 'lou', '15106e6aa53a70c18cb7ee7aa2658c931cd06f69', 'Librarian', 'NotActive'),
(8, 'velez lou', 'velez', 'fbe2b1ad416b7e3251086de11ad56d27ec6f72a3', 'Librarian', 'Active'),
(9, 'jom', 'lozada', 'e1b83874fa199b6a53a8334aeebd578fa8064111', 'Assistant', 'Active'),
(10, 'akon', 'a', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', 'Assistant', 'NotActive');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblbooknumber`
--
ALTER TABLE `tblbooknumber`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblbooks`
--
ALTER TABLE `tblbooks`
  ADD PRIMARY KEY (`BookID`);

--
-- Indexes for table `tblborrow`
--
ALTER TABLE `tblborrow`
  ADD PRIMARY KEY (`BorrowId`);

--
-- Indexes for table `tblborrower`
--
ALTER TABLE `tblborrower`
  ADD PRIMARY KEY (`IDNO`),
  ADD UNIQUE KEY `BorrowerId` (`BorrowerId`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`CategoryId`);


--
-- Indexes for table `tblreturn`
--
ALTER TABLE `tblreturn`
  ADD PRIMARY KEY (`ReturnId`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblbooknumber`
--
ALTER TABLE `tblbooknumber`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblbooks`
--
ALTER TABLE `tblbooks`
  MODIFY `BookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblborrow`
--
ALTER TABLE `tblborrow`
  MODIFY `BorrowId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tblborrower`
--
ALTER TABLE `tblborrower`
  MODIFY `IDNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblreturn`
--
ALTER TABLE `tblreturn`
  MODIFY `ReturnId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

