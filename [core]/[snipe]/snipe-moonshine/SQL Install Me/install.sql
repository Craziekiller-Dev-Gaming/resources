CREATE TABLE IF NOT EXISTS `snipe_moonshine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL DEFAULT '0',
  `coords` longtext NOT NULL,
  `heading` float NOT NULL DEFAULT 0,
  `quality` float NOT NULL DEFAULT 0,
  `starttime` longtext NOT NULL,
  `cooks_left` int(11) DEFAULT NULL,
  `still_time` int(11) DEFAULT NULL,
  `cooking_identifier` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `snipe_moonshine_data` (
  `identifier` varchar(100) NOT NULL,
  `item_values` longtext NOT NULL,
  `knob_values` longtext NOT NULL,
  `reputation` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;