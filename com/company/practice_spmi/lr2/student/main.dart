import 'dart:io';
import 'student.dart';

main() {
  try {
    print("Enter file name");
    String? fileName = stdin.readLineSync();

    if (fileName == null || fileName == '') {
      throw NoExistFileException();
    } else if (!fileName.contains(".txt")) {
      throw IncorrectFileExtensionException();
    } else if (fileName == '.txt' || fileName == '*.txt') {
      throw FuckFileFillingException();
    } else {
      try {
        File file = File("./com/company/practice_spmi/lr2/$fileName");
        
        String content = file.readAsStringSync();
        if (content.length == 0) {
          throw EmptyFileException();
        }

        List<String> strings = content.split('\n');
        List<Student> students = [];

        for (var string in strings) {
          List<String> fields = string.split(' ');
          String name = fields[0];
          String lastName = fields[1];
          double? mark = double.tryParse(fields[2]);
          Student student = Student(name, lastName, mark!);
          students.add(student);
        }

        print("Before sorting");
        _outputList(students);

        students.sort();

        print("After sorting");
        _outputList(students);

        print("Total sum of marks: ${Student.getSumOfMarks(students)}");
      } catch (e) {
        print(WrongFileException());
      }
    }
  } catch (e) {
    print(e);
  }
}

void _outputList(List<Student> students) {
  for (var i = 0; i < students.length; i++) {
    print('${i + 1}) ${students[i]}');
  }
  print('');
}

class NoExistFileException implements Exception {
  @override
  String toString() => "ERROR!!! [no exist file!]";
}

class EmptyFileException implements Exception {
  @override
  String toString() => "ERROR!!! [empty file!]";
}

class IncorrectFileExtensionException implements Exception {
  @override
  String toString() => "ERROR!!! [incorrect file extension!]";
}

class WrongFileException implements Exception {
  @override
  String toString() => "ERROR!!! [incorrect file filling or it doesn't have!]";
}

class FuckFileFillingException implements Exception {
  @override
  String toString() => "ERROR!!! [What's the hell do you doing??!]";
}
