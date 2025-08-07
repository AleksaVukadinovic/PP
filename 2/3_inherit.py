import math

class Shape:
    def __init__(self, color, filled):
        self._color = color
        self.__filled = filled

    def get_color(self):
        return self._color
    
    def get_filled(self):
        return self.__filled
    
    def set_color(self, color):
        self._color = color

    def set_filled(self, filled):
        self.__filled = filled


class Rectangle(Shape):
    def __init__(self, height, width):
        super().__init__(color='red', filled=True)
        self.__height = height
        self.__width = width

    def get_area(self):
        return self.__width * self.__height
    
    def get_perimiter(self):
        return 2*(self.__width + self.__height)
    
    def str(self):
        print('a: {}, b: {}, filled: {}\n'.format(self.__height, self.__width, self._color, self.get_filled()))


if __name__ == '__main__':
    s1 = Shape('red', True)
    print(s1)
    print(dir(s1))
    print(s1.get_color())

    r1 = Rectangle(5, 10)
    print(r1.get_area())
    print(r1.get_perimiter())
    r1.str()