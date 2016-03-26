-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2016 at 04:16 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;
--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `article_title`, `article_text`) VALUES
(1, '"You''ve got to love what  you love," Job says', 'It started before I was born. My biological mother was a young, unwed college graduate student, and she decided to put me up for adoption. She felt very strongly that I should be adopted by college graduates, so everything was all set for me to be adopted at birth by a lawyer and his wife. Except that when I popped out they decided at the last minute that they really wanted a girl. So my parents, who were on a waiting list, got a call in the middle of the night asking: "We have an unexpected baby boy; do you want him?" They said: "Of course." My biological mother later found out that my mother had never graduated from college and that my father had never graduated from high school. She refused to sign the final adoption papers. She only relented a few months later when my parents promised that I would someday go to college.\r\n\r\nAnd 17 years later I did go to college. But I naively chose a college that was almost as expensive as Stanford, and all of my working-class parents'' savings were being spent on my college tuition. After six months, I couldn''t see the value in it. I had no idea what I wanted to do with my life and no idea how college was going to help me figure it out. And here I was spending all of the money my parents had saved their entire life. So I decided to drop out and trust that it would all work out OK. It was pretty scary at the time, but looking back it was one of the best decisions I ever made. The minute I dropped out I could stop taking the required classes that didn''t interest me, and begin dropping in on the ones that looked interesting. \r\n\r\nIt wasn''t all romantic. I didn''t have a dorm room, so I slept on the floor in my friends'' rooms, I returned coke bottles for the 5c deposits to buy food with, and I would walk the 7 miles across town every Sunday night to get one good meal a week at the Hare Krishna temple. I loved it. And much of what I stumbled into by following my curiosity and intuition turned out to be priceless later on. Let me give you one example:\r\n\r\nReed College at that time offered perhaps the best calligraphy instruction in the country. Throughout the campus every poster, every label on every drawer, was beautifully hand calligraphed. Because I had dropped out and didn''t have to take the normal classes, I decided to take a calligraphy class to learn how to do this. I learned about serif and san serif typefaces, about varying the amount of space between different letter combinations, about what makes great typography great. It was beautiful, historical, artistically subtle in a way that science can''t capture, and I found it fascinating.\r\n\r\nNone of this had even a hope of any practical application in my life. But ten years later, when we were designing the first Macintosh computer, it all came back to me. And we designed is all into Mac. It was the first computer with beautiful typography. If I had never dropped in on that single course on college, the Mac would have never had multiple typefaces or proportionally spaced fonts. And since Windows just copied the Mac, it''s likely that no personal computer would have them. If I had never dropped out, I would have never dropped in on this calligraphy class, and personal computers might not have the wonderful typography that they do. Of course, it was impossible to connect the dots looking forward when I was in college. But it was very, very clear looking backwards ten years later. \r\n\r\nAgain, you can''t connect the dots looking forward; you can only connect them looking backwards. So you have to trust that the dots will somehow connect in your future. You have to trust in something - your gut, destiny, life, karma, whatever. This approach has never let me down, and it has made all the difference in my life. ');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `test_mc`
--

INSERT INTO `test_mc` (`question_id`, `question_text`) VALUES
(1, 'Who delivered the speech?'),
(2, 'Who are the adoptive parents of the speaker?'),
(3, '"She -refused- to sign the final adoption papers. She only relented a few months later when my parents promised that I would someday go to college." What does the underlined word mean?'),
(4, 'All of the following statements are true EXCEPT one:'),
(5, '"Again, you can''t connect the dots looking forward; you can only connect them looking backwards." How can you express this statement in simpler words?');

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
