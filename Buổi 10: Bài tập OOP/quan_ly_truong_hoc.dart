import 'dart:io';

void main() {
  List<Student> students = [];
  List<Teacher> teachers = [];
  List<Classroom> classrooms = [];

  int newStudentID = 1;
  int newTeacherID = 1;
  int newClassroomID = 1;

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
    7. Mo lop moi, them giao vien va hoc sinh vao lop
    8. Bao cao danh sach lop
  ''';

  while (true) {
    print('*' * 10 + '\n' + feature);
    stdout.write('--> Chon so: ');
    String? chosenFeature = stdin.readLineSync()?.trim();

    switch (chosenFeature) {
      case '1':
        addStudent(newStudentID + 1, students);
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
        addTeacher(newTeacherID + 1, teachers);
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
        stdout.write('Nhap ten lop: ');
        String name = stdin.readLineSync()?.trim() ?? '';
        Classroom classroom = Classroom(newClassroomID + 1, name, [], null);
        classroom.addTeacherIntoClass(teachers);
        classroom.addStudentIntoClass(students);
        classrooms.add(classroom);
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
    String? continueInput = stdin.readLineSync()?.trim();
    if (continueInput?.toLowerCase() != 'y') {
      print('Da thoat ct');
      break;
    }
  }
}

void addStudent(int id, List<Student> students) {
  print('Nhap thong tin hoc sinh');
  stdout.write(' - Ten hoc sinh: ');
  String name = stdin.readLineSync()?.trim() ?? '';
  if (name.isEmpty) {
    print('Khong duoc de trong');
    return;
  }

  stdout.write(' - Tuoi: ');
  int age = int.tryParse(stdin.readLineSync()?.trim() ?? '') ?? 0;
  if (age <= 0) {
    print('Tuoi khong hop le');
    return;
  }

  stdout.write(' - Gioi tinh (0 = Nu , 1 = Nam): ');
  int genderInput = int.tryParse(stdin.readLineSync()?.trim() ?? '') ?? 2;
  // làm liều. hihi
  if (genderInput != 0 || genderInput != 1) {
    print('Nhap so khong phu hop');
    return;
  }
  String gender = (genderInput == 0) ? 'Nu' : 'Nam';

  stdout.write(' - Lop: ');
  String grade = stdin.readLineSync()?.trim() ?? '';
  if (grade.isEmpty) {
    print('Khong duoc de trong');
    return;
  }

  stdout.write(' - Diem: ');
  double score = double.tryParse(stdin.readLineSync()?.trim() ?? '') ?? 0;

  Student student = Student(id, name, age, gender, grade, score);
  students.add(student);
  print('Them hoc sinh thanh cong');
}

void addTeacher(int id, List<Teacher> teachers) {
  print('Nhap thong tin giao vien');
  stdout.write('Ten giao vien: ');
  String name = stdin.readLineSync()?.trim() ?? '';
  if (name.isEmpty) {
    print('Khong duoc de trong');
    return;
  }

  stdout.write(' - Tuoi: ');
  int age = int.tryParse(stdin.readLineSync()?.trim() ?? '') ?? 0;
  if (age <= 0) {
    print('Tuoi khong hop le');
    return;
  }

  stdout.write(' - Gioi tinh (0 = Nu , 1 = Nam): ');
  int genderInput = int.tryParse(stdin.readLineSync()?.trim() ?? '') ?? 2;
  // làm liều. hihi
  if (genderInput != 0 || genderInput != 1) {
    print('Nhap so khong phu hop');
    return;
  }
  String gender = (genderInput == 0) ? 'Nu' : 'Nam';
  stdout.write('Mon giang day: ');
  String subject = stdin.readLineSync()!;
  stdout.write('Muc luong: ');
  int salary = int.parse(stdin.readLineSync()!);

  Teacher teacher = Teacher(id, name, age, gender, subject, salary);
  teachers.add(teacher);
}

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
  list.removeAt(id);
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
  List<Student>? students;
  Teacher? teacher;

  Classroom(this.id, this.name, this.students, this.teacher);

  void addTeacherIntoClass(List<Teacher> teachers) {
    stdout.write('Nhap id giao vien: ');
    int teacherID = int.parse(stdin.readLineSync()!);
    if (teacherID < 1 || teacherID > teachers.length) {
      print('Khong ton tai ID giao vien nay');
      return;
    }
    this.teacher = teachers[teacherID - 1];
    print('Them giao vien phu trach thanh cong');
  }

  void addStudentIntoClass(List<Student> students) {
    if (students.isEmpty) {
      print('Khong thanh cong. Danh sach hoc sinh dang trong');
      return;
    }
    this.students?.addAll(students);
    print('Them hoc sinh vao lop thanh cong');
  }

  void showClassroomInfo() {
    String teacherName = teacher?.name ?? 'Chua co giao vien phu trach';
    print('ID lop hoc: $id');
    print('Ten lop: $name');
    print('Giao vien phu trach: $teacherName');
    print('Danh sach hoc sinh trong lop:');
    for (var student in students!) {
      print('- Ten hoc sinh: ${student.name}');
      print('  Diem TB: ${student.score}');
    }
    print('-' * 10);
  }
}
