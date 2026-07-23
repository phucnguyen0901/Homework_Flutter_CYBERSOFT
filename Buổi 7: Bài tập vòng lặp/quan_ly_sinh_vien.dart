import 'dart:io';

void main() {
  List<Student> listStudent = [];

  String feature = '''
  CHON CAC TINH NANG SAU: 
  1. Them sinh vien
  2. Hien thi danh sach sinh vien hien tai
  3. Tim sinh vien co DTB cao nhat
  4. Thoat chuong trinh
  ''';

  while (true) {
    print('*' * 10 + '\n' + feature);
    stdout.write('---> Chon so: ');
    String? userInput = stdin.readLineSync();

    if (userInput == null) {
      print('Khong hop le.');
      continue;
    }

    int chosenFeature;
    try {
      chosenFeature = int.parse(userInput);
    } catch (e) {
      print('Khong hop le. Nhap lai.');
      continue;
    }

    switch (chosenFeature) {
      case 1:
        addStudent(listStudent);
        break;
      case 2:
        showStudents(listStudent);
        break;
      case 3:
        findHighestAVG(listStudent);
        break;
      case 4:
        print('Da thoat ct');
        return;
      default:
        print('Khong hop le. Nhap so tu 1 den 4');
        break;
    }

    stdout.write('\nTiep tuc? (y/n): ');
    String? continueInput = stdin.readLineSync();
    if (continueInput == null) {
      print('Khong duoc de trong. Hay nhap lai!');
      continue;
    } else if (continueInput.toLowerCase() == 'y') {
      continue;
    } else if (continueInput.toLowerCase() == 'n') {
      print('Da thoat ct');
      break;
    } else {
      print('Khong hopw le. Hay nhap lai!');
      continue;
    }
  }
}

class Student {
  String name;
  double diemToan;
  double diemLy;
  double diemHoa;

  Student({
    required this.name,
    required this.diemToan,
    required this.diemHoa,
    required this.diemLy,
  });

  double avg() => (diemToan + diemLy + diemHoa) / 3;

  String rank(avg) {
    if (avg < 5)
      return 'Kem';
    else if (avg >= 5 && avg < 7)
      return 'Kha';
    else if (avg >= 7 && avg < 9)
      return 'Gioi';
    else
      return 'Xuat sac';
  }
}

void addStudent(List<Student> listStudent) {
  stdout.write('Ten sinh vien: ');
  String name = stdin.readLineSync()!;
  stdout.write('Diem toan: ');
  double math = double.parse(stdin.readLineSync()!);
  stdout.write('Diem ly: ');
  double physical = double.parse(stdin.readLineSync()!);
  stdout.write('Diem hoa: ');
  double chemical = double.parse(stdin.readLineSync()!);

  Student student = Student(
    name: name,
    diemToan: math,
    diemHoa: chemical,
    diemLy: physical,
  );

  listStudent.add(student);
}

void showStudents(List<Student> listStudent) {
  print('\nTHONG TIN SINH VIEN');
  for (var student in listStudent) {
    print('Ten sinh vien: ${student.name}');
    print('Diem toan: ${student.diemToan}');
    print('Diem ly: ${student.diemLy}');
    print('Diem hoa: ${student.diemHoa}');
    double avg = student.avg();
    print('Diem trung binh: ${avg.toStringAsFixed(1)} ');
    print('Xep loai hoc luc: ${student.rank(avg)}');
    print('-' * 10);
  }
}

void findHighestAVG(List<Student> listStudent) {
  String name = listStudent[0].name;
  double highest = listStudent[0].avg();
  for (var student in listStudent) {
    if (student.avg() > highest) {
      highest = student.avg();
      name = student.name;
    }
  }

  print(
    'Sinh vien ${name} co DTB cao nhat voi ${highest.toStringAsFixed(2)} diem',
  );
}
