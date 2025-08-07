class Stack:
    def __init__(self):
        self.items = []

    def push(self, element):
        self.items.append(element);
    
    def peek(self):
        try:
            return self.items[-1]
        except IndexError:
            print('Stack is empty, cannot peak')
            return None
    
    def pop(self):
        try:
            return self.items.pop()
        except IndexError:
            print('Stack is empty, cannot pop')
            return None

    def size(self):
        return len(self.items)

    # debug purpose
    def print(self):
        print(self.items)

if __name__ == '__main__':
    s = Stack()
    s.push(1)
    s.push(2)
    s.push(3)
    s.print()
    