USER=root
HOST=localhost
SQL=mysql -u $(USER) -h $(HOST) -p

download:
	wget https://ndownloader.figstatic.com/files/14000795 --no-check-certificate -O ./data/bt_symmetric.csv

db:
	$(SQL) < sqlscripts/make_db.sql

import:
	$(SQL) < sqlscripts/import_bt.sql

make threshsnaps:
	$(SQL) < sqlscripts/create_thresholded_edges_participation_40_strength75dB.sql
	$(SQL) < sqlscripts/create_thresholded_edges_participation_40_strength80dB.sql
	$(SQL) < sqlscripts/create_thresholded_edges_participation_60_strength75dB.sql
	$(SQL) < sqlscripts/create_thresholded_edges_participation_60_strength80dB.sql

clean:
	rm data/bt_symmetric.csv
