import 'dart:io';
import 'TicTacToe.dart';

void startGame(bool flag) {
  TicTacToe ticTacToe = TicTacToe(strategicMode: flag);
  ticTacToe.chooseSign();
  ticTacToe.printField();

  bool doesUserMove = ticTacToe.isUserFirst();
  while (true) {
    if (doesUserMove)
      ticTacToe.userMoving();
    else
      ticTacToe.computerMoving();

    ticTacToe.printField();

    if (!ticTacToe.willContinueGame(doesUserMove)) break;

    doesUserMove = !doesUserMove;
  }
}

main() {
  print("Welcome to tic-tac-toe game!");
  while (true) {
    print("Choose next: ");
    print("1) Play with crazy rival");
    print("2) Play with strategic rival");
    print("3) Exit");

    switch (stdin.readLineSync()) {
      case "1":
        startGame(false);
        break;
      case "2":
        startGame(true);
        break;
      case "3":
        exit(0);
      default:
        print("Incorrect input!");
        break;
    }
  }
}
