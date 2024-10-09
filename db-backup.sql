-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: batistaluccas.mysql.pythonanywhere-services.com    Database: batistaluccas$loja_gas
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add produto',7,'add_produto'),(26,'Can change produto',7,'change_produto'),(27,'Can delete produto',7,'delete_produto'),(28,'Can view produto',7,'view_produto'),(29,'Can add bairro',8,'add_bairro'),(30,'Can change bairro',8,'change_bairro'),(31,'Can delete bairro',8,'delete_bairro'),(32,'Can view bairro',8,'view_bairro'),(33,'Can add cliente',9,'add_cliente'),(34,'Can change cliente',9,'change_cliente'),(35,'Can delete cliente',9,'delete_cliente'),(36,'Can view cliente',9,'view_cliente'),(37,'Can add item nota venda',10,'add_itemnotavenda'),(38,'Can change item nota venda',10,'change_itemnotavenda'),(39,'Can delete item nota venda',10,'delete_itemnotavenda'),(40,'Can view item nota venda',10,'view_itemnotavenda'),(41,'Can add nota venda',11,'add_notavenda'),(42,'Can change nota venda',11,'change_notavenda'),(43,'Can delete nota venda',11,'delete_notavenda'),(44,'Can view nota venda',11,'view_notavenda'),(45,'Can add tipo pagamento',12,'add_tipopagamento'),(46,'Can change tipo pagamento',12,'change_tipopagamento'),(47,'Can delete tipo pagamento',12,'delete_tipopagamento'),(48,'Can view tipo pagamento',12,'view_tipopagamento');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$gqpUuVnRB9BRoiU3Bqj4OW$iq4C8Y1s6qJcfzC4vj5jqssPN1R32P+vNAzdy7ATI50=','2024-09-14 01:55:07.632001',1,'vini','','','',1,1,'2024-09-13 19:16:37.344991'),(2,'pbkdf2_sha256$870000$Dg8OdU5MIxRnoIONmeYV1s$ymccPY0iYqlRO+RJXm1NJm5icBvaUKVaoMumj2pXlTg=','2024-10-03 22:44:07.636419',1,'lucas','','','',1,1,'2024-09-14 00:05:28.210633');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bairro`
--

DROP TABLE IF EXISTS `bairro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bairro` (
  `id_bairro` int NOT NULL AUTO_INCREMENT,
  `nome_bairro` varchar(100) NOT NULL,
  `frete_bairro` float DEFAULT NULL,
  PRIMARY KEY (`id_bairro`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairro`
--

