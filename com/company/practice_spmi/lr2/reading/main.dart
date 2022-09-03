import 'dart:io';
import 'letter.dart';

main() {
  try {
    print("Enter file name");
    String? fileName = stdin.readLineSync();

    if (fileName == null || fileName == '') {
      print("Empty input!");
    } else if (!fileName.contains(".txt")) {
      print("Incorrect format!");
    }

    File file = File("./com/company/practice_spmi/lr2/$fileName");
    String content = file.readAsStringSync();
    print(content + '\n');

    content = content.toLowerCase();
    Set letters = {};
    List contentList = content.split('');
    for (var c in contentList) {
      if (_isAlpha(c)) letters.add(c);
    }

    List<Letter> lettersList = [];
    for (var letter in letters) {
      int count = _countOfSymbol(symbol: letter, text: content);
      lettersList.add(Letter(symbol: letter, count: count));
    }

    lettersList.sort(((a, b) => a.symbol.compareTo(b.symbol)));
    print("Sorted by letter\n");
    for (var l in lettersList) {
      print(l);
    }
    print('');

    lettersList.sort(((a, b) => b.count.compareTo(a.count)));
    print("Sorted by count\n");
    for (var l in lettersList) {
      print(l);
    }
    print('');
  } catch (e) {
    print("The file doesn't exist!");
  }
}

int _countOfSymbol({required String symbol, required String text}) {
  int count = 0;
  List list = text.split('');
  for (var l in list) {
    if (symbol == l) {
      count++;
    }
  }
  return count;
}

bool _isAlpha(String symbol) {
  List alpha = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
  ];

  for (var a in alpha) {
    if (symbol == a) {
      return true;
    }
  }

  return false;
}
