
--
-- Database: `tps_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `CompanyID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` text NOT NULL,
  `Address` text NOT NULL,
  `ContactNo` text NOT NULL,
  `Website` text NOT NULL,
  PRIMARY KEY (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `CourseID` int(11) NOT NULL AUTO_INCREMENT,
  `Coursename` text NOT NULL,
  `Branch` text NOT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `Username` varchar(50) NOT NULL,
  `Password` text NOT NULL,
  `NameOfUser` text NOT NULL,
  `ContactNo` text NOT NULL,
  `Email` text NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `ScholarNo` varchar(50) NOT NULL,
  `EnrollmentNo` text NOT NULL,
  `Studentname` text NOT NULL,
  `DOB` text NOT NULL,
  `Session` text NOT NULL,
  `Fathername` text NOT NULL,
  `Mothername` text NOT NULL,
  `Address` text NOT NULL,
  `ContactNo` text NOT NULL,
  `Email` text NOT NULL,
  `CourseID` int(11) NOT NULL,
  PRIMARY KEY (`ScholarNo`),
  KEY `CourseID` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `studentplacement`
--

CREATE TABLE IF NOT EXISTS `studentplacement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ScholarNo` varchar(50) NOT NULL,
  `CompanyID` int(11) NOT NULL,
  `Package` double NOT NULL,
  `PlacementDate` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `ScholarNo` (`ScholarNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `studenttraining`
--

CREATE TABLE IF NOT EXISTS `studenttraining` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ScholarNo` varchar(50) NOT NULL,
  `Companyname` text NOT NULL,
  `Address` text NOT NULL,
  `ContactNo` text NOT NULL,
  `Email` text NOT NULL,
  `TrainingDuration` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ScholarNo` (`ScholarNo`),
  KEY `ScholarNo_2` (`ScholarNo`),
  KEY `ScholarNo_3` (`ScholarNo`),
  KEY `ScholarNo_4` (`ScholarNo`),
  KEY `ScholarNo_5` (`ScholarNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `Username` varchar(50) NOT NULL,
  `User_Password` text NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Username`, `User_Password`) VALUES
('admin', '12345');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON UPDATE CASCADE;

--
-- Constraints for table `studentplacement`
--
ALTER TABLE `studentplacement`
  ADD CONSTRAINT `studentplacement_ibfk_3` FOREIGN KEY (`ScholarNo`) REFERENCES `student` (`ScholarNo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `studentplacement_ibfk_2` FOREIGN KEY (`CompanyID`) REFERENCES `company` (`CompanyID`) ON UPDATE CASCADE;

--
-- Constraints for table `studenttraining`
--
ALTER TABLE `studenttraining`
  ADD CONSTRAINT `studenttraining_ibfk_1` FOREIGN KEY (`ScholarNo`) REFERENCES `student` (`ScholarNo`) ON UPDATE CASCADE;

