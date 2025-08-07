class Robot:
    """Represent a robot, with a name"""

    population = 0

    def __init__(self, name):
        self.name = name
        Robot.population += 1

    def __del__(self):
        Robot.population -= 1

    def say_hi(self):
        print('New message from {}'.format(self.name))

    @classmethod
    def how_many(cls):
        print('We have {} robots'.format(cls.population))

if __name__ == '__main__':
    droid1 = Robot('R24')
    droid2 = Robot('R12-D4')
    droid3 = Robot('T15')

    droid1.say_hi()
    droid2.say_hi()

    droid1.how_many()

    del droid1
    droid2.how_many()