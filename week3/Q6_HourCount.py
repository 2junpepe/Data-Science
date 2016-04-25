# -*- coding : utf8 -*-

import csv
import matplotlib
import matplotlib.pyplot as plt

tashu_file = open ('tashu_kor.csv' , 'r')
tashu= csv.DictReader(tashu_file)
 
tashu_temp = {}

for rent in tashu:
	if int(rent['RENT_DATE'][8:10]) in tashu_temp:
 		tashu_temp[int(rent['RENT_DATE'][8:10])] = tashu_temp[int(rent['RENT_DATE'][8:10])] + 1
    	else:
        		tashu_temp[int(rent['RENT_DATE'][8:10])]  = 1

hour = tashu_temp.keys()
count = tashu_temp.values()

for i in range(0, len(tashu_temp)):
	print "Hour : ", hour[i], "\tCount : ", count[i]

plt.title('HOur & Count')
plt.plot(hour, count)
plt.xlabel('HOur')
plt.ylabel('Count')
plt.show()