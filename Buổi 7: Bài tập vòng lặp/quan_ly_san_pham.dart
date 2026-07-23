import 'dart:io';

void main() {
  List<Product> listProduct = [];

  const String feature = '''
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
        addProduct(listProduct);
        break;
      case 2:
        showProduct(listProduct);
        break;
      case 3:
        findProductByName(listProduct);
        break;
      case 4:
        sellProduct(listProduct);
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

class Product {
  String name;
  int price;
  double stock;

  Product({required this.name, required this.price, required this.stock});

  bool checkStock(sellAmount) {
    if (sellAmount > stock) return false;
    return true;
  }
}

void addProduct(List<Product> listProduct) {
  stdout.write('Ten san pham: ');
  String newProductName = stdin.readLineSync()!;
  stdout.write('Gia tien: ');
  int price = int.parse(stdin.readLineSync()!);
  stdout.write('So luong ton kho: ');
  double stock = double.parse(stdin.readLineSync()!);

  Product product = Product(name: newProductName, price: price, stock: stock);

  listProduct.add(product);
}

void showProduct(List<Product> listProduct) {
  if (listProduct.isEmpty) {
    print('Khong co san pham nao');
    return;
  }
  print('\nDANH SACH SAN PHAM');
  for (var product in listProduct) {
    print('${listProduct.indexOf(product) + 1}. Ten san pham: ${product.name}');
    print('   Gia tien: ${product.name}');
    print('   Ton kho: ${product.stock}');
    print('-' * 5);
  }
}

Product? findProductByName(List<Product> listProduct) {
  stdout.write('Ten san pham: ');
  String? findInput = stdin.readLineSync();

  if (findInput == null) {
    print('Khong duoc de trong');
    return null;
  }

  if (listProduct.any((product) => findInput != product.name)) {
    print('Khong co sna pham nao trung khop');
    return null;
  }

  late var found;
  for (var product in listProduct) {
    if (findInput == product.name) {
      print('Da tim thay san pham khop voi tu khoa tim kiem:');
      print('- ${product.name}');
      print('- Ton kho hien tai: ${product.stock}');
      print('- Gia ban: ${product.price}');
      found = product;
    }
  }
  return found;
}

void sellProduct(List<Product> listProduct) {
  print('\nBAN SAN PHAM ');
  var product = findProductByName(listProduct);

  if (product == null) return;

  stdout.write('So luong can ban: ');
  String? userInput = stdin.readLineSync();
  if (userInput == null) {
    print('Khong hop le. Da huy ban hang');
    return;
  }

  late double sellAmount;
  try {
    sellAmount = double.parse(userInput);
  } catch (e) {
    print('Khong hop le. Da huy ban hang.');
    return;
  }

  bool check = product.checkStock(sellAmount);
  if (check == false) {
    print('Ban khong thanh cong do ton kho khong du');
    return;
  }

  product.stock = product.stock - sellAmount;
  print('Thanh cong ban ${sellAmount}. Da cap nhat ton kho');
}
