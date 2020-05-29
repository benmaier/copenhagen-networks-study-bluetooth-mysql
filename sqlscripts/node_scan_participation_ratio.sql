SELECT
    src,
    COUNT(DISTINCT `timestamp`) / (SELECT (MAX(`timestamp`)+300)/300 from dtu.btsymmetric) as participation_ratio
FROM
    dtu.btsymmetric
GROUP BY
    src
