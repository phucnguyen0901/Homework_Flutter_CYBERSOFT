import 'dart:io';

void main() {
  List<Map<String, dynamic>> listProduct = [];
  String feature = '''
  CHON SO TUONG UNG TINH NANG BEN DUOI:
  1. Them san pham
  2. Hien thi danh sach san pham
  3. Tim kiem san pham
  4. Ban san pham
  5. Thoat chuong trinh''';

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
        listProduct.add(addProduct(listProduct));
        break;
      case 2:
        showProduct(listProduct);
        break;
      case 3:
        var found = findProduct(listProduct);
        if (found != null) print('Tim thay san pham: \n $found');
        break;
      case 4:
        var productAfterSell = sellProduct(listProduct);
        if (productAfterSell != null) {
          for (var product in listProduct) {
            if (product['Ten san pham'] == productAfterSell['Ten san pham']) {
              product = productAfterSell;
            }
          }
          print('Ban hang thanh cong. Da cap nhat ton kho');
        }
        break;
      case 5:
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

Map<String, dynamic> addProduct(List<Map<String, dynamic>> insertToList) {
  stdout.write('Ten san pham: ');
  String newProductName = stdin.readLineSync()!;
  stdout.write('Gia tien: ');
  int price = int.parse(stdin.readLineSync()!);
  stdout.write('So luong ton kho: ');
  double stock = double.parse(stdin.readLineSync()!);

  Map<String, dynamic> product = {
    'Ten san pham': newProductName,
    'Gia tien': price,
    'Ton kho': stock,
  };

  return product;
}

void showProduct(List<Map<String, dynamic>> showListProduct) {
  print('\nDANH SACH SAN PHAM');
  for (var product in showListProduct) {
    print('${product} \n' + '-' * 5);
  }
}

Map<String, dynamic>? findProduct(List<Map<String, dynamic>> findInList) {
  stdout.write('Ten san pham: ');
  String? findInput = stdin.readLineSync();

  if (findInput == null) {
    print('Khong duoc de trong');
    return null;
  }

  int counted = 0;
  late var found;
  for (var product in findInList) {
    if (findInput == product['Ten san pham']) {
      counted += 1;
      found = product;
    }
  }

  if (counted == 0) {
    print('Khong co sna pham nao trung khop');
    return null;
  }

  return found;
}

Map<String, dynamic>? sellProduct(List<Map<String, dynamic>> listToCheckStock) {
  print('\nBAN SAN PHAM ');
  var product = findProduct(listToCheckStock);

  if (product == null) return null;

  stdout.write('So luong can ban');
  String? userInput = stdin.readLineSync();
  if (userInput == null) {
    print('Khong hop le. Da huy ban hang');
    return null;
  }

  late double sellAmount;
  try {
    sellAmount = double.parse(userInput);
  } catch (e) {
    print('Khong hop le. Da huy ban hang.');
    return null;
  }

  if (sellAmount <= product['Ton kho']) {
    product['Ton kho'] = product['Ton kho'] - sellAmount;
  } else {
    print('Ban hang khong thanh cong do so luong ton kho khong du');
    return null;
  }

  return product;
}
