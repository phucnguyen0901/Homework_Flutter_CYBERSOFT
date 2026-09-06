import 'package:flutter/material.dart';
import 'package:hoc_flutter_1/shop_app/other/best_seller_item.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 63, 86),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 50, 16, 0),
          child: Column(
            spacing: 40,
            children: [_heading(), _mainView(context)],
          ),
        ),
      ),
    );
  }

  Row _heading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Find product easier here',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(16),
          ),
          child: BackButton(color: Colors.white),
        ),
      ],
    );
  }

  SizedBox _mainView(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 16),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: bestSellerItems.length,
        itemBuilder: (context, index) {
          var item = bestSellerItems[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 13, 155, 180),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                      item['name'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
} //class
