import 'dart:io';

String _specialSymbol = '▀';

main() {
  while (true) {
    printMenu();

    String? input = stdin.readLineSync();

    switch (input) {
      case "1":
        int? dimension = inputDimension();
        if (dimension != null) {
          drawSquare(dimension);
        }
        print('');
        break;
      case "2":
        drawTower();
        print('');
        break;
      case "3":
        stop();
        print('');
        break;
      case "option":
        changeSymbol();
        print('');
        break;
      default:
        print("Enter a valid choice: 1, 2 or 3!");
        break;
    }
  }
}

void printMenu() {
  print("What do you choose?");

  print('1. Draw a square');
  print('2. Draw a tower upside down');
  print('3. Stop');
  print('option. Change print symbol (default: $_specialSymbol)');
}

int? inputDimension() {
  print('Give a dimension for your construction: ');
  int? dimension = int.tryParse(stdin.readLineSync().toString());

  if (dimension == null) {
    print("You inputted incorrect value!");
  } else if (dimension <= 0) {
    print("You inputted negative dimension value!");
  } else if (dimension > 41) {
    print("You inputted too big value (max: 40)!");
  } else {
    return dimension;
  }

  return null;
}

void drawSquare(int dimension, {String space = "", bool next = false}) {
  for (int i = 0; i < dimension; i++) {
    for (int j = 0; j < dimension * 2; j++) {
      if (next && j == 0) {
        stdout.write('$space');
      }
      stdout.write('$_specialSymbol');
    }
    print('');
  }
}

void drawTower() {
  try {
    int dimension = inputDimension()!;

    String space = '';
    bool flag = false;
    while (dimension > 0) {
      drawSquare(dimension, space: space, next: flag);
      dimension -= 2;
      space += '  ';
      flag = true;
    }
  } catch (e) {}
}

void stop() {
  print("Thanks for playing with us!");
  print('');
  print("Druk op een toets om door te gaan.");
  exit(0);
}

void changeSymbol() {
  print("Change symbol:");
  try {
    _specialSymbol = stdin.readLineSync()!;
  } catch (e) {
    _specialSymbol = _specialSymbol;
  }
}
