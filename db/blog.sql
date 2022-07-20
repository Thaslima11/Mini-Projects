/*
SQLyog Community v8.4 RC2
MySQL - 5.0.15-nt : Database - blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blog` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `blog`;

/*Table structure for table `admindata` */

DROP TABLE IF EXISTS `admindata`;

CREATE TABLE `admindata` (
  `uid` int(11) NOT NULL auto_increment,
  `firstname` varchar(100) default NULL,
  `lastname` varchar(100) default NULL,
  `username` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `mobile` varchar(20) default NULL,
  `password` varchar(100) default NULL,
  `cpassword` varchar(100) default NULL,
  UNIQUE KEY `sno` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admindata` */

insert  into `admindata`(`uid`,`firstname`,`lastname`,`username`,`email`,`mobile`,`password`,`cpassword`) values (0,'admin','admin','admin','admin@gmail.com','8870670410','admin','admin');

/*Table structure for table `blike` */

DROP TABLE IF EXISTS `blike`;

CREATE TABLE `blike` (
  `lid` int(10) NOT NULL auto_increment,
  `uid` varchar(10) default NULL,
  `bid` varchar(10) default NULL,
  UNIQUE KEY `lid` (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `blike` */

/*Table structure for table `blog` */

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `bid` int(11) NOT NULL auto_increment,
  `title` varchar(100) default NULL,
  `bimage` varchar(100) default NULL,
  `username` varchar(100) default NULL,
  `bdate` varchar(50) default NULL,
  `categories` varchar(100) default NULL,
  `tag` varchar(100) default NULL,
  `message` varchar(5000) default NULL,
  `bcomment` varchar(100) default NULL,
  `blike` varchar(100) default NULL,
  UNIQUE KEY `bid` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `blog` */

insert  into `blog`(`bid`,`title`,`bimage`,`username`,`bdate`,`categories`,`tag`,`message`,`bcomment`,`blike`) values (1,'Weather','Dszpics1.jpg','admin','2016-08-11','Wether','common','Weather is the state of the atmosphere, to the degree that it is hot or cold, wet or dry, calm or stormy, clear or cloudy.[1] Most weather phenomena occur in the troposphere,[2][3] just below the stratosphere. Weather refers to day-to-day temperature and precipitation activity, whereas climate is the term for the statistics of atmospheric conditions over longer periods of time.[4] When used without qualification, \"weather\" is generally understood to mean the weather of Earth.\r\n\r\nWeather is driven by air pressure, temperature and moisture differences between one place and another. These differences can occur due to the suns angle at any particular spot, which varies by latitude from the tropics. The strong temperature contrast between polar and tropical air gives rise to the jet stream. Weather systems in the mid-latitudes, such as extratropical cyclones, are caused by instabilities of the jet stream flow. Because the Earths axis is tilted relative to its orbital plane, sunlight is incident at different angles at different times of the year. On Earths surface, temperatures usually range Â±40 Â°C (â??40 Â°F to 100 Â°F) annually. Over thousands of years, changes in Earths orbit can affect the amount and distribution of solar energy received by the Earth, thus influencing long-term climate and global climate change.','6','0');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `cid` int(10) NOT NULL auto_increment,
  `bid` varchar(50) default NULL,
  `uid` varchar(50) default NULL,
  `cdate` varchar(50) default NULL,
  `message` varchar(500) default NULL,
  `reply` varchar(50) default NULL,
  UNIQUE KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `comment` */

insert  into `comment`(`cid`,`bid`,`uid`,`cdate`,`message`,`reply`) values (1,'1','0','August 11, 2016','weather','0'),(2,'1','0','August 11, 2016','weather very high...','0'),(3,'1','1','August 11, 2016','ok testing...','1'),(4,'1','1','August 11, 2016','ok...','3'),(5,'1','1','August 11, 2016','ojjjjj','0'),(6,'1','1','August 11, 2016','sdfsdagsd','5');

/*Table structure for table `userdata` */

DROP TABLE IF EXISTS `userdata`;

CREATE TABLE `userdata` (
  `uid` int(11) NOT NULL auto_increment,
  `firstname` varchar(100) default NULL,
  `lastname` varchar(100) default NULL,
  `username` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `mobile` varchar(20) default NULL,
  `password` varchar(100) default NULL,
  `cpassword` varchar(100) default NULL,
  UNIQUE KEY `sno` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userdata` */

insert  into `userdata`(`uid`,`firstname`,`lastname`,`username`,`email`,`mobile`,`password`,`cpassword`) values (1,'murali','s','murali','murali@uniqtechnologies.co.in','8870670410','123','123');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
