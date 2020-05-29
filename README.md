# Copenhagen Networks Study Bluetooth MySQL Import

Import Bluetooth contact data from the Copenhagen Networks Study into your database.

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

Create a thresholded directed temporal network (snapshots) where only users are regarded that participated in at least 60% of the scans. Contacts are only counted if the bluetooth signal strength (rssi) has a value of -75dB or larger (corresponds to 2-3m distance).

    make threshsnaps
