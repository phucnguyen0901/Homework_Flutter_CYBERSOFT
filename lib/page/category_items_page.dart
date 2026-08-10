import 'package:flutter/material.dart';

class CategoryItemsPage extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const CategoryItemsPage({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton()),
      body: SizedBox(
        child: ListView.builder(
          itemCount: items.length,
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) {
            var item = items[index];
            return _itemTile(item);
          },
        ),
      ),
    );
  }

  Column _itemTile(Map<String, dynamic> item) {
    return Column(
      spacing: 25,
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 20,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(
                    item['name'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    '${item['stock']} ready stocks',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    '\$ ${item['price']}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            // const SizedBox(),
            const Icon(Icons.favorite_border),
          ],
        ),
        const Divider(),
      ],
    );
  }
} // Class
