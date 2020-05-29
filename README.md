# Copenhagen Networks Study Bluetooth MySQL Import

Import [Bluetooth contact data from the Copenhagen Networks Study](https://www.nature.com/articles/s41597-019-0325-x) into your database. Please cite as 
"Interaction data from the Copenhagen Networks Study", P. Sapiezynski, A. Stopczynski, D. Dreyer Lassen & S. Lehmann, Scientific Data volume 6, Article number: 315 (2019).

# Description

This script will create a new database named `dtu` and a table `dtu.btsymmetric` in your MySQL engine. Optionally, a thresholded temporal network (snapshots of 5min resolution) will be saved in table `dtu.thresholded_edges_75db_60per_participation`.

# Data

The imports described here regard the [Bluetooth signal strength scan data as described in the paper](https://www.nature.com/articles/s41597-019-0325-x/tables/2). 

We import the [Bluetooth data table from figshare](https://www.nature.com/articles/s41597-019-0325-x#Tab1) (direct link to file: https://ndownloader.figstatic.com/files/14000795).

# Usage

Download the file

    make download

Make database `dtu`

    make db

Load data into table

    make import

Create a thresholded directed temporal network (snapshots) where only users are regarded that participated in at least 40% (60%, respectively) of the scans. Contacts are only counted if the bluetooth signal strength (rssi) has a value of -75dB (-80dB, respecctively) or larger (corresponds to a maximum of 1.5m to 2m, respectively, [see this study](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0100915)).

    make threshsnaps

# Errors during import

If you're getting security errors, check 

* https://stackoverflow.com/a/40419548/4177832
* https://stackoverflow.com/a/61284172/4177832
* https://stackoverflow.com/a/51532736/4177832

# Check participation in scans

One may want to get rid of nodes that did not participates in many scans (no entries for src in the bin denoted by timestamp). You find out the participation ratio as 

```sql
SELECT
    src,
    COUNT(DISTINCT `timestamp`) / (SELECT (MAX(`timestamp`)+300)/300 from dtu.btsymmetric) as participation_ratio
FROM
    `dtu`.`btsymmetric`
GROUP BY
    src
```

# Check signal strength distribuion

```sql
select
	`value`,
	count(`value`) as cnt
from
	`dtu`.`btsymmetric`
where
	`value` < 0
Group by
	`value`
```
