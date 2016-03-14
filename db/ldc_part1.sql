-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2016 at 03:58 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ldc_part1`
--

-- --------------------------------------------------------

--
-- Table structure for table `test_fitb1_iv_answerfor`
--

CREATE TABLE IF NOT EXISTS `test_fitb1_iv_answerfor` (
  `choice_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_for` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_fitb1_iv_choices`
--

CREATE TABLE IF NOT EXISTS `test_fitb1_iv_choices` (
  `choice_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_fitb2_v_answerfor`
--

CREATE TABLE IF NOT EXISTS `test_fitb2_v_answerfor` (
  `choice_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_for` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_fitb2_v_choices`
--

CREATE TABLE IF NOT EXISTS `test_fitb2_v_choices` (
  `choice_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `choice_text` int(11) NOT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_fitb3_ix_answerfor`
--

CREATE TABLE IF NOT EXISTS `test_fitb3_ix_answerfor` (
  `choice_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_for` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_fitb3_ix_choices`
--

CREATE TABLE IF NOT EXISTS `test_fitb3_ix_choices` (
  `choice_id` int(11) unsigned NOT NULL,
  `choice_text` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_identification1_ii`
--

CREATE TABLE IF NOT EXISTS `test_identification1_ii` (
  `question_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  `correct_answer` varchar(100) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_identification2_viii`
--

CREATE TABLE IF NOT EXISTS `test_identification2_viii` (
  `question_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  `correct_answer` varchar(100) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mc1_i`
--

CREATE TABLE IF NOT EXISTS `test_mc1_i` (
  `question_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mc1_i_choices`
--

CREATE TABLE IF NOT EXISTS `test_mc1_i_choices` (
  `choice_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mc1_i_qchoices`
--

CREATE TABLE IF NOT EXISTS `test_mc1_i_qchoices` (
  `question_id` int(11) unsigned NOT NULL,
  `choice_id` int(11) unsigned NOT NULL,
  `is_correct` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_mc2_iii`
--

CREATE TABLE IF NOT EXISTS `test_mc2_iii` (
  `question_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mc2_iii_choices`
--

CREATE TABLE IF NOT EXISTS `test_mc2_iii_choices` (
  `choice_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mc2_iii_qchoices`
--

CREATE TABLE IF NOT EXISTS `test_mc2_iii_qchoices` (
  `question_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL,
  `is_correct` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_mc3_vii`
--

CREATE TABLE IF NOT EXISTS `test_mc3_vii` (
  `question_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mc3_vii_choices`
--

CREATE TABLE IF NOT EXISTS `test_mc3_vii_choices` (
  `choice_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mc3_vii_qchoices`
--

CREATE TABLE IF NOT EXISTS `test_mc3_vii_qchoices` (
  `question_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL,
  `is_correct` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
