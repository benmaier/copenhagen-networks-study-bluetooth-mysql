CREATE TABLE IF NOT EXISTS `dtu`.`btsymmetric` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int unsigned DEFAULT NULL,
  `src` int unsigned DEFAULT NULL,
  `trg` int DEFAULT NULL,
  `value` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_scan_idx` (`timestamp`,`src`,`trg`),
  KEY `timestamp_idx` (`timestamp`),
  KEY `src_index` (`src`),
  KEY `trg_index` (`trg`),
  KEY `value` (`value`),
  KEY `src_timestamp_idx` (`src`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


LOAD DATA INFILE
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

