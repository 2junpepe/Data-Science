# -*- coding : utf8 -*-

import csv
import matplotlib
import matplotlib.pyplot as plt
import matplotlib.legend as legend

my_file = open ('visual_python.csv', 'r')
my_data = csv.DictReader(my_file)

date = []
floor = []
elevation = []
traveled = []

for temp in my_data:
	date.append(temp['DATE'])
	floor.append(temp['FLOOR'])
	elevation.append(temp['ELEVATION'])
	traveled.append(temp['TRAVELED'])

floor_chart,= plt.plot(date, floor, 'ro-')
elevation_chart,= plt.plot(date, elevation, 'g^-')
traveled_chart,= plt.plot(date, traveled, 'bs-')

plt.title('YLKIm ANALYSIS')
plt.legend([floor_chart, elevation_chart, traveled_chart], ['FLOOR', 'ELEVATION', 'TRAVALED'], loc=3)
plt.xlabel('DATE')
plt.ylabel('VALUES')
plt.grid(True)
plt.show()