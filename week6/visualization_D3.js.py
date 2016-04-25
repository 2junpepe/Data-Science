import json
import csv

url = 'data_sleep.json'

with open(url) as f:
	file_Data = f.read()
	json_Data = json.loads(file_Data)

dataset = json_Data['sleep'][0]['minuteData']

length = 24
value_list = [0]*length
time_list = [0]*length

for iterator in dataset:
	time = int(iterator['dateTime'][:2])
	value = int(iterator['value'])
	value_list[time] = value_list[time] + value

total_sleep = 0
result_sleep = []
result_hour = []

for i in range(0, len(value_list)):
	if value_list[i]!=0:
		result_sleep.append(value_list[i])
		result_hour.append(i)
		total_sleep = total_sleep + value_list[i]

csv_file = open('visualization_D3.js.csv', 'w')
cw = csv.writer(csv_file, delimiter=',', quotechar='|')
cw.writerow(['hour', 'sleep'])

for i in range(0, len(result_hour)):
	cw.writerow([result_hour[i], result_sleep[i]])