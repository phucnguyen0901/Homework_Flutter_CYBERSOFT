import 'package:flutter/material.dart';
import 'package:hoc_flutter_1/grocery_app/page/grocery_homepage.dart';
import 'package:hoc_flutter_1/shop_app/pages/shop_homepage.dart';

class ChooseHomework extends StatelessWidget {
  const ChooseHomework({super.key});

  @override
  Widget build(BuildContext context) {
    String groceryImage = 'assets/image/grocery_screenshot.jpg';
    String shopImage = 'assets/image/shop_screenshot.jpg';

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _homework(groceryImage, 'Grocery app', context, GroceryHomepage()),
            const Divider(color: Color.fromARGB(255, 229, 229, 229)),
            _homework(shopImage, 'Shop app', context, ShopHomepage()),
          ],
        ),
      ),
    );
  }

  Row _homework(
    String image,
    String homeworkName,
    BuildContext context,
    Widget page,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(image, width: 150, height: 300),
        Column(
          children: [
            Text(
              homeworkName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page),
                );
              },
              child: Text('Xem   >'),
            ),
          ],
        ),
      ],
    );
  }
}
