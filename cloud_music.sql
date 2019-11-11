CREATE DATABASE  IF NOT EXISTS `cloudmusic` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cloudmusic`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cloudmusic
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '专辑名称',
  `description` varchar(1000) DEFAULT '' COMMENT '专辑简介描述',
  `singer_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '歌手id',
  `singer_name` varchar(50) NOT NULL DEFAULT '' COMMENT '歌手名称',
  `company` varchar(50) DEFAULT '' COMMENT '发行公司',
  `create_time` date NOT NULL DEFAULT '0000-01-01' COMMENT '发行时间',
  `collection_music` json NOT NULL COMMENT '收录的歌曲{"id":123, "title":"歌曲名称", "singer":"GEM"}',
  `image` varchar(2083) NOT NULL DEFAULT '' COMMENT '专辑图片',
  `tag` json DEFAULT NULL COMMENT '专辑标签',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='专辑表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `type` int(4) NOT NULL COMMENT '对什么类型进行的评论，是歌曲，歌单还是专辑等',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '评论的内容,仅支持文字',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `thumb_number` int(4) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `record_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对歌曲，歌单，专辑等的id',
  `commentator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '评论者id',
  `commentator_nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者的昵称',
  `commentator_image` varchar(2083) NOT NULL DEFAULT '' COMMENT '评论者头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `follow_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户关注的用户id',
  `follow_nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '关注用户的昵称',
  `follow_image` varchar(2083) NOT NULL DEFAULT '' COMMENT '关注用户的头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='关注表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moments`
--

DROP TABLE IF EXISTS `moments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `creator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `creator_nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '创建者昵称',
  `creator_image` varchar(2083) NOT NULL DEFAULT '' COMMENT '创建者头像',
  `content` json NOT NULL COMMENT '{"文本":,\r\n"链接":"[,]",\r\n:}',
  `publish_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `type` int(4) NOT NULL COMMENT '动态类型，是转发，分享还是发布等',
  `thumb_number` int(4) NOT NULL DEFAULT '0' COMMENT '点赞数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='动态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moments`
--

LOCK TABLES `moments` WRITE;
/*!40000 ALTER TABLE `moments` DISABLE KEYS */;
/*!40000 ALTER TABLE `moments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `music` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `url` varchar(2083) NOT NULL DEFAULT '' COMMENT '歌曲url',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '歌曲名称',
  `belong_album_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '歌曲所属专辑id',
  `belong_album_name` varchar(50) NOT NULL DEFAULT '' COMMENT '歌曲所属专辑名称',
  `singer_id` bigint(20) DEFAULT '0' COMMENT '歌手id',
  `singer_name` varchar(50) DEFAULT '' COMMENT '歌手名称',
  `duration` time NOT NULL COMMENT '歌曲时长',
  `release_time` date NOT NULL DEFAULT '0000-01-01' COMMENT '歌曲发布时间',
  `tag` json DEFAULT NULL COMMENT '歌曲标签',
  `yesterday_play_count` int(20) NOT NULL DEFAULT '0' COMMENT '昨天的播放数',
  `today_play_count` int(20) NOT NULL DEFAULT '0' COMMENT '今天的播放数',
  `total_play_count` int(20) NOT NULL DEFAULT '0' COMMENT '总的播放数',
  `lyric` varchar(1000) NOT NULL DEFAULT '' COMMENT '歌词',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='歌曲表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_sheet`
--

