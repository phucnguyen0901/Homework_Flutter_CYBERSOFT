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
        addStudent(newStudentID++, students);
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
        addTeacher(newTeacherID++, teachers);
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
        Classroom classroom = Classroom(newClassroomID++, name, [], null);
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

//làm liều lần 1: quyết định thử record để tái sử dụng...
(String name, int age, String gender) inputBaseInfo() {
  stdout.write(' - Ten: ');
  String name = stdin.readLineSync()?.trim() ?? '';
  if (name.isEmpty) print('Khong duoc de trong');

  stdout.write(' - Tuoi: ');
  int age = int.tryParse(stdin.readLineSync()?.trim() ?? '') ?? 0;
  if (age <= 0) print('Tuoi khong hop le');

  // làm liều lần 2: chưa nghĩ ra cách xử lí phù hợp hơn. hihi
  stdout.write(' - Gioi tinh (0 = Nu , 1 = Nam): ');
  int genderInput = int.tryParse(stdin.readLineSync()?.trim() ?? '') ?? 2;
  if (genderInput != 0 && genderInput != 1) print('Nhap so khong phu hop');
  String gender = (genderInput == 0) ? 'Nu' : 'Nam';

  return (name, age, gender);
}

void addStudent(int id, List<Student> students) {
  print('Nhap thong tin hoc sinh');
  var (name, age, gender) = inputBaseInfo();
  stdout.write(' - Lớp: ');
  String grade = stdin.readLineSync()?.trim() ?? '';
  stdout.write(' - Điểm: ');
  double score = double.tryParse(stdin.readLineSync()?.trim() ?? '') ?? 0;

  Student student = Student(id, name, age, gender, grade, score);
  students.add(student);
  print('Them hoc sinh thanh coong');
}

void addTeacher(int id, List<Teacher> teachers) {
  print('Nhap thong tin giao vien');
  var (name, age, gender) = inputBaseInfo();
  stdout.write(' - Mon giang day: ');
  String subject = stdin.readLineSync()?.trim() ?? '';
  stdout.write(' - Muc luong: ');
  int salary = int.tryParse(stdin.readLineSync()?.trim() ?? '') ?? 0;

  Teacher teacher = Teacher(id, name, age, gender, subject, salary);
  teachers.add(teacher);
  print('Them giao vien thanh cong');
}

/*
oh wow bất ngờ chưa! 00:30 1/9, ngồi trong nhà WC, 
em chợt nghĩ "nếu các thứ cần xóa đều có sự hiện diện của Person thì tại sao 
không thử cho cái này kế thừa theo luôn?", lên mạng tìm cách kế thừa và làm theo :))
=> thành phẩm từ "tai nạn ngọt ngào", khỏi mất công viết lại 2 cái y chang 
cho students và teachers... hihi
*/
void delete<T extends Person>(List<T> list) {
  if (list.isEmpty) {
    print('Danh sach trong');
    return;
  }
  stdout.write('Nhap ID can xoa: ');
  int id = int.tryParse(stdin.readLineSync()?.trim() ?? '') ?? -1;

  int lengthBefore = list.length;
  list.removeWhere((listItem) => listItem.id == id);

  if (list.length < lengthBefore) {
    print('Xoa thanh cong!');
  } else {
    print('Khong tim thay ID nay');
  }
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
    print('  Diem: $score');
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
  Teacher? teacher;

  Classroom(this.id, this.name, this.students, this.teacher);

  void addTeacherIntoClass(List<Teacher> teachers) {
    stdout.write('Nhap ID giao vien: ');
    int teacherID = int.tryParse(stdin.readLineSync()?.trim() ?? '') ?? 0;

    for (var findTeacher in teachers) {
      if (findTeacher.id == teacherID) {
        this.teacher = findTeacher;
        print('Them giao vien phu trach thanh cong');
        return;
      }
    }
    print('Khong tim thay ID giao vien nay');
  }

  void addStudentIntoClass(List<Student> students) {
    stdout.write('Nhap ID hoc dinh can them: ');
    int studentID = int.tryParse(stdin.readLineSync()?.trim() ?? '') ?? 0;

    for (var student in students) {
      if (student.id == studentID) {
        this.students.add(student);
        print('Them hoc sinh vao lop thanh cong');
        return;
      }
    }
    print('Khong tim thay ID hoc sinh nay');
  }

  void showClassroomInfo() {
    String teacherName = teacher?.name ?? 'Chua co giao vien phu trach';
    print('ID lop hoc: $id');
    print('Ten lop: $name');
    print('Giao vien phu trach: $teacherName');
    print('Danh sach hoc sinh trong lop:');
    for (var student in students) {
      print('- Ten hoc sinh: ${student.name}');
      print('  Diem TB: ${student.score}');
    }
    print('-' * 10);
  }
}
