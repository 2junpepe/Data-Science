# -*- coding : utf8 -*-

import csv
from operator import itemgetter
import matplotlib
import matplotlib.pyplot as plt

tashu_file = open ('tashu_kor.csv' , 'r')
tashu = csv.DictReader(tashu_file)

station_file = open ('station_kor.csv' , 'r')
station= csv.DictReader(station_file)
 
tashu_temp ={}
station_temp = []
result = {}

for rent in tashu:
	if rent['RENT_STATION'] in tashu_temp:
        		tashu_temp[rent['RENT_STATION']] = tashu_temp[rent['RENT_STATION']] + 1
    	else:
        		tashu_temp[rent['RENT_STATION']] = 1

for data in station:
	station_temp.append(data)

for rent in tashu_temp.items():
	for temp in station_temp:
		if rent[0] == temp['INDEX']:
			if temp['DISTRICT'] in result:
				result[temp['DISTRICT']] = result[temp['DISTRICT']] + rent[1]
			else:
				result[temp['DISTRICT']] = rent[1]

district = result.keys()
count = result.values()

for i in range(0, len(district)):
	print "District : ", district[i], "\tCount : ", count[i]

plt.title('District & Count')
plt.xticks((0,1,2,3,4),("Jung-Gu","Seo-Gu","DaeDuk-Gu","Dong-Gu","YuSeong-Gu"))
plt.plot(count)
plt.xlabel('District')
plt.ylabel('Count')
plt.show()