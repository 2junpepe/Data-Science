# -*- coding : utf8 -*-

import csv
import matplotlib
import matplotlib.pyplot as plt

tashu_file = open ('tashu_kor.csv' , 'r')
tashu = csv.DictReader(tashu_file)
 
tashu_result = {}

for rent in tashu:
	if int(rent['RENT_DATE'][4:6]) in tashu_result:
 		tashu_result[int(rent['RENT_DATE'][4:6])] = tashu_result[int(rent['RENT_DATE'][4:6])] + 1
    	else:
        		tashu_result[int(rent['RENT_DATE'][4:6])]  = 1

month = tashu_result.keys()
count = tashu_result.values()

for i in range(0, len(month)):
	print "Month : ", month[i], "\tCount : ", count[i]

plt.title('MOnth & Count')
plt.plot(month, count)
plt.xlabel('Month')
plt.ylabel('Count')
plt.show()