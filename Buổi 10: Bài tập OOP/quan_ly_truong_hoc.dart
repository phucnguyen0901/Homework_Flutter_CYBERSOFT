import 'dart:io';

void main() {
  List<Student> students = [];
  List<Teacher> teachers = [];
  List<Classroom> classrooms = [];

  String feature = '''
  CHON SO TUONG UNG TINH NANG BEN DUOI:
  - Quan ly danh sach hoc sinh:
    1. Them hoc sinh
    2. Xoa hoc sinh
    3. Xem danh sach hoc sinh
  - Quan ly danh sach giao vien:
    4. Them giao vien
    5. Xoa giao vien
    6. Xem danh sach giao vien
  - Quan ly lop hoc:
    7. Them giao vien va hoc sinh vao lop
    8. Bao cao danh sach lop
  ''';

  while (true) {
    print('*' * 10 + '\n' + feature);
    stdout.write('--> Chon so: ');
    String? chosenFeature = stdin.readLineSync();

    switch (chosenFeature) {
      case '1':
        int id = students.length + 1;
        addStudent(id, students);
        break;
      case '2':
        delete(students);
        break;
      case '3':
        print('DANH SACH HOC SINH');
        for (var student in students) {
          student.showStudentInfo();
        }
        break;
      case '4':
        int id = teachers.length + 1;
        addTeacher(id, teachers);
        break;
      case '5':
        delete(teachers);
        break;
      case '6':
        print('DANH SACH GIAO VIEN');
        for (var teacher in teachers) {
          teacher.showTeacherInfo();
        }
        break;
      case '7':
        int id = classrooms.length + 1;
        break;
      case '8':
        print('BAO CAO LOP');
        for (var classroom in classrooms) {
          classroom.showClassroomInfo();
        }
        break;
      default:
        print('Khong hop le.');
        break;
    }

    stdout.write('\nNhap "y" de tiep tuc, nhap bat ky de thoat: ');
    String continueInput = stdin.readLineSync()!;
    if (continueInput.toLowerCase() == 'y') {
      continue;
    } else {
      print('Da thoat ct');
      break;
    }
  }
}

void addStudent(int id, List<Student> students) {
  print('Nhap thong tin hoc sinh');
  stdout.write('Ten hoc sinh: ');
  String name = stdin.readLineSync()!;
  stdout.write('Tuoi: ');
  int age = int.parse(stdin.readLineSync()!);
  stdout.write('Gioi tinh: ');
  String gender = stdin.readLineSync()!;
  stdout.write('Lop hoc: ');
  String grade = stdin.readLineSync()!;
  stdout.write('Diem: ');
  double score = double.parse(stdin.readLineSync()!);

  Student student = Student(id, name, age, gender, grade, score);
  students.add(student);
}

void addTeacher(int id, List<Teacher> teachers) {
  print('Nhap thong tin giao vien');
  stdout.write('Ten giao vien: ');
  String name = stdin.readLineSync()!;
  stdout.write('Tuoi: ');
  int age = int.parse(stdin.readLineSync()!);
  stdout.write('Gioi tinh: ');
  String gender = stdin.readLineSync()!;
  stdout.write('Mon giang day: ');
  String subject = stdin.readLineSync()!;
  stdout.write('Muc luong: ');
  int salary = int.parse(stdin.readLineSync()!);

  Teacher teacher = Teacher(id, name, age, gender, subject, salary);
  teachers.add(teacher);
}

void addClassroom(int id, List<Classroom> classrooms) {}

void delete<T>(List<T> list) {
  if (list.isEmpty) {
    print('Khong co gi de xoa het! :))) ');
    return;
  }
  stdout.write('Nhap id can xoa: ');
  int id = int.parse(stdin.readLineSync()!);
  if (id < 1 || id > list.length) {
    print('Khong ton tai ID nay');
    return;
  }
  list.removeAt(id - 1); //phai -1 de xoa dung index vi khi tao id= __.length+1
  print('Xoa thanh cong!');
}

class Person {
  int id;
  String name;
  int age;
  String gender;

  Person(this.id, this.name, this.age, this.gender);
}

class Student extends Person {
  String grade;
  double score;

  Student(
    super.id,
    super.name,
    super.age,
    super.gender,
    this.grade,
    this.score,
  );

  void showStudentInfo() {
    print('  ID hoc sinh: $id');
    print('  Ten hoc sinh: $name');
    print('  Tuoi: $age');
    print('  Gioi tinh: $gender');
    print('  Lop: $grade');
    print('  Diem TB: $score');
    print('-' * 10);
  }
}

class Teacher extends Person {
  String subject;
  int salary;

  Teacher(
    super.id,
    super.name,
    super.age,
    super.gender,
    this.subject,
    this.salary,
  );

  void showTeacherInfo() {
    print('  ID giao vien: $id');
    print('  Ten giao vien: $name');
    print('  Tuoi: $age');
    print('  Gioi tinh: $gender');
    print('  Mon giang day: $subject');
    print('  Muc luong: $salary');
    print('-' * 10);
  }
}

class Classroom {
  int id;
  String name;
  List<Student> students;
  Teacher teacher;

  Classroom(this.id, this.name, this.students, this.teacher);

  void showClassroomInfo() {
    print('ID lop hoc: $id');
    print('Ten lop: $name');
    print('Giao vien phu trach: $teacher');
    print('Danh sach hoc sinh trong lop:');
    for (var student in students) {
      print('- Ten hoc sinh: ${student.name}');
      print('  Diem TB: ${student.score}');
    }
    print('-' * 10);
  }
}
