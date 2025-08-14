import calculator
import sys
from PyQt5 import QtWidgets
from functools import partial
import re

class Calculator(calculator.Ui_MainWindow, QtWidgets.QMainWindow):

  def __init__(self):
    super().__init__()
    self.setupUi(self)

    self.operators = ('+', '-', '*', '/')

    self.pushButton0.pressed.connect(partial(self.__display, '0'))
    self.pushButton1.pressed.connect(partial(self.__display, '1'))
    self.pushButton2.pressed.connect(partial(self.__display, '2'))
    self.pushButton3.pressed.connect(partial(self.__display, '3'))
    self.pushButton4.pressed.connect(partial(self.__display, '4'))
    self.pushButton5.pressed.connect(partial(self.__display, '5'))
    self.pushButton6.pressed.connect(partial(self.__display, '6'))
    self.pushButton7.pressed.connect(partial(self.__display, '7'))
    self.pushButton8.pressed.connect(partial(self.__display, '8'))
    self.pushButton9.pressed.connect(partial(self.__display, '9'))

    self.pushButtonPlus.pressed.connect(lambda: self.__display_operator('+'))
    self.pushButtonMinus.pressed.connect(lambda: self.__display_operator('-'))
    self.pushButtonPuta.pressed.connect(lambda: self.__display_operator('*'))
    self.pushButtonPodeljeno.pressed.connect(lambda: self.__display_operator('/'))

    self.pushButtonC.pressed.connect(self.lineEdit.backspace)
    self.pushButtonCE.pressed.connect(self.lineEdit.clear)

    self.pushButtonJednako.pressed.connect(self.__evaluate)

  def __log(self, msg):
     print('LOG: {}'.format(msg))

  def __display(self, output_character):
     self.lineEdit.insert(output_character)

  def __display_operator(self, operator_character):
    assert operator_character in self.operators, 'Fatal Error: Invalid operator'
    data = self.lineEdit.text()
    if len(data) > 0 and data[-1] not in self.operators:
       self.__display(operator_character)
    else:
       self.__log('Cannot write operator: {} to formula: {}'.format(operator_character, data))

  @staticmethod
  def __calculate(data):
     operands = re.split('+|-', data)
     # TODO
     

  def __evaluate(self):
    data = self.lineEdit.text()
    if len(data) > 0:
       self.__log(data)

    result = self.__calculate(data)
    self.lineEdit.clear
    self.lineEdit.setText(str(result))


if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    calc = Calculator()
    calc.show()
    sys.exit(app.exec_())