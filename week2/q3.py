import json

result = 0
url = './q3.json'

with open(url) as f:
	data = f.read()
	json_Data = json.loads(data)

for title in json_Data['comments']:
	print title['count']
	result += title['count']

print "Result : ", result