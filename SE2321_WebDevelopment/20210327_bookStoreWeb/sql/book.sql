CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `author` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `isbn` varchar(45) NOT NULL,
  `price` int NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `inventory` int NOT NULL,
  `image` varchar(45) NOT NULL,
  `bookname` varchar(255) DEFAULT NULL,
  `cnt` int DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM bookStoreDataBase.book;