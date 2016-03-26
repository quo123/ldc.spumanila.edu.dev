-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2016 at 01:58 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE IF NOT EXISTS `userinfo` (
  `userid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `userpass` varchar(128) NOT NULL,
  `regdate` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `level` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`userid`, `username`, `userpass`, `regdate`, `status`, `level`) VALUES
(1, '001', '0694c34c26a3be23a5807e5b50cd851de6605f480172213d7d7a9b39ed3f9e0060c6865656e2bce6d27b685f2fbab38596c8660c9807cc224f0be19d3ed92505', 'March 14, 2016, 02:04:52.321668', 1, 0),
(2, '002', '8fb42be041d3e1d7263e5c884e49dd0c8954e54031b019ce5d06d039a4b8874451138861b12a8b2f9c9b0dd3bedbb9feaebaa07620a59720cbbd9edf816945e6', 'March 24, 2016, 16:47:52.268342', 0, 0),
(7, '003', '5d4eabd130508903abb2f4665c2032ac5f954f4338177c1a2d942b4a0f2916b94f8732a2da548fe8127b34457890b02db07522e59077a06d6999f5ebe26d6297', 'March 25, 2016, 20:05:02.131929', 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
