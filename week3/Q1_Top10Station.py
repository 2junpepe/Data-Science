# -*- coding : utf8 -*-

import csv
from operator import itemgetter

tashu_file = open ('tashu_kor.csv' , 'r')
tashu = csv.DictReader(tashu_file)

station_file = open ('station_kor.csv' , 'r')
station= csv.DictReader(station_file)

tashu_temp ={}
station_temp = []

for rent in tashu:
	if rent['RENT_STATION'] in tashu_temp:
        		tashu_temp[rent['RENT_STATION']] = tashu_temp[rent['RENT_STATION']] + 1
    	else:
        		tashu_temp[rent['RENT_STATION']] = 1

tashu_result = sorted(tashu_temp.iteritems(), key=itemgetter(1), reverse=True)

station_temp = []
temp_data = []

for data in tashu_result:
	station_temp.append(list(data))

for sector in station:
	temp_data.append(sector)

for rent in station_temp:
	for sector in temp_data:
		if rent[0] == sector['INDEX']:
			rent[0] = sector['NAME'] 

for i in range(0, 10):
	print "Station : ", station_temp[i][0], "\tCount : ", station_temp[i][1]