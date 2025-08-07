class A:
    def explore(self):
        print('explore A')

class B(A):
    def explore(self):
        print('explore B')

if __name__ == '__main__':
    a = A()
    b = B()
    a.explore()
    b.explore()