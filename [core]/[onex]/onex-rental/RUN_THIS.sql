
CREATE TABLE IF NOT EXISTS `onex_rentcar` (
  `identifier` varchar(50) DEFAULT NULL,
  `vehdata` varchar(50) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE IF NOT EXISTS `onex_onrentcar` (
  `identifier` varchar(50) DEFAULT NULL,
  `metadata` varchar(50) DEFAULT NULL,
  `set_price` int(11) DEFAULT NULL,
  `min_rent` int(11) DEFAULT NULL,
  `max_rent` int(11) DEFAULT NULL,
  `isrented` varchar(50) DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;