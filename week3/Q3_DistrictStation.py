# -*- coding : utf8 -*-

import csv
import matplotlib
import matplotlib.pyplot as plt

station_file = open ('station_kor.csv' , 'r')
station= csv.DictReader(station_file)

station_result = {}

for rent in station:
	if rent['DISTRICT'] in station_result:
 		station_result[rent['DISTRICT']] = station_result[rent['DISTRICT']] + 1
    	else:
        		station_result[rent['DISTRICT']]  = 1

district = station_result.keys()
station = station_result.values()

for i in range(0, len(station_result)):
	print "District : ", district[i], "\tStation : ", station[i]

plt.title('District,Station')
plt.xticks((0,1,2,3,4),("Jung-Gu","Seo-Gu","DaeDuk-Gu","Dong-Gu","YuSeong-Gu"))
plt.plot(station)
plt.xlabel('District')
plt.ylabel('Station')