import 'dart:io';

void main() {
  stdout.write('Ten san pham: ');
  String productName = stdin.readLineSync()!;
  stdout.write('So luong mua: ');
  double buyAmount = double.parse(stdin.readLineSync()!);
  stdout.write('Don gia: ');
  int price = int.parse(stdin.readLineSync()!);

  double totalBeforeDiscount = buyAmount * price;

  double discount = checkDiscount(totalBeforeDiscount);
  double totalAfterDiscount =
      totalBeforeDiscount - (totalBeforeDiscount * discount);

  double taxVAT = 0.08;
  double totalAfterVAT = totalAfterDiscount + (totalAfterDiscount * taxVAT);

  print('-' * 10);
  print('Ten san pham: $productName');
  print('So luong: $buyAmount');
  print('Don gia: $price');
  print('--- Thanh tien: ${totalBeforeDiscount.toStringAsFixed(0)} VND');
  print('--- Giam gia: ${discount * 100}%');
  print('--- Thue VAT: ${taxVAT * 100}%');
  print('--- Tong thanh toan: ${totalAfterVAT.toStringAsFixed(0)} VND');
}

double checkDiscount(total) {
  switch (total) {
    case (>= 500_000 && < 1_000_000):
      return 0.05;
    case (>= 1_000_000):
      return 0.1;
    default:
      return 0;
  }
}
