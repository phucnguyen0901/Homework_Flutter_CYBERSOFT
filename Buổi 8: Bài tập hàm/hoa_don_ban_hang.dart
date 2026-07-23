import 'dart:io';

void main() {
  List<Map<String, dynamic>> listCart = [];
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
        insertToCart(listCart);
        break;
      case 2:
        editCart(listCart);
        break;
      case 3:
        deleteCartItem(listCart);
        break;
      case 4:
        showCart(listCart);
        break;
      case 5:
        getTotal(listCart);
        break;
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

void insertToCart(List<Map<String, dynamic>> listCart) {
  stdout.write('Ten san pham moi: ');
  String itemName = stdin.readLineSync()!;
  if (listCart.any((e) => e['Ten san pham'] == itemName)) {
    print('San pham da ton tai');
    return;
  }
  stdout.write('So luong: ');
  double itemQuantity = double.parse(stdin.readLineSync()!);
  stdout.write('Gia tien: ');
  int itemPrice = int.parse(stdin.readLineSync()!);
  Map<String, dynamic> item = {
    'Ten san pham': itemName,
    'So luong': itemQuantity,
    'Gia tien': itemPrice,
  };

  listCart.add(item);
}

void editCart(List<Map<String, dynamic>> listCart) {
  if (listCart.isEmpty == true) {
    print('Khong co gi de sua');
    return;
  }

  stdout.write('Ten san pham can sua: ');
  String? editInput = stdin.readLineSync();
  if (editInput == null) {
    print('Khong duoc de trong');
    return;
  }

  for (var item in listCart) {
    if (editInput == item['Ten san pham']) {
      stdout.write('So luong moi: ');
      String? input = stdin.readLineSync();
      if (input == null) {
        print('Khong duoc de trong. Da thoat chinh sua');
        return;
      }
      double newQuantity;
      try {
        newQuantity = double.parse(input);
        if (newQuantity < 0) {
          print('So luong moi khong hop le. Da thoat chinh sua');
          return;
        }
        item['So luong'] = newQuantity;
        return;
      } catch (e) {
        print('Khong hop le. Da thoat chinh sua');
      }
      ;
    }
  }
}

void deleteCartItem(List<Map<String, dynamic>> listCart) {
  if (listCart.isEmpty == true) {
    print('Khong co gi de xoa');
    return;
  }

  stdout.write('Ten san pham can xoa: ');
  String? input = stdin.readLineSync();
  if (input == null) {
    print('Khong duoc de trong');
    return;
  }

  for (var item in listCart) {
    if (input == item['Ten san pham']) {
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

  print('\nDANH SACH GIO HANG');
  for (var item in listCart) {
    print(
      '${listCart.indexOf(item) + 1}. Ten san pham: ${item['Ten san pham']}',
    );
    print('   So luong: ${item['So luong']}');
    print('   Gia tien: ${item['Gia tien']}');
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
