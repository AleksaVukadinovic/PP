# Generatori su fje koje pamte svoje stanje

def MyGenerator():
    for i in range(10):
        yield i
    yield 'asjdlasjdklsajdsa'
    yield 123213
    yield (12, 12)

if __name__ == '__main__':
    m = MyGenerator()
    for elem in m: 
        print(elem)

