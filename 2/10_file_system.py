# pisanje

with open('./imena.txt', 'w') as f:
    f.write('Aca\n')
    f.write('Ana\n')
    f.write('Nikola\n')
    f.close()

# citanje

with open('./imena.txt', 'r') as f:
    print(f.read())
    
with open('./imena.txt', 'r') as f:
    print(f.readlines())
    
with open('./imena.txt', 'r') as f:
    for line in f.readlines():
        print(line)
        for c in line:
            print(c)


def read_file(filename):
    try:
        with open('./imena.txt', 'r') as f:
            print(f.read())
    except IOError as e:
        print('Cannot read file: {}'.format(filename))
        print(e)