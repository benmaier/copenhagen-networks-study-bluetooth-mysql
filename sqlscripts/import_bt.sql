CREATE TABLE IF NOT EXISTS `dtu`.`btsymmetric` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) unsigned DEFAULT NULL,
  `src` int(11) unsigned DEFAULT NULL,
  `trg` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_scan_idx` (`timestamp`,`src`,`trg`),
  KEY `timestamp_idx` (`timestamp`),
  KEY `src_index` (`src`),
  KEY `trg_index` (`trg`),
  KEY `value` (`value`),
  KEY `src_timestamp_idx` (`src`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


LOAD DATA LOCAL INFILE
         'data/bt_symmetric.csv'
REPLACE INTO TABLE
        `dtu`.`btsymmetric`
FIELDS TERMINATED BY
         ','
ENCLOSED BY
        '"'
LINES TERMINATED BY
    '\n'
IGNORE 1 LINES
        (
                `timestamp`,
                src,
                trg,
                `value`
        )
;

