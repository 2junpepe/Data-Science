# -*- coding : utf8 -*-

import csv
import datetime
import matplotlib
import matplotlib.pyplot as plt

tashu_file = open ('tashu_kor.csv' , 'r')
tashu = csv.DictReader(tashu_file)
 
tashu_result = {}

for rent in tashu:
	if datetime.date(int(rent['RENT_DATE'][0:4]), int(rent['RENT_DATE'][4:6]), int(rent['RENT_DATE'][6:8])).weekday() in tashu_result:
 		tashu_result[datetime.date(int(rent['RENT_DATE'][0:4]), int(rent['RENT_DATE'][4:6]), int(rent['RENT_DATE'][6:8])).weekday()] = tashu_result[datetime.date(int(rent['RENT_DATE'][0:4]), int(rent['RENT_DATE'][4:6]), int(rent['RENT_DATE'][6:8])).weekday()] + 1
    	else:
        		tashu_result[datetime.date(int(rent['RENT_DATE'][0:4]), int(rent['RENT_DATE'][4:6]), int(rent['RENT_DATE'][6:8])).weekday()]  = 1

weekend = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
count = tashu_result.values()

for i in range(0, len(weekend)):
	print "Day : ", weekend[i], "\tCount : ", count[i]

plt.title('Weekday & Count')
plt.xticks((0,1,2,3,4,5,6),("Mon","Tue","Wed","Thu","Fri","Sat","Sun"))
plt.plot(count)
plt.xlabel('Weekday')
plt.ylabel('Count')
plt.show()