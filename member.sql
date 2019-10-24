CREATE TABLE `members` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `member_name` varchar(100) NOT NULL COMMENT '名前',
  `birthday` varchar(100) DEFAULT NULL COMMENT '誕生日',
  `blood_type` varchar(100) NOT NULL DEFAULT '' COMMENT '血液型',
  `constellation` varchar(50) DEFAULT NULL COMMENT '星座',
  `height` varchar(100) DEFAULT NULL COMMENT '身長',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;