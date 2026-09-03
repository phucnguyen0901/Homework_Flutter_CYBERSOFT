void main() {
  Student std1 = Student(
    id: 1,
    name: 'Nguyễn A',
    age: 18,
    gender: 'Nam',
    grade: 'flutter',
    score: [],
  );
  Student std2 = Student(
    id: 2,
    name: 'Trần A',
    age: 18,
    gender: 'Nam',
    grade: 'flutter',
    score: [8, 8, 8, 7],
  );
  Student std3 = Student(
    id: 3,
    name: 'Lê C',
    age: 18,
    gender: 'Nữ',
    grade: 'flutter',
    score: [8, 8, 8, 7, 9],
  );
  List<Student> listStudent = [std1, std2, std3];
  print('====== THÔNG TIN HỌC SINH ======');
  for (var student in listStudent) {
    student.showStudentInfo();
  }
  print('\n');

  Teacher teacher1 = Teacher(
    id: 1,
    name: 'Lý D',
    age: 28,
    gender: 'Nam',
    subject: 'Flutter',
    salary: 100_000_000,
  );
  List<Teacher> teachers = [teacher1];
  print('===== THÔNG TIN GIÁO VIÊN =====');
  for (var teacher in teachers) {
    teacher.showTeacherInfo();
  }
  print('\n');

  Classroom classroom = Classroom(id: 1, name: 'Flutter');
  // classroom.addTeacherIntoClass(teacher);
  for (var student in listStudent) {
    classroom.addStudentIntoClass(student);
  }
  print('===== BÁO CÁO LỚP =====');
  classroom.showClassroomInfo();
}

class Person {
  int id;
  String name;
  int age;
  String gender;

  Person({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
  });
}

class Student extends Person {
  String grade;
  List<double> score;

  Student({
    required super.id,
    required super.name,
    required super.age,
    required super.gender,
    required this.grade,
    required this.score,
  });

  double avgScore() {
    if (score.isEmpty == true) return 0; //tránh lỗi chia 0 ra NaN

    double total = 0;
    for (var i in score) {
      total += i;
    }
    return total / score.length;
  }

  void showStudentInfo() {
    print('  ID học sinh: $id');
    print('  Tên học sinh: $name');
    print('  Tuổi: $age');
    print('  Giới tính: $gender');
    print('  Lớp: $grade');
    print('  Danh sách điểm: $score \n');
  }
}

class Teacher extends Person {
  String subject;
  int salary;

  Teacher({
    required super.id,
    required super.name,
    required super.age,
    required super.gender,
    required this.subject,
    required this.salary,
  });

  void showTeacherInfo() {
    print('  ID giáo viên: $id');
    print('  Tên giáo viên: $name');
    print('  Tuổi: $age');
    print('  Giới tính: $gender');
    print('  Môn giảng dạy: $subject');
    print('  Mức lương: $salary VND \n');
  }
}

class Classroom {
  int id;
  String name;
  List<Student> students = [];
  Teacher? teacher;

  Classroom({required this.id, required this.name});

  void addTeacherIntoClass(Teacher teacher) {
    this.teacher = teacher;
  }

  void addStudentIntoClass(Student student) {
    students.add(student);
  }

  void showClassroomInfo() {
    print('ID lớp học: $id');
    print('Tên lớp: $name');

    String teacherName = (teacher?.name) ?? 'Chưa có giáo viên phụ trách';
    print('Giáo viên phụ trách: $teacherName');

    if (students.isEmpty == true) {
      print('Lớp trống');
      return;
    }
    print('Danh sách học sinh trong lớp:');
    for (var student in students) {
      double avgScore = student.avgScore();
      print('- Tên học sinh: ${student.name}');
      print('  Điểm TB: ${avgScore.toStringAsFixed(1)}');
    }

    print('-' * 10);
  }
}
