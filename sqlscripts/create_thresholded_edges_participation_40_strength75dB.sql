CREATE TABLE IF NOT EXISTS `dtu`.`thresholded_edges_75db_40per_participation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int unsigned DEFAULT NULL,
  `src` int unsigned DEFAULT NULL,
  `trg` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edge_unique` (`timestamp`,`src`,`trg`),
  KEY `timestamp_idx` (`timestamp`),
  KEY `src_index` (`src`),
  KEY `trg_index` (`trg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


TRUNCATE TABLE `dtu`.`thresholded_edges_75db_40per_participation`;

INSERT INTO
	`dtu`.`thresholded_edges_75db_40per_participation` (
		`timestamp`,
		`src`,
		`trg`
	)
SELECT
	bt.timestamp,
	bt.src,
	bt.trg
FROM
	dtu.btsymmetric AS bt
JOIN (
	SELECT
		src
	FROM
		(
			SELECT
				src,
				COUNT(DISTINCT `timestamp`) / (SELECT (MAX(`timestamp`)+300)/300 from dtu.btsymmetric) as participation_ratio
			FROM
				dtu.btsymmetric
			GROUP BY
				src
		) AS p
	WHERE
		p.participation_ratio >= 0.4
	) AS p2
ON
	p2.src = bt.src
WHERE
	bt.trg >= 0
AND
	value >= -75
ORDER BY
	bt.timestamp,
	bt.src,
	bt.trg
;
