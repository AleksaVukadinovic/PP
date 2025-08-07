class MyIter:
    def __init__(self, limit):
        self.limit = limit

    def __iter__(self):
        self.i = 0
        return self

    def __next__(self):
        self.i += 1
        if self.i > self.limit:
            raise StopIteration
        return self.i

if __name__ == '__main__':
    m = MyIter(10)
    for elem in m:
        print(elem)