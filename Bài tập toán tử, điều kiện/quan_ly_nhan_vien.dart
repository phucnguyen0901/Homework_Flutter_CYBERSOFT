import 'dart:io';

void main() {
  stdout.write('Tên nhân viên: ');
  String name = stdin.readLineSync()!;
  stdout.write('Số giờ làm việc: ');
  double totalHourWorked = double.parse(stdin.readLineSync()!);
  stdout.write('Luơng mỗi giờ làm việc: ');
  int salaryPerHour = int.parse(stdin.readLineSync()!);

  double salaryBeforeTax = totalHourWorked * salaryPerHour;

  if (totalHourWorked > 40) {
    salaryBeforeTax = salaryBeforeTax + (salaryBeforeTax * 20 / 100);
  }

  late double tax;
  switch (salaryBeforeTax) {
    case (< 7_000_000):
      tax = 0;
    case (>= 7_000_000 && < 10_000_000):
      tax = 0.05;
    case (>= 10_000_000):
      tax = 0.1;
  }

  double salaryAfterTax = salaryBeforeTax - (salaryBeforeTax * tax);

  print("Tên nhân viên: $name");
  print('Tổng luơng trước thuế: ${salaryBeforeTax.toStringAsFixed(0)} VND');
  print('Thuế thu nhập: ${(tax * 100).toStringAsFixed(0)}%');
  print('Luơng thực lãnh: ${salaryAfterTax.toStringAsFixed(0)} VND');
}
