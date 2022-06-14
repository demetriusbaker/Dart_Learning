import 'dart:math';
import 'dart:io';

class TicTacToe {
  bool _strategicMode = false;
  List _fields = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
  var _space = ' ' * 50;
  final List OX = ["O", "X"];
  var _user, _computer;
  int _moves = 9;

  TicTacToe({bool strategicMode = false}) {
    _strategicMode = strategicMode;
  }

  void chooseSign() {
    var random = Random().nextInt(2);
    _user = OX[random];
    _computer = _user == OX[1] ? OX[0] : OX[1];

    print("You're $_user!");
  }

  void printField() {
    print("""
    $_space*---------*---------*---------*
    $_space|         |         |         |
    $_space|    ${_fields[0]}    |    ${_fields[1]}    |    ${_fields[2]}    |
    $_space|         |         |         |
    $_space*---------*---------*---------*
    $_space|         |         |         |
    $_space|    ${_fields[3]}    |    ${_fields[4]}    |    ${_fields[5]}    |
    $_space|         |         |         |
    $_space*---------*---------*---------*
    $_space|         |         |         |
    $_space|    ${_fields[6]}    |    ${_fields[7]}    |    ${_fields[8]}    |
    $_space|         |         |         |
    $_space*---------*---------*---------*
    """);
  }

  bool isUserFirst() => _user == OX[1];

  void userMoving() {
    print("Print not occupied field from 1 to 9");
    int position = -1;
    while (true) {
      try {
        position = int.parse(stdin.readLineSync()!);
      } catch (e) {
        print("Incorrect input!");
      } finally {
        if (position >= 1 && position <= 9) {
          var field = _fields[position - 1];
          if (field != OX[0] && field != OX[1]) {
            _fields[position - 1] = _user;
            _moves--;
            break;
          } else
            print("That field was occupied!!!");
        } else
          print("Enter number only from 1 to 9!!!");
      }
    }

    print("$_space            User moved!");
  }

  void computerMoving() {
    Set randomNumbers = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    bool isEnd = false;
    while (true) {
      if (isEnd) break;

      int random = Random().nextInt(randomNumbers.length);
      String field = _fields[random];

      if (field != OX[0] && field != OX[1]) {
        _fields[random] = _computer;
        _moves--;
        isEnd = true;
      }

      randomNumbers.remove(random);
    }

    print("$_space            Computer moved!");
  }

  bool willContinueGame(bool isUserMoving) {
    if (_moves >= 5) return true;

    var sign = isUserMoving ? _user : _computer;
    var isWin = false;

    for (int i = 0; i < 9; i += 3)
      if (sign == _fields[i] &&
          sign == _fields[i + 1] &&
          sign == _fields[i + 2]) isWin = true;

    for (int i = 0; i < 3; i++)
      if (sign == _fields[i] &&
          sign == _fields[i + 3] &&
          sign == _fields[i + 6]) isWin = true;

    if (sign == _fields[0] && sign == _fields[4] && sign == _fields[8])
      isWin = true;

    if (sign == _fields[2] && sign == _fields[4] && sign == _fields[6])
      isWin = true;

    if (isWin) {
      if (sign == _user)
        print("User win!");
      else
        print("Computer win!");

      return false;
    }

    if (_moves <= 0) {
      print("DRAW!!!");
      return false;
    }

    return true;
  }
}
