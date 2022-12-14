CREATE DATABASE  IF NOT EXISTS `toeiconline` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `toeiconline`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: toeiconline
-- ------------------------------------------------------
-- Server version	5.7.14-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `commentid` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `userid` bigint(20) DEFAULT NULL,
  `listenguidelineid` bigint(20) DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`commentid`),
  KEY `fk_user_comment` (`userid`),
  KEY `fk_listenguidline_comment` (`listenguidelineid`),
  CONSTRAINT `fk_listenguidline_comment` FOREIGN KEY (`listenguidelineid`) REFERENCES `listenguideline` (`listenguidelineid`),
  CONSTRAINT `fk_user_comment` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examination`
--

DROP TABLE IF EXISTS `examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examination` (
  `examinationid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`examinationid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examination`
--

LOCK TABLES `examination` WRITE;
/*!40000 ALTER TABLE `examination` DISABLE KEYS */;
INSERT INTO `examination` VALUES (1,'Ba??i thi 1','2017-12-03 03:25:56',NULL);
/*!40000 ALTER TABLE `examination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examinationquestion`
--

DROP TABLE IF EXISTS `examinationquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examinationquestion` (
  `examinationquestionid` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `audio` varchar(255) DEFAULT NULL,
  `question` text,
  `paragraph` text,
  `option1` varchar(300) DEFAULT NULL,
  `option2` varchar(300) DEFAULT NULL,
  `option3` varchar(300) DEFAULT NULL,
  `option4` varchar(300) DEFAULT NULL,
  `correctanswer` varchar(10) DEFAULT NULL,
  `examinationid` bigint(20) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`examinationquestionid`),
  KEY `fk_examinationquestion_examination` (`examinationid`),
  CONSTRAINT `fk_examinationquestion_examination` FOREIGN KEY (`examinationid`) REFERENCES `examination` (`examinationid`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examinationquestion`
--

LOCK TABLES `examinationquestion` WRITE;
/*!40000 ALTER TABLE `examinationquestion` DISABLE KEYS */;
INSERT INTO `examinationquestion` VALUES (55,'examination/image_1.jpg','examination/audio_1.mp3','Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:',NULL,'A. The man is diving into the water','B. The man is fishing from the railing','C. The man is packing up his fishing gear','D. The man is purchasing some fish','A',1,'2017-12-03 17:06:29',NULL,'PHOTO'),(56,'examination/image_2.jpg','examination/audio_2.mp3','Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:',NULL,'A. The man is diving into the water','B. The man is fishing from the railing','C. The man is packing up his fishing gear','D. The man is purchasing some fish','B',1,'2017-12-03 17:06:29',NULL,'PHOTO'),(57,NULL,'examination/audio_3.mp3','Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:',NULL,'A. The man is diving into the water','B. The man is fishing from the railing','C. The man is packing up his fishing gear','D. The man is purchasing some fish','B',1,'2017-12-03 17:06:29',NULL,'QUESTION_RESPONSE'),(58,NULL,'examination/audio_4.mp3','Listen to the question and the three responses. Choose the response that best answers the question:',NULL,'A. The man is diving into the water','B. The man is fishing from the railing','C. The man is packing up his fishing gear','D. The man is purchasing some fish','A',1,'2017-12-03 17:06:29',NULL,'QUESTION_RESPONSE'),(59,NULL,NULL,'Read the passage and choose the correct answer:','Eli Finance, the largest real estate financier in the Middle East by market value and total assets, today proudly announced that it received the award for the ???Best Financial Services Company in the UAE??? during the 2008 Liquid Real Estate Awards ceremony organized by Euromoney. Euromoney Liquid Real Estate Awards honor the world???s leading institutions for their ability to innovate and develop new products and services to meet the market???s demand in today???s increasingly challenging financial environment, as well as make the most efficient use of the inherent strengths within their organization. Speaking on the occasion, Mr. Ismael Alharmi, Chief Executive Officer of Eli Finance said, ???We are honored to receive this prestigious award and I would like to thank our staff at Eli for their efforts',NULL,NULL,NULL,NULL,NULL,1,'2017-12-03 17:06:29',NULL,'SINGLE_PASSAGE'),(60,NULL,NULL,'What is the subject of the news report?',NULL,'A. A national park','B. A local zoo','C. Commercial products','D. Landscaping land','B',1,'2017-12-03 17:06:29',NULL,'SINGLE_PASSAGE'),(61,NULL,NULL,'According to the speaker, what does Algonquin National Park have?',NULL,'A. Unique rock formations','B. A lot of different animals','C. Unusual potted plants','D. Beautiful waterfalls','A',1,'2017-12-03 17:06:29',NULL,'SINGLE_PASSAGE'),(62,NULL,NULL,'What do some people expect will happen?',NULL,'A. The wildlife will relocate','B. It will increase local business',' C. New homes will be built','D. They will change their minds','B',1,'2017-12-03 17:06:29',NULL,'SINGLE_PASSAGE');
/*!40000 ALTER TABLE `examinationquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise` (
  `exerciseid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`exerciseid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,'Ba??i t????p nghe 1','2017-11-28 17:19:29',NULL,'listening'),(2,'Ba??i t????p ??o??c 1','2017-11-28 17:19:29',NULL,'reading');
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercisequestion`
--

DROP TABLE IF EXISTS `exercisequestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercisequestion` (
  `exercisequestionid` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `audio` varchar(255) DEFAULT NULL,
  `question` text NOT NULL,
  `option1` varchar(300) NOT NULL,
  `option2` varchar(300) NOT NULL,
  `option3` varchar(300) NOT NULL,
  `option4` varchar(300) NOT NULL,
  `correctanswer` varchar(10) NOT NULL,
  `exerciseid` bigint(20) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`exercisequestionid`),
  KEY `fk_exercisequestion_exercise` (`exerciseid`),
  CONSTRAINT `fk_exercisequestion_exercise` FOREIGN KEY (`exerciseid`) REFERENCES `exercise` (`exerciseid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisequestion`
--

LOCK TABLES `exercisequestion` WRITE;
/*!40000 ALTER TABLE `exercisequestion` DISABLE KEYS */;
INSERT INTO `exercisequestion` VALUES (1,'exercise/image_1.jpg','exercise/audio_1.mp3','Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:','A','B','C','D','A',1,'2017-11-28 17:19:35',NULL),(2,'exercise/image_2.jpg','exercise/audio_2.mp3','Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:','A','B','C','D','B',1,'2017-11-28 17:19:35',NULL),(3,'exercise/image_3.jpg','exercise/audio_3.mp3','Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:','A','B','C','D','C',1,'2017-11-28 17:19:35',NULL),(4,'exercise/image_4.jpg','exercise/audio_4.mp3','Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:','A','B','C','D','D',1,'2017-11-28 17:19:35',NULL),(5,NULL,NULL,'I dont think he will remember the appointment you remind him.','so','if','unless','lest','C',2,'2017-11-28 17:19:35',NULL),(6,NULL,NULL,'The river has overflowed his banks _____ it has been raining continuously for several days.','still','yet','when','as','D',2,'2017-11-28 17:19:35',NULL),(7,NULL,NULL,'Those village folk are poor _____ they always seem so contented.','still','yet','when','as','C',2,'2017-11-28 17:19:35',NULL),(8,NULL,NULL,'he was not interested in music, he agreed to go to the concert.','still','yet','when','as','A',2,'2017-11-28 17:19:35',NULL);
/*!40000 ALTER TABLE `exercisequestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listenguideline`
--

DROP TABLE IF EXISTS `listenguideline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listenguideline` (
  `listenguidelineid` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`listenguidelineid`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listenguideline`
--

LOCK TABLES `listenguideline` WRITE;
/*!40000 ALTER TABLE `listenguideline` DISABLE KEYS */;
INSERT INTO `listenguideline` VALUES (36,'REVIEW ????? THI TOEIC IIG NG??Y 19/03/2015 by Ms Hi???n Nhung','listenguideline\\image_4.jpg','<p><img alt=\"\" src=\"http://localhost:8080/ckfinder/core/connector/java/connector.java?command=Thumbnail&amp;type=Images&amp;currentFolder=%2F&amp;langCode=en&amp;hash=f9a65f6271336a0&amp;FileName=listenguideline_1.jpg\" style=\"height:200px; width:200px\" /></p>\r\n\r\n<p><strong>REVIEW ????? THI TOEIC IIG NG&Agrave;Y 19/03/2015</strong><br />\r\n<br />\r\n<br />\r\n<strong><u>1. Part 1: 6 tranh t??? ng?????i, 4 tranh t??? v???t&nbsp;</u></strong><br />\r\n<br />\r\nC&aacute;c b???c tranh ?????u l&agrave; nh???ng b???i c???nh th&acirc;n thu???c nh?? trong c&aacute;c cu???n&nbsp;<a href=\"http://mshoatoeic.com/\">luy???n thi toeic</a>&nbsp;c???a trung t&acirc;m mshoatoeic, c??? th???:<br />\r\n+ B???c tranh 2 ng?????i ??ang di chuy???n 1 chi???c b&agrave;n ??i n??i kh&aacute;c ( they are moving the table)<br />\r\n+ Tranh 2 ng?????i ng???i ?????i di???n nhau nh&igrave;n nhau ( they are looking at each other)<br />\r\n+ 1 ng?????i ??&agrave;n &ocirc;ng ?????ng trong nh&agrave; h&agrave;ng, xung quanh kh&ocirc;ng c&oacute; ng?????i ch??? c&oacute; b&agrave;n gh??? ???????c x???p ng??n n???p<br />\r\n+ 5, 6 ng?????i ng???i quanh 1 c&aacute;i b&agrave;n<br />\r\n+ 1 ng?????i ??&agrave;n &ocirc;ng ??ang s???a ???ng n?????c tr&ecirc;n ???????ng ( changing pipes)<br />\r\n+ T&agrave;u chu???n b??? v&agrave;o ga, ga ko c&oacute; ng?????i<br />\r\n+ 3 Xe ????? b&ecirc;n ???????ng tr?????c d&atilde;y nh&agrave;, kh&ocirc;ng c&oacute; c&acirc;y c???i xung quanh.<br />\r\n+ M&aacute;y t&iacute;nh/ h???p v&agrave; c&aacute;c ????? thi???t b??? kh&aacute;c ???????c x???p tr&ecirc;n k???<br />\r\n<strong><u>Note:</u></strong>&nbsp;Ch&uacute; &yacute; b???y t??? v???t trong tranh c&oacute; ng?????i xu???t hi???n, c??? th??? v???i b???c tranh ng?????i ??&agrave;n &ocirc;ng ?????ng trong nh&agrave; h&agrave;ng, c&acirc;u mi&ecirc;u t??? ??&uacute;ng l???i mi&ecirc;u t??? c&aacute;ch s???p x???p b&agrave;n gh???:&nbsp; chairs are arranged around the table.<br />\r\n<br />\r\n<br />\r\n<strong><u>2. Part 2:</u></strong><br />\r\n<br />\r\n- Ph???n 2 v???n ch???ng t??? l&agrave; 1 ph???n khoai v???i ??a s??? c&aacute;c th&iacute; sinh: Kh&aacute; nhi???u Wh-question (kho???ng 15-17) bao g???m c??? h???i tr???c ti???p v&agrave; c&acirc;u h???i d???ng gi&aacute;n ti???p ???n d?????i c&acirc;u h???i d???ng yes/no questions. ??&aacute;ng ch&uacute; &yacute; l&agrave; c&oacute; kh&aacute; nhi???u c&acirc;u h???i How long, how many v&agrave; who. &nbsp;Statement&nbsp; kh&aacute; nhi???u kho???ng 5-6 c&acirc;u. c&aacute;c lo???i Yes/ No + Negative question , Choice questions, tags , suggestion (why don&rsquo;t you, would you like &hellip;(movies + drinks) ) v&agrave; request&nbsp; ( can you) m???i lo???i c&oacute; kho???ng 3-4 c&acirc;u.<br />\r\n- C&aacute;c c&acirc;u h???i kh&ocirc;ng qu&aacute; d&agrave;i. Ch??? c&oacute; kho???ng 4-5 c&acirc;u thu???c n???a sau (?????c bi???t l&agrave; c&acirc;u h???i choice questions)&nbsp; m???c ????? kh&oacute; t??ng l&ecirc;n v&agrave; c??ng d&agrave;i h??n, nh??ng c&oacute; th??? lo???i tr??? ???????c m???t s??? ??&aacute;p &aacute;n tr??? l???i cho lo???i c&acirc;u h???i kh&aacute;c. C??? th???: When (b???y For + time, b???y c&acirc;u tr??? l???i c???a where ), why don&rsquo;t you (that&rsquo;s a great idea), would you like... C&oacute; nhi???u c&acirc;u &nbsp;&ldquo;x??i lu&ocirc;n&rdquo; &nbsp;cho m???t s??? d???ng c&acirc;u h???i nh?? d???ng I don&rsquo;t know: &ldquo;Ask &hellip;.&rdquo;, &ldquo;It doesn&rsquo;t matter to me&rdquo;, &ldquo;Either would be good..&rdquo;, &ldquo;I&rsquo;ll take care of it&hellip;&rdquo;<br />\r\n<br />\r\n<strong><u>Note:</u></strong><br />\r\n- R???t nhi???u b???y similar sound v&agrave; family word. V&agrave; c&aacute;c b???y kh&aacute;c nh?? t??? associated words (where do you&nbsp;<strong>store&nbsp;</strong>the document? &ndash; I buy some&nbsp;<strong>foods</strong>&hellip;. ) ??&aacute;nh b???y nh???ng b???n kh&ocirc;ng b???t k???p t??? ????? h???i.<br />\r\n<br />\r\n&nbsp;<br />\r\n<strong><u>3. Part 3</u></strong><br />\r\n<br />\r\n- 10 ??o???n ?????u l&agrave; Man vs Woman. V???n nh???c h???c sinh ?????c bi???t ch&uacute; &yacute; l?????t n&oacute;i c???a t???ng ng?????i v&agrave; ?????c k?? c&acirc;u h???i ????? xem l???i c???a &ldquo;man&rdquo; hay &ldquo;woman&rdquo;. Tr?????c khi nghe nh???t thi???t ph???i ?????c tr?????c c&acirc;u h???i ????? x&aacute;c ?????nh Keyword v&agrave; ??&aacute;p &aacute;n ????? ph&acirc;n bi???t ???????c s??? kh&aacute;c nhau Kh&ocirc;ng t&ocirc; k&iacute;n ??&aacute;p &aacute;n ngay m&agrave; ch??? n&ecirc;n khoanh nh??? ????? d&agrave;nh th???i gian ?????c c&acirc;u h???i ti???p theo.<br />\r\n- N???i dung g???m c&aacute;c v???n ????? nh??: hai nh&acirc;n vi&ecirc;n trao ?????i c&ocirc;ng vi???c, 2 nh&acirc;n vi&ecirc;n trao ?????i v??? vi???c tham d??? 1 tri???n l&atilde;m v&agrave; ng?????i ph??? n??? quy???t ?????nh ??i tham d??? v&igrave; deadline dc d&atilde;n ra, cu???c n&oacute;i chuy???n trong ph&ograve;ng kh&aacute;m r??ng, cu???c n&oacute;i chuy???n gi???a nh&acirc;n vi&ecirc;n b&aacute;n h&agrave;ng v&agrave; kh&aacute;ch li&ecirc;n quan ?????n vi???c ?????i h&agrave;ng h&oacute;a ??&atilde; mua,..)<br />\r\n- D???ng c&acirc;u h???i v??? Location v&agrave; Occupation chi???m 6-7 c&acirc;u. C&aacute;c b???i c???nh: h???i ???????ng ?????n 1 t&ograve;a nh&agrave; tr&ecirc;n ???????ng, library, restaurant, office, clothes store,... job:&nbsp; interviewee, dentist,&hellip;<br />\r\n-&nbsp; D???ng c&acirc;u h???i v??? topic&nbsp; chi???m 4-5 c&acirc;u (li&ecirc;n quan ?????n: chu???n b??? cho b???a ti???c &nbsp;sinh nh???t c???a 1 th&agrave;nh vi&ecirc;n trong c&ocirc;ng ty, thay ?????i trong 1 k??? ho???ch, h???i ???????ng, tham d??? art exhibition,&hellip; )<br />\r\n- C&aacute;c c&acirc;u h???i when nh?? when do they meet? When did the meeting start? Kh&aacute; nhi???u, l&agrave; nh???ng c&acirc;u ??n ??i???m cho c&aacute;c th&iacute; sinh v&igrave; h???u nh?? kh&ocirc;ng c&oacute; b???y m&agrave; nghe ???????c ch???n ???????c lu&ocirc;n, kh&ocirc;ng c&oacute; nhi???u con s??? ???????c nh???c ?????n ????? ??&aacute;nh b???y.<br />\r\n<br />\r\n<strong><u>Note:</u></strong><br />\r\n- N???a sau c???a part 3 ????? kh&oacute; t??ng cao h??n; &nbsp;Nh???ng c&acirc;u tr??? l???i c&oacute; th??? n???m ??? ngay 1 v&agrave;i gi&acirc;y ?????u ti&ecirc;n n&ecirc;n c???n chu???n b??? tinh th???n th???t k??. Ch&uacute; &yacute; ?????c v&agrave; n???m b???t k?? n???i dung c&acirc;u h???i v&agrave; th&ocirc;ng tin do ai n&oacute;i v&igrave; c&oacute; th??? c&acirc;u tr??? l???i cho c&acirc;u sau ?????n tr?????c c&acirc;u tr?????c l&agrave;m c&aacute;c th&iacute; sinh l&uacute;ng t&uacute;ng.<br />\r\n<br />\r\n&nbsp;<br />\r\n<strong><u>4. Part 4:</u></strong>&nbsp;&nbsp;????? c&aacute;c format ???????c h???c, c??? th???:<br />\r\n<br />\r\n<strong>- Recorded message&nbsp;</strong>(1 anh nh&acirc;n vi&ecirc;n ??i c&ocirc;ng t&aacute;c ????? l???i h?????ng d???n n???u c???n li&ecirc;n l???c g???p th&igrave; ????? l???i s??? ??i???n tho???i v&agrave; t&ecirc;n, h???i l&yacute; do kh&ocirc;ng nh???n ???????c cu???c g???i, ng?????i n&oacute;i c&oacute; kh??? n??ng l&agrave;m g&igrave;)<br />\r\n<strong>- voice message&nbsp; (&nbsp;</strong>nh&acirc;n vi&ecirc;n c&ocirc;ng ty g???i cho kh&aacute;ch h&agrave;ng v??? order c???a kh&aacute;ch , g???i &yacute; chuy???n sang 1 order kh&aacute;c ????? kh&ocirc;ng ph???i ?????i l&acirc;u- y&ecirc;u c???u g???i l???i ????? x&aacute;c nh???n<strong>)&nbsp;</strong><br />\r\n<strong>- report ( b???n tin giao th&ocirc;ng:&nbsp;</strong>???????ng s???a, s???a trong bao l&acirc;u b???t ?????u t??? khi n&agrave;o v&agrave; khuy&ecirc;n ng?????i&nbsp; nghe ??i ???????ng kh&aacute;c, h???i th???i gian ph&aacute;t s&oacute;ng b???n tin, ai l&agrave; John&hellip; );<strong>&nbsp;(b???n tin th???i ti???t:&nbsp;</strong>D??? b&aacute;o th???i ti???t, ng?????i nghe ???????c khuy&ecirc;n l&agrave; n&ecirc;n l&agrave;m g&igrave; ( mang &ocirc; ??i, th???i ti???t ng&agrave;y mai ra sao?)<br />\r\n<strong>- Speech (</strong>Gi???i thi???u m???t speaker, h???i ngh??? nghi???p, topic c???a b&agrave;i ph&aacute;t bi???u, s??? ki???n g&igrave; di???n ra ti???p theo)<br />\r\n<strong>- Announcement&nbsp;&nbsp;</strong>( li&ecirc;n quan ?????n ho&atilde;n k??? ho???ch s???a v??n ph&ograve;ng c&ocirc;ng ty sang 1 ng&agrave;y kh&aacute;c v&igrave; ?????i s???a ch???a ch??a l&agrave;m xong ??? 1 khu v???c kh&aacute;c c???a c&ocirc;ng ty, nh&acirc;n vi&ecirc;n ???????c khuy&ecirc;n d???n v??n ph&ograve;ng ????? chu???n b??? s???n cho vi???c s??n s???a)<br />\r\n<strong>- Meeting</strong>&nbsp;(T&igrave;nh h&igrave;nh s???n ph???m c&ocirc;ng ty, intended audience l&agrave; ai, n&ecirc;n l&agrave;m g&igrave; ????? t??ng doanh thu..)<br />\r\n<strong>- Tour&nbsp;</strong>(??i s??? th&uacute;, l???ch tr&igrave;nh tour, th&ocirc;ng b&aacute;o khu v???c th??m quan chu???ng h??? ??ang ??&oacute;ng c???a ????? l&agrave;m s???ch n&ecirc;n s??? kh&ocirc;ng ??i tham quan khu v???c ??&oacute;)<br />\r\n<br />\r\n<strong><u>Note:</u></strong>&nbsp;Nh&igrave;n chung, ??? ph???n n&agrave;y c&aacute;c b???n th&iacute; sinh ch??? c???n ?????c k?? tr?????c c&acirc;u h???i, n???m b???t th??? lo???i v&agrave; t???p trung nghe l&agrave; s??? ??n ??i???m.<br />\r\n<br />\r\n<br />\r\n<strong><u>5. Part 5 and 6:</u></strong><br />\r\n<br />\r\n??&aacute;nh gi&aacute; chung cho ????? thi part 5 , 6 s&aacute;ng 19/03 l&agrave; kh&ocirc;ng&nbsp; kh&oacute;, kh&ocirc;ng ??&aacute;nh ?????, &iacute;t c&acirc;u h???i v??? t??? v???ng. C&aacute;c ch??? ??i???m ng??? ph&aacute;p ???????c test bao g???m:<br />\r\n<strong>- Li&ecirc;n t???&nbsp;</strong>( although, furthermore, On the contrary,&nbsp; not only but also&hellip;..)<br />\r\n<strong>- ?????i t???&nbsp;</strong>(they, their, ?????i t??? quan h??? ( who, whom)<strong>&hellip;).&nbsp;</strong>Kho???ng 5, 6 c&acirc;u ki???m tra v??? ?????i t???, thu???c lo???i d??? v&agrave; ??n s???n cho th&iacute; sinh.<br />\r\n<strong>- Danh t??? (</strong>khi ch???n danh t??? ch&uacute; &yacute; s??? &iacute;t s??? nhi???u: Invitations, technical description, purpose, extension,&hellip;)<br />\r\n<strong>- Adj:&nbsp;</strong>rising rent, pleasing cent; so s&aacute;nh nh???t : the most successful so far,&hellip;<br />\r\n<strong>- Gi???i t???&nbsp;</strong>(throughout, in, regardless of&hellip;)<br />\r\n<strong>- Adv:&nbsp;</strong>ko c&oacute; nhi???u, c&acirc;u h???i ????n gi???n, ch&uacute; &yacute; c&aacute;c adv ??a chu???m : promply, approximately, quickly,&hellip; ch??? y???u test v??? tr&iacute; c???a ADV: tr?????c Adj, sau V (g???m c&aacute;c v??? tr&iacute; be &hellip; Pii, &hellip;Adj, has/have &hellip; Pii).<br />\r\n- C&aacute;c c???u tr&uacute;c ng??? ph&aacute;p ( be about to V,&hellip;)<br />\r\n<br />\r\n<br />\r\n<strong><u>6. Part 7:</u></strong><br />\r\n<br />\r\n<br />\r\n- C&oacute; th??? ??&aacute;nh gi&aacute; part 7 c???a b&agrave;i thi l???n n&agrave;y kh&aacute; kh&oacute; v???i c&aacute;c th&iacute; sinh. R???t nhi???u b&agrave;i ?????c qu???ng c&aacute;o , article, review v&agrave; announcement ????? d&agrave;i c&aacute;c b&agrave;i ?????c v???a ph???i, kh&ocirc;ng qu&aacute; d&agrave;i.<br />\r\n<br />\r\n- Ch??? c&oacute; 1 c&acirc;u h???i v??? ngh??a c???a t??? trong c&acirc;u ( t??? &ldquo;served&rdquo; ??? paragraph 3 line 2 ngh??a l&agrave; j? ??? ??&acirc;y ?????ng ngh??a &ldquo;worked as&rdquo;&hellip;); C&oacute; kho???ng 5,6&nbsp; c&acirc;u h???i &ldquo;Not&rdquo;.<br />\r\n<br />\r\n+ 1 article th&ocirc;ng b&aacute;o v??? vi???c ngh??? h??u c???a 1 c???u nh&acirc;n vi&ecirc;n c&ocirc;ng ty. K??? th&agrave;nh t???a c???a &ocirc;ng n&agrave;y trong c&ocirc;ng ty v???i vi???c lead 1 ?????i team ph&aacute;t tri???n 1 d&ograve;ng s???n ph???m linh ki???n m&aacute;y t&iacute;nh n???i ti???ng. &Ocirc;ng n&agrave;y v??? h??u v???n c&ograve;n nhi???u d??? ?????nh: l&agrave;m vi???c t???i nh&agrave;, vi???t s&aacute;ch, tham gia c&aacute;c t??? ch???c x&atilde; h???i.<br />\r\n+ 1 Email: th?? m???i l&agrave;m vi???c (offer letter) &ndash; h???i v??? tr&iacute;, ???????c cung c???p ph&uacute;c l???i nh???ng g&igrave; &hellip;.<br />\r\n+ 1 advertisement cho 1 t??? ch???c l&agrave;m t??? thi???n mu???n ????ng tuy???n th&ecirc;m t&igrave;nh nguy???n vi&ecirc;n.<br />\r\n+ 1 th&ocirc;ng b&aacute;o tuy???n th&agrave;nh vi&ecirc;n v&agrave; qu???ng c&aacute;o l???i &iacute;ch c???a vi???c ????ng k&iacute; l&agrave;m th&agrave;nh vi&ecirc;n c???a 1 v?????n c&acirc;y th???c v???t c???nh.<br />\r\n+ Double mess: 1 b&agrave;i article v??? 1 cu???c thi d&agrave;nh cho c&aacute;c c&ocirc;ng ty ng&agrave;nh ????? u???ng, th&ocirc;ng b&aacute;o c&ocirc;ng ty c&oacute; d&ograve;ng s???n ph???m ??o???t gi???i nh???t, ????a nh???n x&eacute;t c???a 1 chuy&ecirc;n gia v??? s???&nbsp; th???nh h&agrave;nh c???a lo???i ????? ??n th???c u???ng m???i. &ndash; 1 b&agrave;i review v??? s???n ph???m v&agrave; c&ocirc;ng ty ??o???t gi???i nh???t &agrave; C&aacute;c c&acirc;u h???i li&ecirc;n quan ?????n th&agrave;nh ph???n tham d??? cu???c thi, s???n ph???m n&agrave;o c&ocirc;ng ty ??o???t gi???i nh???t kh&ocirc;ng s???n xu???t, c&acirc;u h???i infer t??? l???i nh???n x&eacute;t c???a chuy&ecirc;n gia.<br />\r\n<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Double mess: 1 th&ocirc;ng b&aacute;o tuy???n d???ng nh&acirc;n vi&ecirc;n do m??? r???ng chi nh&aacute;nh c???a 1 c&ocirc;ng ty- 1 letter h???i v??? c&aacute;c th&ocirc;ng tin li&ecirc;n quan ?????n v??? tr&iacute; tuy???n d???ng. &agrave;&nbsp; H???i tr??? s??? c???a c&ocirc;ng ty, c&aacute;c y&ecirc;u c???u tuy???n d???ng, v&agrave; th&ocirc;ng tin li&ecirc;n quan ?????n c&ocirc;ng vi???c &ldquo;kh&ocirc;ng&rdquo; ???????c h???i ?????n trong ph???n letter.<br />\r\n<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Double mess: 1 b&agrave;i b&aacute;o th&ocirc;ng b&aacute;o ch???m kh???i chi???u phim do c???n thay th??? 1 di???n vi&ecirc;n ch&iacute;nh trong phim &ndash; 1 review film: khen s??? kh&eacute;o l&eacute;o c???a ?????o di???n ??&atilde; chuy???n th??? t&aacute;c ph???m v??n h???c ?????u tay c???a ch&iacute;nh m&igrave;nh l&ecirc;n phim. &agrave; h???i t&ecirc;n di???n vi&ecirc;n thay th???, t&aacute;c ph???n v??n h???c th??? m???y c???a ?????o di???n, ng?????i vi???t review kh???ng ?????nh ??i???u g&igrave; v??? b??? phim,&hellip;<br />\r\n<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Double mess: 1 th?? th&ocirc;ng b&aacute;o ho&atilde;n meeting gi???a 2 c&ocirc;ng ty v&agrave; re-schedule &ndash; 1 th?? tr??? l???i t??? ch???i ko theo dc schedule m???i v&agrave; ??&iacute;nh k&egrave;m th&ecirc;m t&agrave;i li???u ???????c y&ecirc;u c???u.</p>\r\n','2017-11-27 15:36:14','2017-11-27 15:48:09'),(37,'Unit 24: Ph??n bi???t Just as, When, While, As soon as, Until','listenguideline\\listenguideline_2.png','<p><strong>WHAT</strong></p>\r\n\r\n<p>- Ch&uacute;ng ta s??? d???ng when + th&igrave; hi???n t???i ????? n???i k???t c&aacute;c s??? ki???n m&agrave; ch???c ch???n ho???c r???t c&oacute; th??? x???y ra trong t????ng lai.<br />\r\n<br />\r\nWhen I get back, I&rsquo;ll tell you all about my trip.<br />\r\n<br />\r\nI&rsquo;ll cook dinner when I get home.<br />\r\n<br />\r\n- Ch&uacute;ng ta s??? d???ng when + th&igrave; qu&aacute; kh??? ?????&nbsp;n???i k???t c&aacute;c s??? ki???n m&agrave; ??&atilde; x???y ra trong qu&aacute; kh???.<br />\r\n<br />\r\nWhen I saw the pollution in the city, I was very disappointed.<br />\r\n<br />\r\nI screamed when the man grabbed my arm.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>JUST AS</strong></p>\r\n\r\n<p>- Ch&uacute;ng ta s??? d???ng just as ????? n&oacute;i v??? 2 h&agrave;nh ?????ng ho???c s??? ki???n ng???n m&agrave; ??&atilde; x???y ra g???n ch&iacute;nh x&aacute;c c&ugrave;ng th???i ??i???m.<br />\r\n<br />\r\nThe bus pulled away from the bus stop just as I arrived!<br />\r\n<br />\r\nIt started to rain just as we left.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>WHILE</strong></p>\r\n\r\n<p>- Ch&uacute;ng ta s??? d???ng while ????? di???n t??? 2 h&agrave;nh ?????ng ho???c s??? ki???n d&agrave;i m&agrave; ??&atilde; ??ang x???y ra v&agrave;o th???i ??i???m c&ugrave;ng v???i nhau m???t c&aacute;ch ch&iacute;nh x&aacute;c.<br />\r\n<br />\r\nWhile I was talking on the phone, they were calling for all passengers to board the bus to the beach.<br />\r\n<br />\r\nThere were lots of people trying to sell me things while I was waiting for the bus.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>UNTIL</strong></p>\r\n\r\n<p>- Ch&uacute;ng ta s??? d???ng until ho???c till ????? ?????m s??? l?????ng th???i gian ?????n 1 s??? ki???n t????ng lai &ndash; th&ocirc;ng th?????ng 1 s??? ki???n m&agrave; quan tr???ng ho???c ch&uacute;ng ta h???i h???p v??? n&oacute;.<br />\r\n<br />\r\nIt&rsquo;s only 2 months until my summer vacation.<br />\r\n<br />\r\nThere are only 3 weeks till the wedding. I need to buy a present.<br />\r\n<br />\r\nIt&rsquo;s only 5 minutes until the game starts. You&rsquo;d better hurry up if you want to see it!<br />\r\n<br />\r\nCh&uacute;ng ta s??? d???ng until v&agrave; till ????? di???n t??? 1 kho???ng th???i gian t??? c???t m???c n&agrave;y ?????n c???t m???c kh&aacute;c.<br />\r\n<br />\r\nI had to wait from 9:00 in the morning till 3:00 in the afternoon for the next bus.<br />\r\n<br />\r\nWe have class from 8:00 until 10:00.<br />\r\n<br />\r\nGhi ch&uacute; r???ng till l&agrave; c&aacute;ch ng???n ?????n n&oacute;i until. B???n c&oacute; th??? s??? d???ng ch&uacute;ng thay ?????i v???i nhau, m???c d&ugrave; until th&igrave; trang tr???ng h??n 1 ch&uacute;t.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>AS SOON AS</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- Ch&uacute;ng ta s??? d???ng as soon as ????? di???n t??? 1 h&agrave;nh ?????ng m&agrave; ??&atilde; ???????c th???c hi???n ngay t???c th&igrave; sau 1 h&agrave;nh ?????ng kh&aacute;c trong qu&aacute; kh???.<br />\r\n<br />\r\nI called Mom as soon as I arrived to let her know that I was ok. (T&ocirc;i ??&atilde; ?????n n??i. T&ocirc;i g???i ??i???n cho M??? ngay l???p t???c).<br />\r\n<br />\r\nCh&uacute;ng ta c??ng s??? d???ng as soon as ????? di???n t??? 1 h&agrave;nh ?????ng m&agrave; s??? ???????c th???c hi???n ngay t???c th&igrave; sau 1 h&agrave;nh ?????ng kh&aacute;c trong t????ng lai.<br />\r\n<br />\r\nI&rsquo;ll call you as soon as I get home. (T&ocirc;i s??? v??? nh&agrave;. T&ocirc;i s??? g???i b???n ngay l???p t???c.)</p>\r\n','2017-11-24 17:48:51','2017-11-27 15:41:38'),(38,'Unit 23: T??? v???ng theo ch??? ????? - TOEIC Listening&Reading; (ph???n 4)','listenguideline\\listenguideline_3.jpg','<p><strong>Ch??? ?????: C&aacute;c k?? n??ng trong c&ocirc;ng vi???c</strong></p>\r\n\r\n<p><br />\r\n- communication skills: k?? n??ng giao ti???p<br />\r\n- teamwork skills: k?? n??ng l&agrave;m vi???c nh&oacute;m<br />\r\n- negotiation skills: k?? n??ng th????ng thuy???t<br />\r\n- event management skills: k?? n??ng qu???n l&iacute; s??? ki???n<br />\r\n- problem-solving skills: k?? n??ng gi???i quy???t v???n ?????<br />\r\n- public-speaking skills: k?? n??ng n&oacute;i tr?????c ??&aacute;m ??&ocirc;ng<br />\r\n- computer skills/ PC skills: c&aacute;c k?? n??ng vi t&iacute;nh<br />\r\n- Internet Users Skills: k?? n??ng s??? d???ng c&aacute;c ???ng d???ng tr&ecirc;n m???ng<br />\r\n- Time management skills: k?? n??ng qu???n l&iacute; th???i gian<br />\r\n- Presentation skills: k?? n??ng thuy???t tr&igrave;nh<br />\r\n- Decision-making skills: k?? n??ng ????a ra quy???t ?????nh<br />\r\n- Sales skills: k?? n??ng b&aacute;n h&agrave;ng</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Ch??? ?????: Ch???ng ch??? v&agrave; b???ng c???p</strong><br />\r\n&nbsp;</p>\r\n\r\n<p>- Qualifications: b???ng c???p n&oacute;i chung.<br />\r\n- Bachelor&rsquo;s degree: b???ng ?????i h???c<br />\r\n- Master&rsquo;s Degree: b???ng th???c s??<br />\r\n- Doctoral&nbsp; degree: b???ng ti???n s??<br />\r\n- High school Diploma: b???ng t???t nghi???p c???p 3<br />\r\n- Certificate: ch???ng ch??? (cho kh&oacute;a h???c ng???n ho???c c&aacute;c k&igrave; thi ngo???i ng??? qu???c t???)<br />\r\n&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Ch??? ?????: L????ng v&agrave; ph&uacute;c l???i&nbsp;</strong></p>\r\n\r\n<p><br />\r\n- income: thu nh???p<br />\r\n- salary : l????ng (th?????ng ch??? l????ng theo th&aacute;ng)<br />\r\n- wage: ti???n c&ocirc;ng (theo gi???)<br />\r\n- compensation: th&ugrave; lao, ti???n b???i th?????ng c&ocirc;ng t&aacute;c<br />\r\n- pension: ti???n tr??? c???p, l????ng h??u<br />\r\n-pay raise: s??? t??ng l????ng<br />\r\n- bonus: ti???n th?????ng<br />\r\n<br />\r\n<em>Shared by Ms Thi???n Minh - Hyperactive Messenger</em></p>\r\n','2017-11-24 17:49:20',NULL),(39,'Unit 22: T??? v???ng theo ch??? ????? - TOEIC Listening (ph???n 3)','listenguideline\\listenguideline_4.png','<p><strong>Ch??? ?????: V??n ph&ograve;ng ph???m</strong></p>\r\n\r\n<p><br />\r\n1. Paper clips&nbsp;&ndash; ghim gi???y<br />\r\n2. Stapler&nbsp;&ndash; d???p ghim<br />\r\n3. Highlighter&nbsp;&ndash; b&uacute;t nh??? d&ograve;ng<br />\r\n4. Correction pen &ndash; B&uacute;t x&oacute;a<br />\r\n5. Adhesive tape&nbsp;&ndash; B??ng d&iacute;nh<br />\r\n6. Calculator&nbsp;&ndash; M&aacute;y t&iacute;nh b??? t&uacute;i<br />\r\n7. Marker&nbsp;&ndash; B&uacute;t vi???t b???ng<br />\r\n8. Telephone &ndash; ??i???n tho???i ????? b&agrave;n<br />\r\n9. Computer &ndash; m&aacute;y vi t&iacute;nh<br />\r\n10. Envelope &ndash; phong b&igrave;<br />\r\n11. File cabinet &ndash; t??? ?????ng t&agrave;i li???u<br />\r\n12. Printer &ndash; m&aacute;y in<br />\r\n13. Photocopier &ndash; m&aacute;y photo<br />\r\n14. Projector &ndash; m&aacute;y chi???u</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Ch??? ?????: Ph&ograve;ng ban, ch???c v??? trong m&ocirc;i tr?????ng c&ocirc;ng s???</strong></p>\r\n\r\n<p><br />\r\n1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CEO&nbsp;(Chief Executive Officer): gi&aacute;m ?????c ??i???u h&agrave;nh.<br />\r\n2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Chairman/&nbsp;President: ch??? t???ch<br />\r\n3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vice president: ph&oacute; ch??? t???ch<br />\r\n4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CFO (Chief financial officer): gi&aacute;m ?????c t&agrave;i ch&iacute;nh<br />\r\n5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Board&nbsp;l&agrave; t??? ch??? to&agrave;n th??? c&aacute;c directors&nbsp;v&agrave; h??? h???p ??? ph&ograve;ng g???i l&agrave; boardroom.<br />\r\n6.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Manager: qu???n l&yacute;<br />\r\n7.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Reception: L???t&acirc;n<br />\r\n8.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Officer: Nh&acirc;n vi&ecirc;n v??n ph&ograve;ng<br />\r\n9.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; C&aacute;c ph&ograve;ng ban: Department/ Division<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Personnel/ Human Resources Department: Ph&ograve;ng nh&acirc;n s???<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Marketing Department: Ph&ograve;ng Marketing<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sales Department: Ph&ograve;ng kinh doanh<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;d.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; R &amp; D Department (Research and Development): Ph&ograve;ng nghi&ecirc;n c???u v&agrave; ph&aacute;t tri???n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;e.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Customer Service Department: Ph&ograve;ng d???ch v??? kh&aacute;ch h&agrave;ng<br />\r\n<br />\r\n<em>Shared by Ms Ho&agrave;ng Anh - Shining Smile Messenger</em></p>\r\n','2017-11-24 17:49:46',NULL);
/*!40000 ALTER TABLE `listenguideline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `resultid` bigint(20) NOT NULL AUTO_INCREMENT,
  `listenscore` int(11) NOT NULL,
  `readingscore` int(11) NOT NULL,
  `examinationid` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`resultid`),
  KEY `fk_result_examination` (`examinationid`),
  KEY `fk_result_user` (`userid`),
  CONSTRAINT `fk_result_examination` FOREIGN KEY (`examinationid`) REFERENCES `examination` (`examinationid`),
  CONSTRAINT `fk_result_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (23,4,0,1,4,'2017-12-04 08:09:01',NULL),(24,4,3,1,4,'2017-12-04 08:23:30',NULL),(25,0,0,1,4,'2017-12-04 08:24:56',NULL);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(300) DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `roleid` bigint(20) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `name` (`name`),
  KEY `FK_USER_ROLE_idx` (`roleid`),
  CONSTRAINT `FK_USER_ROLE` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'admin','123456','admin','2017-08-02 22:09:43',1),(4,'truongtunglam','123456','tr????ng tu??ng l??m ',NULL,2),(6,'ronaldo2','456789','ronaldo2',NULL,2),(7,'abc','123456','abc','2017-09-02 02:51:42',1),(12,'jspservlet3','123458','jspservlet3','2017-09-11 21:25:13',2),(13,'jspservlet5','123460','jspservlet5','2017-09-11 21:25:24',2),(14,'vanthidoantrang','123456','v??n thi?? ??oan trang','2017-11-13 02:42:19',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-04 15:32:35
