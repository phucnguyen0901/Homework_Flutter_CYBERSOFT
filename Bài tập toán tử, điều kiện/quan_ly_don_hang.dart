import 'dart:io';

void main() {
  stdout.write('Tên hàng: ');
  String productName = stdin.readLineSync()!;
  stdout.write('Số lượng mua: ');
  double buyAmount = double.parse(stdin.readLineSync()!);
  stdout.write('Đơn giá: ');
  int price = int.parse(stdin.readLineSync()!);

  double totalBeforeDiscount = buyAmount * price;

  double discount = checkDiscount(totalBeforeDiscount);
  double totalAfterDiscount =
      totalBeforeDiscount - (totalBeforeDiscount * discount);

  double taxVAT = 0.08;
  double totalAfterVAT = totalAfterDiscount + (totalAfterDiscount * taxVAT);

  print('-' * 10);
  print('Tên hàng: $productName');
  print('Số luợng: $buyAmount');
  print('Đơn giá: $price');
  print('--- Thành tiền: ${totalBeforeDiscount.toStringAsFixed(0)} VND');
  print('--- Giảm giá: ${discount * 100}%');
  print('--- Thuế VAT: ${taxVAT * 100}%');
  print('--- Tổng thanh toán: ${totalAfterVAT.toStringAsFixed(0)} VND');
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
