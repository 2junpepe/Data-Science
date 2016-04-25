import json

input = '''
[
	{
	"id" : "001",
	"x" : "2",
	"name" : "YoungSeok"
	},
	{
	"id" : "009",
	"x" : "7",
	"name" : "HyunHo"
	}	
]'''

info = json.loads(input)
print 'User count:', len(info)

for item in info:
	print 'Name', item['name']
	print 'Id', item['id']
	print 'Attribute', item['x']