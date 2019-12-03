-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 01, 2019 at 05:48 PM
-- Server version: 10.3.17-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ddk3ev`
--

-- --------------------------------------------------------

--
-- Table structure for table `affiliated_with`
--

CREATE TABLE `affiliated_with` (
  `id` varchar(255) NOT NULL,
  `party_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Candidate`
--

CREATE TABLE `Candidate` (
  `candidate_name` varchar(255) NOT NULL,
  `party_name` varchar(255) NOT NULL,
  `avg_sentiment_score` int(11) NOT NULL,
  `total_tweets` int(11) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leans`
--

CREATE TABLE `leans` (
  `username` varchar(255) NOT NULL,
  `avg_sentiment_dem` int(11) NOT NULL,
  `avg_sentiment_repub` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mentions`
--

CREATE TABLE `mentions` (
  `id` varchar(255) NOT NULL,
  `candidate_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Party`
--

CREATE TABLE `Party` (
  `party_name` int(11) NOT NULL,
  `avg_sentiment_score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `part_of`
--

CREATE TABLE `part_of` (
  `candidate_name` varchar(255) NOT NULL,
  `party_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Tweet`
--

CREATE TABLE `Tweet` (
  `id` varchar(255) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `sentiment_score` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Tweet`
--

INSERT INTO `Tweet` (`id`, `text`, `sentiment_score`) VALUES
('0', '\r\n“Companies shifted their resources and strategies because of Facebook\'s inflated metrics, costing them money and contributing to job losses. We need to do a lot more to hold Facebook accountable.”\r\n', 0),
('1', '\r\n“Thank you, @TheJeffreyMarsh . I want to make sure everyone\'s needs are reflected in my plans, and that your voices are uplifted. Thanks for being on #TeamWarren.”\r\n', 1),
('2', '\r\n“You’re making my point here. It’s up to you whether you take money to promote lies. You can be in the disinformation-for-profit business, or you can hold yourself to some standards. In fact, those standards were in your policy. Why the change?”\r\n', 0),
('3', '\r\nI’m about to take the stage in New Hampshire to discuss the grave threat Donald Trump poses to our democracy and the action we must take. Tune in now:\r\n', 0),
('4', '\r\nThank you, @UFCW ! I promise you won’t have a better ally in the White House if I’m president. I’m a union guy and always have been. Together, we can restore the soul of this nation.\r\n', 1),
('5', '\r\nI’m about to take the stage at the @UFCW Presidential Forum in Iowa, where I’ll discuss my plans to strengthen America’s unions. Tune in to watch live:\r\n', 0),
('6', '\r\nThis phony “anti-war” president vetoed our bill to get American troops out of the illegal war in Yemen. He has ignored Congress’s power to declare war. He’s spent years intensifying Middle East conflicts without giving a damn about the Constitution. Trump is a liar and a fraud.\r\n', -1),
('7', '\r\nWhen I reflect on how this country passed Social Security in 1935 and Medicare in 1965, I think about how much poverty and suffering we ended. Our next step is Medicare for All. When we succeed, future generations will appreciate how we made health care a human right in America.\r\n', 0),
('8', '\r\nSome argue that the U.S. is not really engaged in hostilities in Yemen. But when Yemenis see \"Made in USA\" on the bombs killing their children, it’s very clear that the United States is part of this horrible war. This must end.\r\n', 0),
('9', '\r\nGreat crowd in Manchester tonight!!  Some awesome #YangGang there.  \r\n', 1);
--
-- Triggers `Tweet`
--
DELIMITER $$
CREATE TRIGGER `boundSentimentScoreLower` BEFORE INSERT ON `Tweet` FOR EACH ROW SET NEW.sentiment_score = IF(NEW.sentiment_score < -1, -1, NEW.sentiment_score)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `boundSentimentScoreUpper` BEFORE INSERT ON `Tweet` FOR EACH ROW SET NEW.sentiment_score = IF(NEW.sentiment_score > 1, 1, NEW.sentiment_score)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `username` varchar(255) NOT NULL,
  `id` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tweets_about`
--

CREATE TABLE `tweets_about` (
  `username` varchar(255) NOT NULL,
  `candidate_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `username` varchar(255) NOT NULL,
  `total_tweets` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`username`, `total_tweets`) VALUES
('TestUser', 0),
('TestUser', 0);

--
-- Triggers `User`
--
DELIMITER $$
CREATE TRIGGER `trimUsername` BEFORE INSERT ON `User` FOR EACH ROW SET NEW.username = TRIM(NEW.username)
$$
DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

