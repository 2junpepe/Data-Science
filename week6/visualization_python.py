import json
import matplotlib
import matplotlib.pyplot as plt

url = 'data_step.json'

with open(url) as f:
	file_Data = f.read()
	json_Data = json.loads(file_Data)

dataset = json_Data['activities-steps-intraday']['dataset']

length = 24
value_list = [0]*length
time_list = [0]*length

for iterator in dataset:
	time = int(iterator['time'][:2])
	value = int(iterator['value'])
	value_list[time] = value_list[time] + value

for i in range(1, length):
	time_list[i] = i

plt.title('Step Analysis by unknown')
plt.plot(time_list, value_list)
plt.xlabel('Hour')
plt.ylabel('Step')
plt.show()