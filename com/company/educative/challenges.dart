main() {
  var i = 1;
  print("Task ${i++}");
  print("My mamma always said, life is like a bos of chocolates. "
      "You never know what you're gonna get.");

  print("Task ${i++}");
  var name = "Ben";
  var age = 18;
  print("$name is $age years old.");

  print("Task ${i++}");
  var check = 74;
  var compareCheck = check >= 8 && check <= 75;
  print(compareCheck);

  print("Task ${i++}");
  var fahrenheit = 68;
  var celsius = (fahrenheit - 32) * 5 / 9;
  print("Celsius: $celsius c");

  print("Task ${i++}");
  var integers = [1, 2, 3];
  var cubes = integers.map((e) => e * e * e).toList();
  print(cubes);

  print("Task ${i++}");
  var average = 70;
  var percentage = 65;
  var pass = percentage >= 60 && percentage - average >= -5 ? "pass" : "failed";
  print(pass);

  print("Task ${i++}");
  integers = [1, 2, 3, 4, 5];
  print(integers);
  var evenList = integers.where((e) => e.isEven).map((e) => e * 3).toList();
  print(evenList);

  print("Task ${i++}");
  var temperature = 300;
  var count = 0;
  while (temperature < 375) {
    temperature += 25;
    count++;
  }
  print(count);

  print("Task ${i++}");
  var color = "red";
  switch (color) {
    case "blue":
      print("orange");
      break;
    case "yellow":
      print("purple");
      break;
    case "red":
      print("green");
      break;
    default:
      print("not a primary color");
      break;
  }

  print("Task ${i++}");
  print(absolute(-5));

  print("Task ${i++}");
  print(sum([1, 2, 3, 4, 5], 4));

  print("Task ${i++}");
  print(arithmeticCalculator(add, 2, 3));
  print(arithmeticCalculator(subtract, 10, 2));
  print(arithmeticCalculator(multiply, 5, 4));
  print(arithmeticCalculator(divide, 360, 24));

  print("Task ${i++}");
  print(mainMax(1, 9, 5));
}

num absolute(num x) => x.abs();

int sum(List<int> numberList, int index) {
  if (index == 0) return numberList[0];
  return numberList[index] + sum(numberList, index - 1);
}

num add(int a, int b) {
  return a + b;
}

num subtract(int a, int b) {
  return a - b;
}

num multiply(int a, int b) {
  return a * b;
}

num divide(int a, int b) {
  return a / b;
}

num arithmeticCalculator(Function f, int x, int y) => f(x, y);

int mainMax(int a, int b, int c) {
  int max(int a, int b) => a >= b ? a : b;
  return max(max(a, b), c);
}
