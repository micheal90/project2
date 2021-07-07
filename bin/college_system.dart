import 'dart:io';

import 'student.dart';

void main(List<String> arguments) {
  var stds = Students();
  loop:
  while (true) {
    print('**********************************');

    print('please choose number of operation');
    print('1. add student');
    print('2. add subjects');
    print('3. calculate student grade');
    print('4. student data');
    print('5. remove student');
    print('6. end');
    print('**********************************');
    var op = stdin.readLineSync();
    switch (op) {
      case '1':
        print('Enter staudent data as: id name age address email phone ');
        var data = stdin.readLineSync()!.split(' ');
        stds.addStudent(
          id: data[0],
          name: data[1],
          age: int.parse(data[2]),
          address: data[3],
          email: data[4],
          phone: data[5],
        );

        break;
      case '2':
        print('Enter subject data as: studentId subject grade');
        var subject = stdin.readLineSync()!.split(' ');
        stds.addSubject(subject[0], subject[1], double.parse(subject[2]));
        break;
      case '3':
        print('Enter the student id');
        var id = stdin.readLineSync()!;
        print('The Result: ${stds.calculateStudentGrade(id)}');
        break;
      case '4':
        print('Enter the student id');
        var id = stdin.readLineSync()!;
        stds.printStudentData(id);
        break;
      case '5':
        print('Enter the student id');
        var id = stdin.readLineSync()!;
        stds.removeStudent(id);
        break;
      case '6':
        break loop;
    }
  }
}
