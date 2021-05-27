CREATE TABLE `order` (
  `id` int NOT NULL,
  `user_Id` int NOT NULL,
  `item_id` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM bookStoreDataBase.order;