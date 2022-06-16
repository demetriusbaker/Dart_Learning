import 'dart:math';
import 'dart:io';

class TicTacToe {
  bool _twoPlayers = false;
  List _fields = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
  var _space = ' ' * 50;
  final List OX = ["O", "X"];
  var _user, _computer, _secondUser;
  int _moves = 9;
  var userWin;

  TicTacToe({bool twoPlayers = false}) {
    _twoPlayers = twoPlayers;
  }

  chooseSign() {
    var random = Random().nextInt(2);
    _user = OX[random];
    _computer = _user == OX[1] ? OX[0] : OX[1];
    _secondUser = _computer;

    if (!_twoPlayers) print("You're $_user!");
  }

  printField() {
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

  userMoving([bool isSecondUser = false]) {
    var user = !isSecondUser ? _user : _secondUser;

    if (_twoPlayers) print("$user moving!");

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
            _fillField(() => _fields[position - 1] = user);

            if (_twoPlayers) userWin = user;

            break;
          } else
            print("That field was occupied!!!");
        } else
          print("Enter number only from 1 to 9!!!");
      }
    }

    print("$_space            User moved!");
  }

  computerMoving() {
    Set randomNumbers = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    bool isEnd = false;
    while (!isEnd) {
      int random = Random().nextInt(randomNumbers.length);
      String field = _fields[random];

      if (field != OX[0] && field != OX[1])
        _fillField(() {
          _fields[random] = _computer;
          isEnd = true;
        });

      randomNumbers.remove(random);
    }

    print("$_space            Computer moved!");
  }

  _fillField(void Function() init) {
    init();
    _moves--;
  }

  bool willContinueGame(bool isUserMoving) {
    if (_moves >= 5) return true;

    var sign = isUserMoving
        ? _user
        : !_twoPlayers
            ? _computer
            : _secondUser;
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
      if (_twoPlayers) {
        print("$sign won!");
        return false;
      }

      if (sign == _user)
        print("User won!");
      else
        print("Computer won!");

      return false;
    }

    if (_moves <= 0) {
      print("DRAW!!!");
      return false;
    }

    return true;
  }
}
