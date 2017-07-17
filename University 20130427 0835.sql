-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.30-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema uec
--

CREATE DATABASE IF NOT EXISTS uec;
USE uec;

--
-- Definition of table `application`
--

DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `appid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Application Identification Number',
  `Name` varchar(45) NOT NULL COMMENT 'First Name',
  `lname` varchar(45) DEFAULT NULL COMMENT 'Last Name',
  `email` varchar(45) DEFAULT NULL COMMENT 'Email',
  `gender` varchar(10) NOT NULL COMMENT 'Gender',
  `phone` varchar(13) DEFAULT NULL COMMENT 'Phone',
  `pcoll` varchar(45) NOT NULL COMMENT 'PUC College name',
  `ppercent` int(10) unsigned NOT NULL COMMENT 'PUC Percentage',
  `spercent` int(10) unsigned DEFAULT NULL COMMENT 'SSLC Percentage',
  `nationality` varchar(10) DEFAULT NULL COMMENT 'Nationality of student',
  `coll` int(10) unsigned DEFAULT '0' COMMENT 'Applied College',
  `course` int(10) unsigned DEFAULT NULL COMMENT 'Applied Course',
  `status` varchar(20) NOT NULL COMMENT 'Application status to track progress',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'Remarks',
  `dob` date DEFAULT NULL COMMENT 'Date of Birth',
  `medium` varchar(10) NOT NULL COMMENT 'Medium of Learning',
  `pucourse` varchar(45) DEFAULT NULL COMMENT 'PUC Course',
  `address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`appid`),
  UNIQUE KEY `unique` (`Name`,`lname`,`gender`,`course`,`coll`,`dob`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `application`
--

/*!40000 ALTER TABLE `application` DISABLE KEYS */;
/*!40000 ALTER TABLE `application` ENABLE KEYS */;


--
-- Definition of table `coll_course`
--

DROP TABLE IF EXISTS `coll_course`;
CREATE TABLE `coll_course` (
  `collid` int(10) unsigned NOT NULL,
  `courseid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`collid`,`courseid`),
  KEY `FK_course` (`courseid`),
  CONSTRAINT `FK_college` FOREIGN KEY (`collid`) REFERENCES `college` (`collid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_course` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coll_course`
--

/*!40000 ALTER TABLE `coll_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `coll_course` ENABLE KEYS */;


--
-- Definition of table `college`
--

DROP TABLE IF EXISTS `college`;
CREATE TABLE `college` (
  `collid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collname` varchar(100) NOT NULL,
  `colladd` varchar(150) DEFAULT NULL,
  `cuname` varchar(45) NOT NULL,
  `cpasswd` varchar(45) NOT NULL,
  PRIMARY KEY (`collid`),
  UNIQUE KEY `unique` (`collname`,`colladd`,`cuname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `college`
--

/*!40000 ALTER TABLE `college` DISABLE KEYS */;
/*!40000 ALTER TABLE `college` ENABLE KEYS */;


--
-- Definition of table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coname` varchar(90) NOT NULL,
  `codesc` varchar(300) DEFAULT NULL,
  `cosname` varchar(10) NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  PRIMARY KEY (`courseid`) USING BTREE,
  UNIQUE KEY `unique` (`coname`,`cosname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;


--
-- Definition of table `examiner`
--

DROP TABLE IF EXISTS `examiner`;
CREATE TABLE `examiner` (
  `euid` varchar(45) NOT NULL,
  `epasswd` varchar(45) NOT NULL,
  `college` int(10) unsigned NOT NULL,
  `course` int(10) unsigned NOT NULL,
  `sem` int(10) unsigned NOT NULL,
  `sub` int(10) unsigned NOT NULL,
  PRIMARY KEY (`euid`),
  UNIQUE KEY `Unique` (`euid`,`college`,`course`,`sem`),
  UNIQUE KEY `Unique2` (`college`,`course`,`sem`,`sub`) USING BTREE,
  KEY `FK_examiner_1` (`course`),
  KEY `FK_examiner_3` (`sub`),
  CONSTRAINT `FK_examiner_1` FOREIGN KEY (`course`) REFERENCES `course` (`courseid`),
  CONSTRAINT `FK_examiner_2` FOREIGN KEY (`college`) REFERENCES `college` (`collid`),
  CONSTRAINT `FK_examiner_3` FOREIGN KEY (`sub`) REFERENCES `subject` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examiner`
--

/*!40000 ALTER TABLE `examiner` DISABLE KEYS */;
/*!40000 ALTER TABLE `examiner` ENABLE KEYS */;


--
-- Definition of table `marks`
--

DROP TABLE IF EXISTS `marks`;
CREATE TABLE `marks` (
  `stuid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(200) NOT NULL,
  `marks` varchar(10) DEFAULT NULL,
  `sid` int(10) unsigned NOT NULL,
  KEY `FK_marks_2` (`sid`),
  KEY `Unique` (`stuid`,`sid`,`question`),
  CONSTRAINT `FK_marks_1` FOREIGN KEY (`stuid`) REFERENCES `student` (`stuid`),
  CONSTRAINT `FK_marks_2` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks`
--

/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;


--
-- Definition of table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `sid` int(10) unsigned NOT NULL,
  `question` varchar(200) NOT NULL,
  PRIMARY KEY (`question`,`sid`),
  KEY `FK_questions_1` (`sid`),
  CONSTRAINT `FK_questions_1` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;


--
-- Definition of table `semester`
--

DROP TABLE IF EXISTS `semester`;
CREATE TABLE `semester` (
  `semnumber` int(10) unsigned NOT NULL,
  `sid` int(10) unsigned NOT NULL,
  `courseid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`semnumber`,`sid`,`courseid`),
  KEY `FK_subject_sem` (`sid`),
  KEY `FK_course_sem` (`courseid`),
  CONSTRAINT `FK_course_sem` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_subject_sem` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester`
--

/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;


--
-- Definition of table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stuid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `pcoll` varchar(45) DEFAULT NULL,
  `ppercent` varchar(45) DEFAULT NULL,
  `spercent` varchar(45) DEFAULT NULL,
  `nationality` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `dob` date NOT NULL,
  `medium` varchar(10) DEFAULT NULL,
  `pucourse` varchar(45) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`stuid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


--
-- Definition of table `stusem`
--

DROP TABLE IF EXISTS `stusem`;
CREATE TABLE `stusem` (
  `stuid` int(10) unsigned NOT NULL,
  `collid` int(10) unsigned NOT NULL,
  `courseid` int(10) unsigned NOT NULL,
  `sem` int(10) unsigned NOT NULL,
  UNIQUE KEY `unique` (`courseid`,`stuid`,`collid`),
  KEY `FK_stusem_2` (`collid`),
  CONSTRAINT `FK_stusem_1` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`),
  CONSTRAINT `FK_stusem_2` FOREIGN KEY (`collid`) REFERENCES `college` (`collid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Relationship between student and semester....!';

--
-- Dumping data for table `stusem`
--

/*!40000 ALTER TABLE `stusem` DISABLE KEYS */;
/*!40000 ALTER TABLE `stusem` ENABLE KEYS */;


--
-- Definition of table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subname` varchar(200) NOT NULL,
  `subdesc` varchar(300) DEFAULT NULL,
  `subtype` varchar(10) NOT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `unique` (`subname`,`subtype`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
