class Student implements Comparable<Student> {
  late String firstName;
  late String lastName;
  late double mark;

  Student(this.firstName, this.lastName, this.mark);

  @override
  String toString() => 'Student: $firstName $lastName, $mark';

  static String getSumOfMarks(List<Student> students) {
    double sum = 0.0;
    for (var student in students) {
      sum += student.mark;
    }
    return 'Total mark\'s sum: ${sum.toStringAsFixed(3)} ($sum)';
  }

  @override
  int compareTo(Student other) {
    return this.firstName == other.firstName
        ? this.lastName.compareTo(other.lastName)
        : this.firstName.compareTo(other.firstName);
  }
}
