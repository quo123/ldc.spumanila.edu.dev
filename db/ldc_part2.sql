-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2016 at 03:31 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ldc_part2`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `article_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `article_title` varchar(50) CHARACTER SET utf8 NOT NULL,
  `article_text` mediumtext CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_fitbb_answerfor`
--

CREATE TABLE IF NOT EXISTS `test_fitbb_answerfor` (
  `choice_id` int(11) unsigned NOT NULL,
  `question_id` int(11) unsigned NOT NULL,
  `answer_for` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_fitbb_choices`
--

CREATE TABLE IF NOT EXISTS `test_fitbb_choices` (
  `choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mc2_choices`
--

CREATE TABLE IF NOT EXISTS `test_mc2_choices` (
  `choice_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mca`
--

CREATE TABLE IF NOT EXISTS `test_mca` (
  `question_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mca2`
--

CREATE TABLE IF NOT EXISTS `test_mca2` (
  `question_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mca2_qchoices`
--

CREATE TABLE IF NOT EXISTS `test_mca2_qchoices` (
  `question_id` int(11) unsigned NOT NULL,
  `choice_id` int(11) unsigned NOT NULL,
  `is_correct` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_mca_choices`
--

CREATE TABLE IF NOT EXISTS `test_mca_choices` (
  `choice_id` int(11) NOT NULL,
  `choice_text` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_mca_qchoices`
--

CREATE TABLE IF NOT EXISTS `test_mca_qchoices` (
  `question_id` int(11) unsigned NOT NULL,
  `choice_id` int(11) unsigned NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_mcb3`
--

CREATE TABLE IF NOT EXISTS `test_mcb3` (
  `question_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mcb3_choices`
--

CREATE TABLE IF NOT EXISTS `test_mcb3_choices` (
  `choice_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `choice_text` text NOT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mcb3_qchoices`
--

CREATE TABLE IF NOT EXISTS `test_mcb3_qchoices` (
  `question_id` int(11) unsigned NOT NULL,
  `choice_id` int(11) unsigned NOT NULL,
  `is_correct` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_mtc`
--

CREATE TABLE IF NOT EXISTS `test_mtc` (
  `question_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mtc_qchoices`
--

CREATE TABLE IF NOT EXISTS `test_mtc_qchoices` (
  `question_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL,
  `choice_text` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
