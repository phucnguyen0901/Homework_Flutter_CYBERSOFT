import 'dart:io';

void main() {
  List<Map<String, dynamic>> listStudent = [];

  String feature = '''
  Chon cac tinh nang tuong ung duoi day: 
  1. Them sinh vien
  2. Hien thi danh sach sinh vien hien tai
  3. Tim sinh vien co DTB cao nhat
  4. Thoat chuong trinh
  ''';

  while (true) {
    print('\n' + feature);
    stdout.write('---> Chon so: ');
    // String? userInput = stdin.readLineSync();
    int chosenFeature = int.parse(stdin.readLineSync()!);
    switch (chosenFeature) {
      case == 1:
        listStudent.add(addStudent(listStudent));
        break;
      case == 2:
        showStudents(listStudent);
        break;
      case == 3:
        findHighestAVG(listStudent);
        break;
      case == 4:
        return;
    }
  }

  /* ở đây sẽ xảy ra các truờng hợp input k hợp lệ để parse sang int, hoặc nhập ngoài range. 
  nhưng tạm thời em k dùng try-catch bắt lỗi, để tập trung vào yêu cầu bài tập là chính, 
  xem như "cầu may" nhập đúng 100%. hihi
  */
}

Map<String, dynamic> addStudent(insertToList) {
  stdout.write('Ten sinh vien: ');
  String name = stdin.readLineSync()!;
  stdout.write('Diem toan: ');
  double math = double.parse(stdin.readLineSync()!);
  stdout.write('Diem ly: ');
  double physical = double.parse(stdin.readLineSync()!);
  stdout.write('Diem hoa: ');
  double chemical = double.parse(stdin.readLineSync()!);

  Map<String, dynamic> student = {
    'Ten sinh vien': name,
    'Diem toan': math,
    'Diem ly': physical,
    'Diem hoa': chemical,
    'DTB': (math + physical + chemical) / 3,
  };

  return student;
}

void showStudents(listStudent) {
  for (var student in listStudent) {
    print('Ten sinh vien: ${student['Ten sinh vien']}');
    print('Diem toan: ${student['Diem toan']}');
    print('Diem ly: ${student['Diem ly']}');
    print('Diem hoa: ${student['Diem hoa']}');
    print('-' * 10);
  }
}

void findHighestAVG(listStudent) {
  String name = listStudent[0]['Ten sinh vien'];
  double highest = listStudent[0]['DTB'];
  for (var student in listStudent) {
    if (student['DTB'] > highest) {
      highest = student['DTB'];
      name = student['Ten sinh vien'];
    }
  }

  print(
    'Sinh vien ${name} co DTB cao nhat voi ${highest.toStringAsFixed(2)} diem',
  );
}
