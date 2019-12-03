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

INSERT INTO `affiliated_with` (`id`, `party_name`) VALUES
('0', 'Democrat'),
('1', 'Democrat'),
('2', 'Democrat'),
('3', 'Democrat'),
('4', 'Democrat'),
('5', 'Democrat'),
('6', 'Democrat'),
('7', 'Democrat'),
('8', 'Democrat'),
('9', 'Democrat'),
('10', 'Democrat'),
('11', 'Democrat'),
('12', 'Republican'),
('13', 'Republican'),
('14', 'Republican'),
('15', 'Republican'),
('16', 'Republican'),
('17', 'Republican'),
('18', 'Republican'),
('19', 'Republican');
-- --------------------------------------------------------

--
-- Table structure for table `Candidate`
--

CREATE TABLE `Candidate` (
  `candidate_name` varchar(255) NOT NULL,
  `party_name` varchar(255) NOT NULL,
  `avg_sentiment_score` float(3) NOT NULL,
  `total_tweets` int(11) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `Candidate` (`candidate_name`, `party_name`, `avg_sentiment_score`, `total_tweets`, `username`) VALUES 
("Bernie Sanders", "Democratic", .4, 3035, "BernieSanders"), 
("Joe Biden", "Democratic", .7, 492, "joebiden"), 
("Elizabeth Warren", "Democratic", .5, 428, "ewarren"), 
("Andrew Yang", "Democratic", .4, 2105, "AndrewYang"), 
("Mark Sanford", "Republican", .5, 201, "MarkSanford"), 
("Donald Trump", "Republican", 0, 34920, "realDonaldTrump"), 
("Joe Walsh", "Republican", .2, 892, "WalshFreedom");

-- --------------------------------------------------------

--
-- Table structure for table `leans`
--

CREATE TABLE `leans` (
  `username` varchar(255) NOT NULL,
  `avg_sentiment_dem` float(3) NOT NULL,
  `avg_sentiment_repub` float(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `leans` (`username`, `avg_sentiment_dem`, `avg_sentiment_repub`) VALUES
('ewarren',.7,-.8),
('joebiden',.8,-.3), 
('BernieSanders',.8,-.8),
('AndrewYang',.3,0), 
('MarkSanford',-.5, .3), 
('realDonaldTrump', -.9, .2), 
('WalshFreedom', -.8, .4); 
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
  `party_name` varchar(255) NOT NULL,
  `avg_sentiment_score` float(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `Party` (`party_name`, `avg_sentiment_score`) VALUES 
('Democratic', '.2'), 
('Republican', '.1'); 

-- --------------------------------------------------------

--
-- Table structure for table `part_of`
--

CREATE TABLE `part_of` (
  `candidate_name` varchar(255) NOT NULL,
  `party_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `part_of` (`candidate_name`, `party_name`) VALUES
('Donald Trump', 'Republican'),
('Joe Walsh', 'Republican'),
('Mark Sanford', 'Republican'),
('Bernie Sanders', 'Democrat'),
('Andrew Yang', 'Democrat'),
('Elizabeth Warren', 'Democrat'),
('Joe Biden', 'Democrat'); 

-- --------------------------------------------------------

--
-- Table structure for table `Tweet`
--

CREATE TABLE `Tweet` (
  `id` varchar(255) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `sentiment_score` float(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Tweet`
--

INSERT INTO `Tweet` (`id`, `text`, `sentiment_score`) VALUES
('0', '\r\n"Companies shifted their resources and strategies because of Facebook\'s inflated metrics, costing them money and contributing to job losses. We need to do a lot more to hold Facebook accountable."\r\n', -.2),
('1', '\r\n"Thank you, @TheJeffreyMarsh . I want to make sure everyone\'s needs are reflected in my plans, and that your voices are uplifted. Thanks for being on #TeamWarren."\r\n', 1),
('2', '\r\n"You’re making my point here. It’s up to you whether you take money to promote lies. You can be in the disinformation-for-profit business, or you can hold yourself to some standards. In fact, those standards were in your policy. Why the change?"\r\n', -.4),
('3', '\r\n"I’m about to take the stage in New Hampshire to discuss the grave threat Donald Trump poses to our democracy and the action we must take. Tune in now:"\r\n', -.1),
('4', '\r\n"Thank you, @UFCW ! I promise you won’t have a better ally in the White House if I’m president. I’m a union guy and always have been. Together, we can restore the soul of this nation."\r\n', 1),
('5', '\r\n"I’m about to take the stage at the @UFCW Presidential Forum in Iowa, where I’ll discuss my plans to strengthen America’s unions. Tune in to watch live:"\r\n', .4),
('6', '\r\n"This phony “anti-war” president vetoed our bill to get American troops out of the illegal war in Yemen. He has ignored Congress’s power to declare war. He’s spent years intensifying Middle East conflicts without giving a damn about the Constitution. Trump is a liar and a fraud."\r\n', -1),
('7', '\r\n"When I reflect on how this country passed Social Security in 1935 and Medicare in 1965, I think about how much poverty and suffering we ended. Our next step is Medicare for All. When we succeed, future generations will appreciate how we made health care a human right in America."\r\n', .3),
('8', '\r\n"Some argue that the U.S. is not really engaged in hostilities in Yemen. But when Yemenis see \"Made in USA\" on the bombs killing their children, it’s very clear that the United States is part of this horrible war. This must end."\r\n', -.4),
('9', '\r\n"Great crowd in Manchester tonight!!  Some awesome #YangGang there."  \r\n', 1),
('10', '\r\n"Eventually people will stop underestimating us. By then we will have won." \r\n', .6),
('11', '\r\n"Thank you for having me Bedford Democrats! Let\'s move the country forward." \r\n', .9), 
('12', '\r\n"Surprising the Pentagon, surprising allies abroad, and surprising allies in Congress is hardly consistent with a measured approach, but sadly consistent with this President." \r\n', -.2),
('13', '\r\n"I want to focus on @realDonaldTrump\'s decision this week on the Kurds and Syria. His capricious approach and his implementation on immediate Special Forces removal, to clear the way for a Turkish military strike, is tone deaf to the message it sends to our allies." \r\n', -.6), 
('14', '\r\n"Congratulations to the Great State of Louisiana. A big night. You will soon have a new and wonderful Governor, @EddieRispone . Your Taxes and Car Insurance Payments will go DOWN!" \r\n', .5), 
('15', '\r\n"The Governor of Louisiana, John Bel Edwards, has done a poor job. NOW HE IS IN A RUNOFF WITH A GREAT REPUBLICAN, @EddieRispone . Thank you Louisiana! 66% down to 47% after I explained what a bad job the Governor was doing." \r\n', -.6), 
('16', '\r\n"Start thinking about getting bigger tractors!" \r\n', 1.0), 
('17', '\r\n"There is no defense for what Trump did. His "defense" team knows this which is why they make no effort to defend what he did" \r\n', -.8), 
('18', '\r\n"Very well put" \r\n', .9), 
('19', '\r\n"And still, Trumps media servants like Hannity will shout "deep state" and everybody who watches Hannity, et al. will nod approvingly at their "deep state" fake news" \r\n', -.5);

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `username` varchar(255) NOT NULL,
  `id` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tweets` (`username`, `id`, `date`) VALUES 
('ewarren', '0', '2019-10-13'), 
('ewarren', '1', '2019-10-13'), 
('ewarren', '2', '2019-10-12'), 
('joebiden', '3', '2019-10-09'), 
('joebiden', '4', '2019-10-13'),
('joebiden', '5', '2019-10-13'), 
('BernieSanders', '6', '2019-10-13'), 
('BernieSanders', '7', '2019-10-13'), 
('BernieSanders', '8', '2019-10-12'), 
('AndrewYang', '9', '2019-10-11'), 
('AndrewYang', '10', '2019-10-09'), 
('AndrewYang', '11', '2019-10-11'),
('MarkSanford', '12', '2019-10-10'), 
('MarkSanford', '13', '2019-10-10'), 
('realDonaldTrump', '14', '2019-10-12'), 
('realDonaldTrump', '15', '2019-10-12'), 
('realDonaldTrump', '16', '2019-10-13'), 
('WalshFreedom', '17', '2019-12-02'), 
('WalshFreedom', '18', '2019-11-29'), 
('WalshFreedom', '19', '2019-11-27'); 


-- --------------------------------------------------------

--
-- Table structure for table `tweets_about`
--

CREATE TABLE `tweets_about` (
  `username` varchar(255) NOT NULL,
  `candidate_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tweets_about` (`username`, `candidate_name`) VALUES
('BernieSanders','Donald Trump'),
('realDonaldTrump', 'Joe Biden'),
('joebiden', 'Andrew Yang'),
('ewarren', 'Donald Trump'),
('AndrewYang', 'Andrew Yang'),
('MarkSanford', 'Elizabeth Warren'),
('WalshFreedom', 'Donald Trump');
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
('TestUser', 0),
('Bernie Sanders', 6);

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

