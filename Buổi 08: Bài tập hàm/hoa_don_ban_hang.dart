import 'dart:io';

void main() {
  List<Map<String, dynamic>> listCart = [
    {'Ten san pham': 'ca mu', 'So luong': 12, 'Gia tien': 350000},
    {'Ten san pham': 'coca', 'So luong': 12, 'Gia tien': 15000},
    {'Ten san pham': 'cha gio', 'So luong': 500, 'Gia tien': 8000},
  ];
  String feature = '''
  CHON SO TUONG UNG TINH NANG BEN DUOI:
  1. Them san pham vao gio hang
  2. Sua san pham trong gio hang
  3. Xoa san pham
  4. Xem gio hang
  5. Tinh tien
  ''';

  while (true) {
    print('*' * 10 + '\n' + feature);
    stdout.write('--> Chon so: ');
    String? chosenFeature = stdin.readLineSync();

    switch (chosenFeature) {
      case '1':
        insertToCart(listCart);
        break;
      case '2':
        editCart(listCart);
        break;
      case '3':
        deleteCartItem(listCart);
        break;
      case '4':
        showCart(listCart);
        break;
      case '5':
        getTotal(listCart);
        break;
      default:
        print('Khong hop le. Nhap so tu 1 den 5');
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

void insertToCart(List<Map<String, dynamic>> listCart) {
  stdout.write('Ten san pham moi: ');
  String? itemName = stdin.readLineSync()?.trim() ?? '';
  if (itemName.isEmpty == true) {
    print('Ten khong duoc de trong.');
    return;
  }
  if (listCart.any(
    (e) => e['Ten san pham'].toLowerCase() == itemName.toLowerCase(),
  )) {
    print('San pham da ton tai');
    return;
  }

  stdout.write('So luong: ');
  double? itemQuantity = double.tryParse(stdin.readLineSync() ?? '');
  if (itemQuantity == null || itemQuantity < 0) {
    print('So luong khong hop le.');
    return;
  }

  stdout.write('Gia tien: ');
  int? itemPrice = int.tryParse(stdin.readLineSync() ?? '');
  if (itemPrice == null || itemPrice < 0) {
    print('Gia tien khong hop le');
    return;
  }

  Map<String, dynamic> item = {
    'Ten san pham': itemName,
    'So luong': itemQuantity,
    'Gia tien': itemPrice,
  };
  listCart.add(item);
  print('Them san pham vao gio hang thanh cong');
}

void editCart(List<Map<String, dynamic>> listCart) {
  if (listCart.isEmpty == true) {
    print('Gio hang trong, khong co gi de sua');
    return;
  }

  stdout.write('Ten san pham can sua: ');
  String? editInput = stdin.readLineSync()?.trim() ?? '';
  if (editInput.isEmpty == true) {
    print('Khong duoc de trong');
    return;
  }

  for (var item in listCart) {
    String itemName = item['Ten san pham'];
    if (editInput.toLowerCase() == itemName.toLowerCase()) {
      stdout.write('So luong moi: ');
      double? newQuantity = double.tryParse(stdin.readLineSync()?.trim() ?? '');
      if (newQuantity == null || newQuantity < 0) {
        print('So luong moi khong hop le. Da thoat chinh sua.');
        return;
      }
      item['So luong'] = newQuantity;
      print('Da cap nhat thanh cong so luong moi');
      return;
    }
  }
  print('Khong tim thay san pham trong gio hang.');
}

void deleteCartItem(List<Map<String, dynamic>> listCart) {
  if (listCart.isEmpty == true) {
    print('Gio hang trong, khong co gi de xoa');
    return;
  }

  stdout.write('Ten san pham can xoa: ');
  String? inputName = stdin.readLineSync()?.trim() ?? '';
  if (inputName.isEmpty == true) {
    print('Khong duoc de trong');
    return;
  }

  for (var item in listCart) {
    String itemName = item['Ten san pham'];
    if (inputName.toLowerCase() == itemName.toLowerCase()) {
      listCart.remove(item);
      print('Da xoa san pham');
      return;
    }
  }
  print('Khong tim thay san pham');
}

void showCart(List<Map<String, dynamic>> listCart) {
  if (listCart.isEmpty == true) {
    print('Gio hang trong');
    return;
  }

  print('\n===== DANH SACH GIO HANG =====');
  for (int index = 0; index < listCart.length; index++) {
    var item = listCart[index];
    print('${index + 1}. Ten san pham: ${item['Ten san pham']}');
    print('   So luong: ${item['So luong']}');
    print('   Gia tien: ${item['Gia tien']} VND');
    print('-' * 10);
  }
}

void getTotal(List<Map<String, dynamic>> listCart) {
  if (listCart.isEmpty == true) {
    print('Gio hang trong');
    return;
  }

  double total = 0;
  for (var item in listCart) {
    total = total + (item['So luong'] * item['Gia tien']);
  }

  print('Tong tien: ${total.toStringAsFixed(0)} VND');
}
