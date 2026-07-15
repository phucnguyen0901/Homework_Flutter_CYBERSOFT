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

  double tax = checkTaxRate(salaryBeforeTax);

  double salaryAfterTax = salaryBeforeTax - (salaryBeforeTax * tax);

  print("Tên nhân viên: $name");
  print('Tổng luơng trước thuế: ${salaryBeforeTax.toStringAsFixed(0)} VND');
  print('Thuế thu nhập: ${(tax * 100).toStringAsFixed(0)}%');
  print('Luơng thực lãnh: ${salaryAfterTax.toStringAsFixed(0)} VND');
}

double checkTaxRate(salary) {
  switch (salary) {
    case (>= 7_000_000 && < 10_000_000):
      return 0.05;
    case (>= 10_000_000):
      return 0.1;
    default:
      return 0;
  }
}
