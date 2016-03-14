-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2016 at 05:11 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ldc`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `article_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `article_title` varchar(50) NOT NULL,
  `article_text` mediumtext NOT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_arrange`
--

CREATE TABLE IF NOT EXISTS `test_arrange` (
  `arrange_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`arrange_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_fitbwc`
--

CREATE TABLE IF NOT EXISTS `test_fitbwc` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_fitbwc_answerfor`
--

CREATE TABLE IF NOT EXISTS `test_fitbwc_answerfor` (
  `choice_id` int(11) unsigned NOT NULL,
  `question_id` int(11) unsigned NOT NULL,
  `answer_for` varchar(50) NOT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_fitbwc_choices`
--

CREATE TABLE IF NOT EXISTS `test_fitbwc_choices` (
  `choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_ident`
--

CREATE TABLE IF NOT EXISTS `test_ident` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_ident_s`
--

CREATE TABLE IF NOT EXISTS `test_ident_s` (
  `ident_s_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ident_s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mc`
--

CREATE TABLE IF NOT EXISTS `test_mc` (
  `question_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mc2`
--

CREATE TABLE IF NOT EXISTS `test_mc2` (
  `question_id` int(11) NOT NULL,
  `question_text` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_mc2_choices`
--

CREATE TABLE IF NOT EXISTS `test_mc2_choices` (
  `choice_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `choice_text` int(200) NOT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mc2_qchoices`
--

CREATE TABLE IF NOT EXISTS `test_mc2_qchoices` (
  `question_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL,
  `is_correct` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_mcma`
--

CREATE TABLE IF NOT EXISTS `test_mcma` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mcma_choices`
--

CREATE TABLE IF NOT EXISTS `test_mcma_choices` (
  `choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mcma_qchoices`
--

CREATE TABLE IF NOT EXISTS `test_mcma_qchoices` (
  `question_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL,
  `is_correct` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_mc_choices`
--

CREATE TABLE IF NOT EXISTS `test_mc_choices` (
  `choice_id` int(11) NOT NULL,
  `choice_text` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_mc_qchoices`
--

CREATE TABLE IF NOT EXISTS `test_mc_qchoices` (
  `question_id` int(11) unsigned NOT NULL,
  `choice_id` int(11) unsigned NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  PRIMARY KEY (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_mt`
--

CREATE TABLE IF NOT EXISTS `test_mt` (
  `question_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_mt_qchoices`
--

CREATE TABLE IF NOT EXISTS `test_mt_qchoices` (
  `question_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL,
  `choice_text` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