LOCK TABLES `bairro` WRITE;
/*!40000 ALTER TABLE `bairro` DISABLE KEYS */;
INSERT INTO `bairro` VALUES (4,'Altos de Bragança',7),(5,'Bairro do Uberaba',5),(6,'Bom Retiro',7),(7,'Bosques da Pedra',10),(8,'Centro',5),(9,'Centro Industrial Rafael Diniz',5),(10,'Cidade Jardim',10),(11,'Cidade Planejada I',10),(12,'Cidade Planejada II',10),(13,'Cidade Universitária',10),(14,'Condomínio Berbari II',7),(15,'Condomínio Berbari Residencial Club',7),(16,'Condomínio Jardim das Palmeiras',15),(17,'Condomínio Jardim Flamboyan',15),(18,'Condomínio Portal da Serra',10),(19,'Condomínio Residencial Euroville',10),(20,'Condomínio Residencial Euroville II',10),(21,'Condomínio Residencial Mirante de Bragança',15),(22,'Condomínio Residencial Rosário de Fátima',10),(23,'Condomínio Residencial Santa Helena',15),(24,'Condominio Residencial Vereda América',10),(25,'Condomínio Residencial Vila Rica',15),(26,'Condomínio Vale das Águas',10),(27,'Condomínio Villa Real de Bragança',10),(28,'Conjunto Habitacional Angelo Magrini Lisa',5),(29,'Conjunto Habitacional Bragança Paulista F II',10),(30,'Conjunto Habitacional Francisco Sabella',7),(31,'Conjunto Habitacional Nova Cidade',10),(32,'Conjunto Habitacional Saada Nader Abi Chedid',5),(33,'Conjunto Habitacional Vereador Adilson Leitão Xavier',5),(34,'Conjunto Residencial Nilo Torres Salema',3),(35,'Cruzeiro',5),(36,'Green Park',7),(37,'Jardim Águas Claras',10),(38,'Jardim América',10),(39,'Jardim Anchieta',5),(40,'Jardim Aracati',7),(41,'Jardim Bela Vista',5),(42,'Jardim Comendador Cardoso',5),(43,'Jardim da Fraternidade',7),(44,'Jardim das Laranjeiras',3),(45,'Jardim das Palmeiras',15),(46,'Jardim do Cedro',5),(47,'Jardim do Lago',10),(48,'Jardim do Sul',10),(49,'Jardim Doutor Júlio de Mesquita Filho',5),(50,'Jardim Europa',10),(51,'Jardim Iguatemi',7),(52,'Jardim Lago do Moinho',5),(53,'Jardim Morumbi',5),(54,'Jardim Nova América',7),(55,'Jardim Nova Bragança',7),(56,'Jardim Novo Mundo',7),(57,'Jardim Paturi',7),(58,'Jardim Primavera',10),(59,'Jardim Recanto Alegre',7),(60,'Jardim Recreio',3),(61,'Jardim Santa Lúcia',5),(62,'Jardim Santa Paulina',5),(63,'Jardim Santa Rita de Cássia',5),(64,'Jardim São Cristóvão',5),(65,'Jardim São José',10),(66,'Jardim São Lourenço',5),(67,'Jardim São Miguel',7),(68,'Jardim Sevilha',7),(69,'Jardim Vista Alegre',7),(70,'Jardins',10),(71,'Lagos de Santa Helena',15),(72,'Lavapés',5),(73,'Matadouro',5),(74,'Núcleo Habitacional Padre Aldo Bolini',5),(75,'Núcleo Residencial Henedina Rodrigues Cortez',10),(76,'Parque Brasil',7),(77,'Parque dos Estados',10),(78,'Penha',7),(79,'Quintas de Bragança',7),(80,'Recanto Amapola',10),(81,'Recanto Maranata',7),(82,'Residencial Colinas de São Francisco',10),(83,'Residencial das Ilhas',7),(84,'Residencial dos Ipês I',7),(85,'Residencial dos Ipês III',7),(86,'Residencial dos Lagos',7),(87,'Residencial Floresta São Vicente',10),(88,'Residencial Hípica Jaguari',10),(89,'Residencial Piemonte',10),(90,'Residencial Quinta dos Vinhedos',10),(91,'Residencial Vem Viver',10),(92,'Residencial Vino Barolo',10),(93,'Santa Luzia',10),(94,'Santa Rosa',10),(95,'Sete Pontes',7),(96,'Taboão',10),(97,'Tanque do Moinho',5),(98,'Toró',7),(99,'Torozinho',7),(100,'Vila Batista',7),(101,'Vila Bernadete',7),(102,'Vila Bianchi',3),(103,'Vila Bocaina',7),(104,'Vila David',7),(105,'Vila Edna',7),(106,'Vila Esperança',7),(107,'Vila Flora',7),(108,'Vila Garcia',7),(109,'Vila Gato',7),(110,'Vila Maria José',7),(111,'Vila Mota',7),(112,'Vila Municipal',5),(113,'Vila Santa Libânia',5),(114,'Vila São Caetano',5),(115,'Vila Savaio',5),(116,'Vila Vicchiatti',5),(117,'Villa Toscana',7),(118,'teste',1);
/*!40000 ALTER TABLE `bairro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(100) NOT NULL,
  `telefone_cliente` varchar(100) NOT NULL,
  `rua_cliente` varchar(100) DEFAULT NULL,
  `numero_cliente` varchar(100) DEFAULT NULL,
  `id_bairro` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `id_bairro` (`id_bairro`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_bairro`) REFERENCES `bairro` (`id_bairro`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (30,'LUCAS LIMA BATISTA','31991882338','TESTE 2','618',60),(31,'VINICIUS RODRIGUES DE TOLEDO','1133336666','Av. São Lourenço','739',71);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-09-13 20:59:40.942357','1','Vinícius Rodrigues de Toledo',1,'[{\"added\": {}}]',9,1),(2,'2024-09-13 21:00:39.868172','1','anhumas',1,'[{\"added\": {}}]',8,1),(3,'2024-09-13 21:00:50.929530','2','Maria',1,'[{\"added\": {}}]',9,1),(4,'2024-09-13 21:21:32.654975','1','Vinícius Rodrigues de Toledo',2,'[{\"changed\": {\"fields\": [\"Id bairro\"]}}]',9,1),(5,'2024-09-13 21:29:31.381504','3','Zelao',1,'[{\"added\": {}}]',9,1),(6,'2024-09-13 21:34:24.925889','2','Cruzeiro',1,'[{\"added\": {}}]',8,1),(7,'2024-09-13 21:34:45.871014','3','Vila Bianchi',1,'[{\"added\": {}}]',8,1),(8,'2024-09-14 15:25:56.129318','1','Crédito',1,'[{\"added\": {}}]',12,1),(9,'2024-09-14 15:26:02.930420','2','Débito',1,'[{\"added\": {}}]',12,1),(10,'2024-09-14 15:26:10.351212','3','Dinheiro',1,'[{\"added\": {}}]',12,1),(11,'2024-09-14 15:26:20.044386','4','PIX',1,'[{\"added\": {}}]',12,1),(12,'2024-09-14 15:26:34.766075','5','VR',1,'[{\"added\": {}}]',12,1),(13,'2024-09-14 15:50:35.942483','3','Gás',2,'[{\"changed\": {\"fields\": [\"Nome produto\", \"Desc produto\", \"Quantidade disponivel\", \"Preco produto\", \"Nivel abastecimento\", \"Imagem produto\"]}}]',7,1),(14,'2024-09-14 15:51:06.054414','3','Gás',2,'[{\"changed\": {\"fields\": [\"Imagem produto\"]}}]',7,1),(15,'2024-09-14 19:31:57.466672','1','1',1,'[{\"added\": {}}]',11,2),(16,'2024-09-16 23:11:07.478798','26','a',1,'[{\"added\": {}}]',9,1),(17,'2024-09-19 17:36:39.617788','24','24',3,'',11,1),(18,'2024-09-19 17:36:39.617944','23','23',3,'',11,1),(19,'2024-09-19 17:36:39.617986','22','22',3,'',11,1),(20,'2024-09-19 17:36:39.618024','21','21',3,'',11,1),(21,'2024-09-19 17:36:39.618075','20','20',3,'',11,1),(22,'2024-09-19 17:36:54.892672','18','24 - Gás',3,'',10,1),(23,'2024-09-19 17:36:54.892778','17','23 - Gás',3,'',10,1),(24,'2024-09-19 17:36:54.892817','16','22 - Gás',3,'',10,1),(25,'2024-09-19 17:36:54.892852','15','21 - Gás',3,'',10,1),(26,'2024-09-19 17:36:54.892875','14','20 - Gás',3,'',10,1),(27,'2024-09-19 17:37:00.942077','24','24',3,'',11,1),(28,'2024-09-19 17:37:00.942117','23','23',3,'',11,1),(29,'2024-09-19 17:37:00.942140','22','22',3,'',11,1),(30,'2024-09-19 17:37:00.942160','21','21',3,'',11,1),(31,'2024-09-19 17:37:00.942191','20','20',3,'',11,1),(32,'2024-09-19 18:02:08.968073','10','Galão de água',2,'[{\"changed\": {\"fields\": [\"Imagem produto\"]}}]',7,1),(33,'2024-09-19 19:24:45.177741','31','VINICIUS RODRIGUES DE TOLEDO',1,'[{\"added\": {}}]',9,1),(34,'2024-09-19 19:25:20.561607','32','João Sem Braço',1,'[{\"added\": {}}]',9,1),(35,'2024-09-19 19:25:32.198170','32','JOÃO SEM BRAÇO',2,'[{\"changed\": {\"fields\": [\"Nome cliente\"]}}]',9,1),(36,'2024-09-19 19:26:21.620376','33','PAULA TEJANO',1,'[{\"added\": {}}]',9,1),(37,'2024-09-19 19:27:46.841783','34','VINICIUS RODRIGUES DE TOLEDO',3,'',9,1),(38,'2024-09-21 14:51:50.305513','118','teste',1,'[{\"added\": {}}]',8,2),(41,'2024-09-27 04:07:41.511013','31','VINICIUS RODRIGUES DE TOLEDO',2,'[{\"changed\": {\"fields\": [\"Id bairro\"]}}]',9,1),(42,'2024-09-27 04:10:25.221984','27','27',3,'',11,1),(43,'2024-09-27 04:10:25.222035','26','26',3,'',11,1),(44,'2024-09-27 04:10:25.222065','25','25',3,'',11,1),(45,'2024-09-27 04:10:35.044308','22','27 - Gelo de coco',3,'',10,1),(46,'2024-09-27 04:10:35.044380','21','27 - Galão de água',3,'',10,1),(47,'2024-09-27 04:10:35.044428','20','26 - Gás',3,'',10,1),(48,'2024-09-27 04:10:35.044472','19','25 - Galão de água',3,'',10,1),(49,'2024-09-27 04:10:42.338363','27','27',3,'',11,1),(50,'2024-09-27 04:10:42.338424','26','26',3,'',11,1),(51,'2024-09-27 04:10:42.338465','25','25',3,'',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'cliente','bairro'),(9,'cliente','cliente'),(5,'contenttypes','contenttype'),(7,'produto','produto'),(6,'sessions','session'),(10,'venda','itemnotavenda'),(11,'venda','notavenda'),(12,'venda','tipopagamento');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-09-13 18:52:00.426682'),(2,'auth','0001_initial','2024-09-13 18:52:01.233422'),(3,'admin','0001_initial','2024-09-13 18:52:01.468644'),(4,'admin','0002_logentry_remove_auto_add','2024-09-13 18:52:01.529082'),(5,'admin','0003_logentry_add_action_flag_choices','2024-09-13 18:52:01.587860'),(6,'contenttypes','0002_remove_content_type_name','2024-09-13 18:52:01.777638'),(7,'auth','0002_alter_permission_name_max_length','2024-09-13 18:52:01.900674'),(8,'auth','0003_alter_user_email_max_length','2024-09-13 18:52:02.016668'),(9,'auth','0004_alter_user_username_opts','2024-09-13 18:52:02.153393'),(10,'auth','0005_alter_user_last_login_null','2024-09-13 18:52:02.360159'),(11,'auth','0006_require_contenttypes_0002','2024-09-13 18:52:02.374523'),(12,'auth','0007_alter_validators_add_error_messages','2024-09-13 18:52:02.427643'),(13,'auth','0008_alter_user_username_max_length','2024-09-13 18:52:02.580762'),(14,'auth','0009_alter_user_last_name_max_length','2024-09-13 18:52:02.776249'),(15,'auth','0010_alter_group_name_max_length','2024-09-13 18:52:02.923825'),(16,'auth','0011_update_proxy_permissions','2024-09-13 18:52:03.019808'),(17,'auth','0012_alter_user_first_name_max_length','2024-09-13 18:52:03.181437'),(18,'cliente','0001_initial','2024-09-13 18:52:03.195472'),(19,'produto','0001_initial','2024-09-13 18:52:03.214810'),(20,'sessions','0001_initial','2024-09-13 18:52:03.298144'),(21,'venda','0001_initial','2024-09-13 18:52:03.312261');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4qey4075rjesjbacr1ryxrytc70ulzya','.eJxVzM0OwiAQBOB34WwIP6VQj977DGR3AakaSEp7Mr67NOlBrzPfzJt52Lfs9xZXvwR2ZYpdfjMEesZyFOEB5V451bKtC_KD8LNtfK4hvm6n_TvI0HJfAw1SqsESmgSTIjIOEwpSVo_kIDhAYSLhFJXUQgc1oqXUebJoOmKfLwG7OK4:1swUYJ:2HenbCQht51lrNDL7reGBXXB71C5TFz2Fj5pq1jixTs','2024-10-17 22:44:07.649273'),('bex4wtcwzgsbwj4ssl5gas7bltuonqvw','.eJxVzM0OwiAQBOB34WwIP6VQj977DGR3AakaSEp7Mr67NOlBrzPfzJt52Lfs9xZXvwR2ZYpdfjMEesZyFOEB5V451bKtC_KD8LNtfK4hvm6n_TvI0HJfAw1SqsESmgSTIjIOEwpSVo_kIDhAYSLhFJXUQgc1oqXUebJoOmKfLwG7OK4:1spGIR:hL11WJLfQttMoap52uxR9kXXXc55bDL5LVUwmbe9CUI','2024-09-28 00:05:51.620238'),('e27xqg0ep5kq5mxwccz57y3epn7hr3qr','.eJxVjEEOwiAQAP_C2RCWFgGP3vuGZhdYqRpISnsy_l1JetDrzGReYsZ9y_Pe0jovUVwEiNMvIwyPVLqIdyy3KkMt27qQ7Ik8bJNTjel5Pdq_QcaW-9aRRzCJwQdtQXnU4NlF9GR4VBzU2Q3aGK0tq9EZspZpAPL8bbUC8f4AzHE23w:1spI0B:wg4vtGgtwRQYWJD4NkPk_J4QXtgvCAVc_FIfse421hc','2024-09-28 01:55:07.641195'),('m3a3oa178xoe7k205d95ljfcypokxjzy','.eJxVzM0OwiAQBOB34WwIP6VQj977DGR3AakaSEp7Mr67NOlBrzPfzJt52Lfs9xZXvwR2ZYpdfjMEesZyFOEB5V451bKtC_KD8LNtfK4hvm6n_TvI0HJfAw1SqsESmgSTIjIOEwpSVo_kIDhAYSLhFJXUQgc1oqXUebJoOmKfLwG7OK4:1spYMp:q3QIZ8PLGrygN0MDg_HNXiy3s65KB6Exfvzf8bg_JpY','2024-09-28 19:23:35.180255'),('mt537ko00g0f9gqtav6cpx0mom8oxuc3','.eJxVjEEOwiAQAP_C2RCWFgGP3vuGZhdYqRpISnsy_l1JetDrzGReYsZ9y_Pe0jovUVwEiNMvIwyPVLqIdyy3KkMt27qQ7Ik8bJNTjel5Pdq_QcaW-9aRRzCJwQdtQXnU4NlF9GR4VBzU2Q3aGK0tq9EZspZpAPL8bbUC8f4AzHE23w:1spDvO:uoXO9GPNLEiy6AN0y98NCsO4BcbC21yhIC5cJLFf3MA','2024-09-27 21:33:54.682052'),('yg07vwptijl9n9tgcwqluvc3ndc6oxjs','.eJxVjUEOwiAQRe_C2pCZAgN16d4zEGCoVA1NSrsy3l1JutDtfy_vv4QP-1b83vLqZxZngeL0u8WQHrl2wPdQb4tMS93WOcquyIM2eV04Py-H-xcooZWeHUEzAhMhJAuYNCprjJusUuwAlA0TUbKRYHCUIxnUhmLA7wXxMIr3B6LYNp8:1spDQS:ULCx3Nwbe7tpRpJD0pan9_HQ1r1zpG6MDQ8XDmHxGCE','2024-09-27 21:01:56.889235');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_nota_venda`
--

DROP TABLE IF EXISTS `item_nota_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_nota_venda` (
  `id_item_da_nota` int NOT NULL AUTO_INCREMENT,
  `id_nota_venda` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  `quantidade_item` int NOT NULL,
  PRIMARY KEY (`id_item_da_nota`),
  KEY `id_nota_venda` (`id_nota_venda`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `item_nota_venda_ibfk_1` FOREIGN KEY (`id_nota_venda`) REFERENCES `nota_venda` (`id_nota_venda`),
  CONSTRAINT `item_nota_venda_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_nota_venda`
--

LOCK TABLES `item_nota_venda` WRITE;
/*!40000 ALTER TABLE `item_nota_venda` DISABLE KEYS */;
INSERT INTO `item_nota_venda` VALUES (54,51,3,1),(55,51,10,1),(56,52,3,3),(57,52,10,2),(58,53,3,2),(59,53,10,1),(60,54,3,4),(61,54,10,2),(62,54,11,1),(63,55,11,10),(64,56,11,2),(65,56,10,2),(66,57,10,2);
/*!40000 ALTER TABLE `item_nota_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_venda`
--

DROP TABLE IF EXISTS `nota_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nota_venda` (
  `id_nota_venda` int NOT NULL AUTO_INCREMENT,
  `valor_total` float NOT NULL,
  `data_nota_venda` datetime DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_tipo_pagamento` int NOT NULL,
  `id_bairro_entrega` int DEFAULT NULL,
  `rua_entrega` varchar(255) DEFAULT NULL,
  `numero_entrega` varchar(10) DEFAULT NULL,
  `telefone_entrega` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_nota_venda`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_tipo_pagamento` (`id_tipo_pagamento`),
  KEY `fk_bairro_entrega` (`id_bairro_entrega`),
  CONSTRAINT `fk_bairro_entrega` FOREIGN KEY (`id_bairro_entrega`) REFERENCES `bairro` (`id_bairro`),
  CONSTRAINT `nota_venda_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `nota_venda_ibfk_2` FOREIGN KEY (`id_tipo_pagamento`) REFERENCES `tipo_pagamento` (`id_tipo_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_venda`
--

LOCK TABLES `nota_venda` WRITE;
/*!40000 ALTER TABLE `nota_venda` DISABLE KEYS */;
INSERT INTO `nota_venda` VALUES (51,129,'2024-10-03 03:00:00',31,1,71,'Av. São Lourenço','739','1133336666'),(52,348,'2024-10-03 03:00:00',31,1,71,'Av. São Lourenço','739','1133336666'),(53,234,'2024-10-03 03:00:00',31,1,71,'Av. São Lourenço','739','1133336666'),(54,456,'2024-10-03 03:00:00',31,1,71,'Av. São Lourenço','739','1133336666'),(55,35,'2024-10-03 03:00:00',30,1,8,'TESTE 2','618','31991882338'),(56,29,'2024-10-03 03:00:00',31,1,35,'Av. São Lourenço','739','1133336666'),(57,21,'2024-10-03 03:00:00',30,1,60,'TESTE 2','618','31991882338');
/*!40000 ALTER TABLE `nota_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(100) NOT NULL,
  `desc_produto` varchar(100) DEFAULT NULL,
  `quantidade_disponivel` int DEFAULT NULL,
  `preco_produto` float DEFAULT NULL,
  `nivel_abastecimento` int DEFAULT NULL,
  `imagem_produto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (3,'Gás','Botijão de gás GLP P13',51,105,5,'/img/gas.png'),(10,'Galão de água','Água Vitta Saúde',10,9,5,'/img/galao_foto.png'),(11,'Gelo de coco','Gelo de coco OHANA',10,3,5,'/img/gelo_coco.png'),(12,'Gelo Seco','Saco de gelo OHANA',10,10,5,'/img/gelo_cubo.png'),(13,'Carvão Vegetal','Saco de carvão 4kg',10,15,5,'/img/saco_carvao.png');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pagamento`
--

DROP TABLE IF EXISTS `tipo_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_pagamento` (
  `id_tipo_pagamento` int NOT NULL AUTO_INCREMENT,
  `desc_tipo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipo_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pagamento`
--

LOCK TABLES `tipo_pagamento` WRITE;
/*!40000 ALTER TABLE `tipo_pagamento` DISABLE KEYS */;
INSERT INTO `tipo_pagamento` VALUES (1,'Crédito'),(2,'Débito'),(3,'Dinheiro'),(4,'PIX'),(5,'VR');
/*!40000 ALTER TABLE `tipo_pagamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-04 16:16:26
