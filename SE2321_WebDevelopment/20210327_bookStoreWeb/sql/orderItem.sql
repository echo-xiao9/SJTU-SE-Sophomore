CREATE TABLE `orderItem` (
  `idorderItem` int NOT NULL,
  `idbook` int NOT NULL,
  `booknum` int DEFAULT NULL,
  PRIMARY KEY (`idorderItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM bookStoreDataBase.orderItem;