import 'package:flutter/material.dart';
import 'package:homework_grocery_app/category/category.dart';
import 'category_items_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _balance(),
                const SizedBox(height: 30),
                _promotionCard(),
                const SizedBox(height: 30),
                Text(
                  'For you',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(height: 20),
                _allCategory(context),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: BackButton(),
    );
  }

  Row _balance() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your balance'),
            const SizedBox(height: 5),
            Text(
              '\$ 1,700.00',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ],
    );
  }

  Container _promotionCard() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.green,
      ),
      child: const Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Buy orange 10 Kg \nGet discount 25%',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Expanded _allCategory(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.9,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          var item = category[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryItemsPage(items: item['categoryItems']),
                ),
              );
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'] as IconData),
                  const SizedBox(height: 10),
                  Text('${item['name']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