DROP TABLE IF EXISTS `music_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `music_sheet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '歌单名称',
  `description` varchar(3000) DEFAULT '' COMMENT '歌单描述',
  `image` varchar(2083) NOT NULL DEFAULT '' COMMENT '歌单图片',
  `creator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `creator_nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '创建者昵称',
  `create_time` date NOT NULL DEFAULT '0000-01-01' COMMENT '创建时间',
  `collection_number` bigint(20) NOT NULL DEFAULT '0' COMMENT '收藏数',
  `collection_music` json NOT NULL COMMENT '收录的歌曲{"id":123, "title":"歌曲名称", "singer":"GEM",\r\n"duration":"04:54",\r\n"album":"The Best of G.E.M. 2008-2012"}',
  `total_play_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '总的播放数',
  `share_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '分享次数',
  `tag` json DEFAULT NULL COMMENT '歌单标签["流行", "轻音乐"]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='歌单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_sheet`
--

LOCK TABLES `music_sheet` WRITE;
/*!40000 ALTER TABLE `music_sheet` DISABLE KEYS */;
/*!40000 ALTER TABLE `music_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_message`
--

DROP TABLE IF EXISTS `personal_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `sender_id` bigint(20) NOT NULL COMMENT '发送者id',
  `sender_nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '发送者昵称',
  `sender_image` varchar(2083) NOT NULL DEFAULT '' COMMENT '发送者头像',
  `receiver_id` bigint(20) NOT NULL COMMENT '接受者id',
  `receiver_nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '接收者昵称',
  `receiver_image` varchar(50) NOT NULL DEFAULT '' COMMENT '接收者头像',
  `content` json NOT NULL COMMENT '发送消息内容',
  `sending_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='私信表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_message`
--

LOCK TABLES `personal_message` WRITE;
/*!40000 ALTER TABLE `personal_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `singer`
--

DROP TABLE IF EXISTS `singer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `singer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '歌手唯一标识',
  `nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '歌手昵称',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '歌手邮箱',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '歌手密码',
  `image` varchar(2083) DEFAULT '' COMMENT '头像url',
  `gender` int(4) DEFAULT '2' COMMENT '歌手性别(0男，1女，2保密)',
  `tel` varchar(11) DEFAULT '0' COMMENT '歌手手机号码',
  `address` varchar(50) DEFAULT '' COMMENT '歌手地址',
  `description` varchar(50) DEFAULT '' COMMENT '简介',
  `register_time` date NOT NULL DEFAULT '0000-01-01' COMMENT '注册时间',
  `authentication` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否认证',
  `user_id` bigint(20) DEFAULT '0' COMMENT '歌手的普通用户id',
  `tag` json DEFAULT NULL COMMENT '歌手标签',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='歌手表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `singer`
--

LOCK TABLES `singer` WRITE;
/*!40000 ALTER TABLE `singer` DISABLE KEYS */;
/*!40000 ALTER TABLE `singer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户唯一标识',
  `nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称(不允许重复)',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '用户邮箱(不允许重复)',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '用户密码',
  `image` varchar(2083) DEFAULT '' COMMENT '头像url',
  `gender` int(4) DEFAULT '2' COMMENT '用户性别(0男，1女，2保密)',
  `tel` varchar(11) DEFAULT '0' COMMENT '用户手机号码',
  `address` varchar(50) DEFAULT '' COMMENT '用户地址',
  `description` varchar(50) DEFAULT '' COMMENT '用户描述，简介',
  `register_time` date NOT NULL DEFAULT '0000-01-01' COMMENT '注册时间',
  `notification` json NOT NULL COMMENT '允许通知类型\r\n{"私信":0,\r\n"点赞通知":1,\r\n"评论回复":1}',
  `birthday` date DEFAULT '0000-01-01' COMMENT '用户生日',
  `moment_number` int(4) NOT NULL DEFAULT '0' COMMENT '动态记录数',
  `follow_number` int(4) NOT NULL DEFAULT '0' COMMENT '关注人数',
  `follower_number` int(4) NOT NULL DEFAULT '0' COMMENT '粉丝人数',
  `tag` json DEFAULT NULL COMMENT '用户标签',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_collection_sheet`
--

DROP TABLE IF EXISTS `user_collection_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_collection_sheet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `sheet_id` bigint(20) NOT NULL COMMENT '歌单id',
  `sheet_title` varchar(50) NOT NULL DEFAULT '' COMMENT '歌单名称',
  `sheet_image` varchar(2083) NOT NULL DEFAULT '' COMMENT '歌单图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏歌单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_collection_sheet`
--

LOCK TABLES `user_collection_sheet` WRITE;
/*!40000 ALTER TABLE `user_collection_sheet` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_collection_sheet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-10 21:48:48
