import hacker
import sys
import time
import random
from PyQt5 import QtWidgets

__author__ = 'Aleksa'

class Hacker(hacker.Ui_MainWindow, QtWidgets.QMainWindow):
    def __init__(self):
        super().__init__()
        self.setupUi(self)

        self.start_dugme.pressed.connect(self.hack)

    def hack(self):
        print('Engine started...')
        for i in range(0, 101):
            time.sleep(0.2)
            self.progressBar.setProperty('value', i)
            if i%5 == 0:
                print('...{}..'.format(''.join(random.choices('sdjladkjlshakjdkjakjcb'))))

        print('Hack Successful!')
    
if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    hacker = Hacker()
    hacker.show()
    sys.exit(app.exec_())