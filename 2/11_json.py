import json

ime = input('Unesi ime: ')
prezime = input('Unesi godine: ')
godine = int(input('Unesi godine: '))

student = {
    "ime": ime,
    "prezime": prezime,
    "godine": godine
}

print(student)
print('------------------------')
print(json.dumps(student))

with open('./personal.json', 'w') as f:
    json.dump(student, f)

with open('./personal.json', 'r') as f:
    data = json.load(f)
    print(data)