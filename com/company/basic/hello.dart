import 'dart:io';
import 'article.dart';

typedef FunctionTypeAlias = bool Function(int);

main() {
  print("Hello, Dart!");

  var a = 2;
  var b = 3;

  // single comment

  /*
  multiline
  comment
   */

  /**
   * documentation
   * comment
   */

  print("$a + $b = ${a + b}");

  num number1 = 1.1;
  print(number1);
  print(number1.runtimeType); // double
  number1 = 5;
  print(number1);

  // int x = 1.5;
  int x = 1;
  double y = 5;

  print("x - $x and y - $y");
  print(x.runtimeType);
  print(y.runtimeType);

  String string = "This is a string!";
  // var string = "This is a string!"; - is also correct!
  print(string);

  bool isGoodMood = true;
  print(isGoodMood);

  dynamic d = "Beer";
  print(d);
  print(d.runtimeType);
  d = 25.5;
  print(d);
  print(d.runtimeType);
  d = false;
  print(d);
  print(d.runtimeType);

  const String beer = "Beer";
  // const var beer = "Beer";

  const hexRedColor = 0xFFFF0000;
  // const int hexRedColor = 0xFFFF0000; - is also correct!

  /*
  const abs = (-123324).abs(); - it will be error!
  Const variables must be initialized with a constant value
   */

  // correct:
  final abs = (-123324).abs();

  print(beer);
  print(hexRedColor);
  print(abs);

  var intNum = 1;
  double doubleNum = intNum.toDouble();
  print(doubleNum);

  var doubleNum2 = 1.5;
  var intNum2 = doubleNum2.round();
  print(intNum2);

  String dietrich = "Dietrich";
  var eight = 8;
  var message = "$dietrich$eight";
  print(message);

  var number = 32.79844981354;
  print(number.toStringAsFixed(2));
  print(number.toStringAsFixed(5));
  // print(number.toStringAsFixed(100));
  double parse = double.parse("3.14");
  print(parse);

  a = 21;
  b = 8;
  print("$a + $b = ${a + b}");
  print("$a - $b = ${a - b}");
  print("$a * $b = ${a * b}");
  print("$a / $b = ${a / b}");
  print("-$a = ${-a}");
  print("-$b = ${-b}");
  print("$a % $b = ${a % b}");
  print("$a ~/ $b = ${a ~/ b}");

  var lol = null;
  print(lol?.isNegative);

  var _num;
  _num ??= 1.5;
  print(_num);
  print(_num is int);
  print(_num is double);
  print(_num is num);

  var dateTime = DateTime(2022, 02, 24, 4, 20);
  print(dateTime);
  DateTime dateTime2 = DateTime.now();
  print(dateTime2);
  print("$dateTime before than $dateTime2: ${dateTime.isBefore(dateTime2)}");
  print("$dateTime after than $dateTime2: ${dateTime.isAfter(dateTime2)}");
  print("$dateTime - $dateTime2 = ${dateTime.difference(dateTime2)}");

  var empty = null;
  List numbers = <int>[10, 13, 21];
  numbers.add(1);
  numbers.add(2);
  numbers.add(3);
  numbers.add(5);
  numbers.add(8);
  numbers.addAll(<int>[23, 46, 120]);
  var neoList = [0, ...numbers, ...?empty, 100];
  for (var n in neoList) print(n);
  print("length = ${neoList.length}");

  List list2 = [for (var i in neoList) i * i];
  print(list2);

  Set uniqueNumbers = {1, 1, 2, 2, 2, 2, 3, 4, 4, 4, 5, 5, 5};
  print(uniqueNumbers);

  Map phoneBook = <String, String>{
    "Slave": "88005553535",
    "Dungeon master": "666363629",
    "Boss of this gym": "7788"
  };

  print(phoneBook.containsKey("Dungeon master"));
  print(phoneBook.containsValue("88005553535"));
  for (var name in phoneBook.keys) print(name);
  for (var phone in phoneBook.values) print(phone);

  print("Enter number, my boy!");
  String? input = stdin.readLineSync();
  int convertedNumber = int.parse(input!);

  // if (convertedNumber > 5)
  //   print("number is bigger than 5!");
  // else if (convertedNumber < 5)
  //   print("number is smaller than 5!");
  // else
  //   print("This number equals 5!");

  convertedNumber > 5
      ? print("number is bigger than 5!")
      : convertedNumber < 5
          ? print("number is smaller than 5!")
          : print("This number equals 5!");

  numbers = [1, 2, 4, 8, 16];
  numbers.forEach((element) {
    print(element);
  });

  for (var i = 0; i < numbers.length; i++) print(numbers[i]);

  var count = 5;
  do {
    count++;
    print(count);
  } while (count < 10);

  printHello();

  printHello("Egor");

  printUserInfo(name: "dietrichalex8", role: "coder");
  printUserInfo(
      name: "dietrichalex8", role: "coder", email: "tcodmos@gmail.com");

  print(getUserName("Artyom", "Screbets"));

  Function func = printHello;
  func("Coder");

  int sum(int a, int b) {
    return a + b;
  }

  print(sum(2, 3));
  doWork(sum);

  print((int a) {
    return a * a;
  }(2000));

  numbers = <int>[1, 2, 3];
  var removeCallBack = (int a) => numbers.remove(a);
  print(numbers);
  doAction(removeCallBack);
  print(numbers);

  var article = Article()
    ..title = "wegw"
    ..body = "SDFwgeEWTGGVwegDFDSFDSFF"
    ..message();

  print("Title: ${article.title}, body: ${article.body}");
}

void printHello([String name = "Dietrich"]) => print("Hello, $name!");

void printUserInfo({String? name, String? role, String? email}) {
  print("Username: $name, role: $role, email: $email");
}

String getUserName(String firstName, String lastName) {
  return "$firstName$lastName".toLowerCase();
}

void doWork(int Function(int, int) callback) {
  var result = callback(3, 5);
  print(result);
}

void doAction(FunctionTypeAlias callback) {
  print(callback(2));
}