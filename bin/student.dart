import 'person.dart';

class Studend extends Person {
  String email;
  String phone;
  Map<String, double> subjects = {};
  Studend({
    required String id,
    required String name,
    required int age,
    required String address,
    required this.email,
    required this.phone,
  }) : super(
          id: id,
          address: address,
          age: age,
          name: name,
        );

  void addSubject({
    required String name,
    required double grade,
  }) {
    subjects.addAll({name: grade});
  }

  void studentData() {
    print('id: $id , name: $name , age: $age , address: $address');
    print('emai: $email , phone: $phone');
    print('subjects: $subjects');
  }
}

class Students {
  List<Studend> stds = [];

  void addStudent({
    required String id,
    required String name,
    required int age,
    required String address,
    required String email,
    required String phone,
  }) {
    stds.add(Studend(
      id: id,
      name: name,
      age: age,
      address: address,
      email: email,
      phone: phone,
    ));
  }

  void removeStudent(String id) {
    stds.removeWhere((element) => element.id == id);
  }

  void printStudentData(String id) {
    var studend = stds.singleWhere((std) => std.id == id);
    studend.studentData();
  }

  void addSubject(String id, String name, double grade) {
    var std = stds.firstWhere((element) => element.id == id);

    std.addSubject(name: name, grade: grade);
  }

  Map calculateStudentGrade(String id) {
    var result = {};
    var std = stds.firstWhere((element) => element.id == id);
    std.subjects.forEach((key, value) {
      if (value > 50) {
        result.addAll({key: 'pass'});
      } else {
        result.addAll({key: 'fail'});
      }
    });
    //print(result);
    return result;
  }
}
