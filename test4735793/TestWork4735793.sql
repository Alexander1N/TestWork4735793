-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: example
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2022_04_09_130009_create_blogs_table',2),(6,'2022_04_10_081719_create_students_table',2),(7,'2022_04_11_095139_create_student_teacher_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_teacher`
--

DROP TABLE IF EXISTS `student_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_teacher` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_teacher_student_id_foreign` (`student_id`),
  KEY `student_teacher_teacher_id_foreign` (`teacher_id`),
  CONSTRAINT `student_teacher_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `student_teacher_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_teacher`
--

LOCK TABLES `student_teacher` WRITE;
/*!40000 ALTER TABLE `student_teacher` DISABLE KEYS */;
INSERT INTO `student_teacher` VALUES (1,1,2),(2,2,3),(3,3,3),(4,3,4),(5,4,3),(6,4,5),(7,5,6),(8,5,14),(9,6,7),(10,6,15),(11,7,8),(12,8,9),(13,9,10),(14,10,11);
/*!40000 ALTER TABLE `student_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` int unsigned DEFAULT NULL,
  `registration_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Фуриков Эрнст',18,'2016-01-01 00:00:00'),(2,'Амбражевич Порфирий',19,'2016-01-08 00:00:00'),(3,'Носов Макар',20,'2016-01-15 00:00:00'),(4,'Кооскора Вениамин',21,'2016-01-22 00:00:00'),(5,'Беленков Денис',22,'2016-01-29 00:00:00'),(6,'Блаженов Артем',23,'2016-02-05 00:00:00'),(7,'Элиашев Владимир',24,'2016-02-12 00:00:00'),(8,'Корбылев Якуб',25,'2016-02-19 00:00:00'),(9,'Пономарев Валерьян',26,'2016-02-26 00:00:00'),(10,'Шаломенцев Феоктист',27,'2016-03-04 00:00:00'),(11,'Шамило Федосий',28,'2016-03-11 00:00:00'),(12,'Коржаков Юлий',29,'2016-03-18 00:00:00'),(13,'Якусик Вячеслав',30,'2016-03-25 00:00:00'),(14,'Кутяков Ефрем',31,'2016-04-01 00:00:00'),(15,'Бондарев Игорь',32,'2016-04-08 00:00:00'),(16,'Журавлев Севастьян',33,'2016-04-15 00:00:00'),(17,'Иньшов Геннадий',34,'2016-04-22 00:00:00'),(18,'Шабанов Клавдий',35,'2016-04-29 00:00:00'),(19,'Жириновский Наум',36,'2016-05-06 00:00:00'),(20,'Шалаганов Константин',37,'2016-05-13 00:00:00'),(21,'Пичугин Дмитрий',38,'2016-05-20 00:00:00'),(22,'Гилёв Самсон',39,'2016-05-27 00:00:00'),(23,'Алексахин Валерий',40,'2016-06-03 00:00:00'),(24,'Коршиков Матвей',41,'2016-06-10 00:00:00'),(25,'Лавлинский Сидор',42,'2016-06-17 00:00:00'),(26,'Шведов Юрий',43,'2016-06-24 00:00:00'),(27,'Шмелёв Гаврила',18,'2016-07-01 00:00:00'),(28,'Караулин Борис',19,'2016-07-08 00:00:00'),(29,'Веденеев Кондрат',20,'2016-07-15 00:00:00'),(30,'Авдеев Панкратий',21,'2016-07-22 00:00:00'),(31,'Свалов Арсений',22,'2016-07-29 00:00:00'),(32,'Кахманова Захар',23,'2016-08-05 00:00:00'),(33,'Фунтусов Ярослав',24,'2016-08-12 00:00:00'),(34,'Алехин Максимильян',25,'2016-08-19 00:00:00'),(35,'Племянников Всеслав',26,'2016-08-26 00:00:00'),(36,'Гудков Харитон',27,'2016-09-02 00:00:00'),(37,'Жариков Афанасий',28,'2016-09-09 00:00:00'),(38,'Земцовский Всеволод',29,'2016-09-16 00:00:00'),(39,'Грузинский Парфен',30,'2016-09-23 00:00:00'),(40,'Калашников Терентий',31,'2016-09-30 00:00:00'),(41,'Молодых Елисей',32,'2016-10-07 00:00:00'),(42,'Кутепов Ефим',33,'2016-10-14 00:00:00'),(43,'Погребняк Давид',34,'2016-10-21 00:00:00'),(44,'Щеглов Ким',35,'2016-10-28 00:00:00'),(45,'Толмачёв Аристарх',36,'2016-11-04 00:00:00'),(46,'Саввин Онисим',37,'2016-11-11 00:00:00'),(47,'Бойков Максим',38,'2016-11-18 00:00:00'),(48,'Бурцов Никита',39,'2016-11-25 00:00:00'),(49,'Квасников Емельян',40,'2016-12-02 00:00:00'),(50,'Кандаков Адриан',41,'2016-12-09 00:00:00'),(51,'Дьячков Севастьян',18,'2016-12-16 00:00:00'),(52,'Ягафаров Никон',19,'2016-12-23 00:00:00'),(53,'Елизаров Агап',20,'2016-12-30 00:00:00'),(54,'Яшнов Владимир',21,'2017-01-06 00:00:00'),(55,'Дутов Александр',22,'2017-01-13 00:00:00'),(56,'Порошин Степан',23,'2017-01-20 00:00:00'),(57,'Загряжский Марк',24,'2017-01-27 00:00:00'),(58,'Цвиленев Никита',25,'2017-02-03 00:00:00'),(59,'Хватов Борислав',26,'2017-02-10 00:00:00'),(60,'Нюхалов Валентин',27,'2017-02-17 00:00:00'),(61,'Боварин Анатолий',28,'2017-02-24 00:00:00'),(62,'Закрятин Георгий',29,'2017-03-03 00:00:00'),(63,'Косков Иннокентий',30,'2017-03-10 00:00:00'),(64,'Лероев Парфен',31,'2017-03-17 00:00:00'),(65,'Тянников Иларион',32,'2017-03-24 00:00:00'),(66,'Сафонов Самуил',33,'2017-03-31 00:00:00'),(67,'Бугаков Валерий',34,'2017-04-07 00:00:00'),(68,'Гайденко Илья',35,'2017-04-14 00:00:00'),(69,'Перехваткин Сергей',36,'2017-04-21 00:00:00'),(70,'Барсуков Виктор',37,'2017-04-28 00:00:00'),(71,'Абакумов Казимир',38,'2017-05-05 00:00:00'),(72,'Катаев Павел',39,'2017-05-12 00:00:00'),(73,'Валевач Измаил',40,'2017-05-19 00:00:00'),(74,'Кортнев Дмитрий',41,'2017-05-26 00:00:00'),(75,'Богачёв Тихон',42,'2017-06-02 00:00:00'),(76,'Дейнекин Даниил',43,'2017-06-09 00:00:00'),(77,'Большаков Панкратий',18,'2017-06-16 00:00:00'),(78,'Царёв Герасим',19,'2017-06-23 00:00:00'),(79,'Бурда Рубен',20,'2017-06-30 00:00:00'),(80,'Можаев Адриан',21,'2017-07-07 00:00:00'),(81,'Давыдов Филипп',22,'2017-07-14 00:00:00'),(82,'Ядрихинский Егор',23,'2017-07-21 00:00:00'),(83,'Никольский Всеслав',24,'2017-07-28 00:00:00'),(84,'Лилов Тимофей',25,'2017-08-04 00:00:00'),(85,'Клоков Ярослав',26,'2017-08-11 00:00:00'),(86,'Тургенев Самсон',27,'2017-08-18 00:00:00'),(87,'Разин Кондрат',28,'2017-08-25 00:00:00'),(88,'Шуста Трофим',29,'2017-09-01 00:00:00'),(89,'Лассман Платон',30,'2017-09-08 00:00:00'),(90,'Вязьмитин Игнат',31,'2017-09-15 00:00:00'),(91,'Круминьш Виталий',32,'2017-09-22 00:00:00'),(92,'Янпольский Михей',33,'2017-09-29 00:00:00'),(93,'Чичерин Федосий',34,'2017-10-06 00:00:00'),(94,'Решетилов Изяслав',35,'2017-10-13 00:00:00'),(95,'Ягренев Прохор',36,'2017-10-20 00:00:00'),(96,'Герций Афанасий',37,'2017-10-27 00:00:00'),(97,'Ремизов Эрнест',38,'2017-11-03 00:00:00'),(98,'Ютилов Ерофей',39,'2017-11-10 00:00:00'),(99,'Ярмухаметов Фома',40,'2017-11-17 00:00:00'),(100,'Берлунов Вадим',41,'2017-11-24 00:00:00');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salary` int unsigned DEFAULT NULL,
  `age` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Ягешев Сидор',10000,18),(2,'Яглинцев Владислав',20000,19),(3,'Апалков Ростислав',30000,20),(4,'Колиух Вацлав',5000,21),(5,'Ядренкин Елисей',2000,22),(6,'Шерков Артемий',3000,23),(7,'Хованский Платон',4000,24),(8,'Неелов Федор',6000,25),(9,'Калугер Вениамин',7500,26),(10,'Лобан Эммануил',8500,27),(11,'Яньков Эрнест',10000,28),(12,'Александрович Викентий',20000,29),(13,'Карявин Ерофей',30000,30),(14,'Корявин Илья',5000,31),(15,'Ямщиков Леонид',2000,32),(16,'Баскаков Егор',3000,33),(17,'Рождественский Ян',4000,34),(18,'Булдаков Евсей',6000,35),(19,'Седегов Варфоломей',7500,36),(20,'Пугачёв Лукьян',8500,37),(21,'Кубышкин Трофим',10000,38),(22,'Гавшин Онисим',20000,39),(23,'Яржемковский Дмитрий',30000,40),(24,'Янко Петр',5000,41),(25,'Сияница Олег',2000,42),(26,'Борисюк Саввелий',3000,43),(27,'Травников Ипатий',4000,18),(28,'Ерохин Павел',6000,19),(29,'Раскатов Вадим',7500,20),(30,'Разумов Феофан',8500,21),(31,'Лужков Назар',10000,22),(32,'Вельдин Вячеслав',20000,23),(33,'Яснов Онуфрий',30000,24),(34,'Касимов Прокофий',5000,25),(35,'Ажищенков Фома',2000,26),(36,'Столяров Авдей',3000,27),(37,'Федченков Константин',4000,28),(38,'Шамило Лаврентий',6000,29),(39,'Геремеш Георгий',7500,30),(40,'Кизюрин Евграф',8500,31),(41,'Чубаров Еремей',10000,32),(42,'Яблоновский Юлий',20000,33),(43,'Серов Яков',30000,34),(44,'Дьячков Мирон',5000,35),(45,'Матеров Данил',2000,36),(46,'Гурин Фока',3000,37),(47,'Панькив Поликарп',4000,38),(48,'Киселев Александр',6000,39),(49,'Махов Валентин',7500,40),(50,'Чечуров Радион',8500,41);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-12 10:42:31
