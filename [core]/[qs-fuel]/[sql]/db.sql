CREATE TABLE IF NOT EXISTS `fuel_stations` (
	`id` INT(11) NULL DEFAULT NULL,
	`level` INT(11) NULL DEFAULT '100',
	UNIQUE INDEX `id` (`id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;
