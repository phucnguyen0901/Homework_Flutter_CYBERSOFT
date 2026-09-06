import 'package:flutter/material.dart';
import 'package:hoc_flutter_1/shop_app/other/icon_buttons.dart';
import 'package:hoc_flutter_1/shop_app/other/best_seller_item.dart';
import 'explore_page.dart';

class ShopHomepage extends StatelessWidget {
  const ShopHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            _greetUser('Samantha William'),
            _searchBar(),
            AdvertiseCard(),
            _menuButtons(context),
            _bestSellerTag(context),
            _bestSellerView(),
            const SizedBox(height: 20),
            Padding(padding: const EdgeInsets.all(8), child: BackButton()),
          ],
        ),
      ),
    );
  }

  Padding _greetUser(String userName) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 52, 12, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Welcome back,'),
              Text(
                userName,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
    );
  }

  Padding _searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, size: 18),
                prefixIconColor: Colors.grey,
                hintText: 'Searching item...',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                contentPadding: EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 234, 234, 234),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.orange,
            ),
            padding: const EdgeInsets.all(4),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.tune, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  GridView _menuButtons(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      itemCount: buttons.length,
      itemBuilder: (context, index) {
        var button = buttons[index];
        return SizedBox(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(59, 191, 191, 191),
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 231, 231, 231),
                ),
                child: IconButton(
                  onPressed: () {},
                  padding: const EdgeInsets.all(14),
                  icon: Icon(
                    button['iconButton'] as IconData,
                    color: Color.fromARGB(255, 13, 155, 180),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                button['name'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }

  Padding _bestSellerTag(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 5, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Best seller',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ExplorePage()),
              );
            },
            child: Text(
              'See all',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _bestSellerView() {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 6),
        children: List.generate(4, (index) {
          var item = bestSellerItems[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: AspectRatio(
              aspectRatio: 0.7,
              child: Card(
                color: const Color.fromARGB(255, 226, 226, 226),
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 13, 155, 180),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Text(
                        item['name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '⋆⋆⋆⋆⋆',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                            ),
                          ),
                          Text('5.0'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
} //Class

class AdvertiseCard extends StatefulWidget {
  const AdvertiseCard({super.key});

  @override
  State<AdvertiseCard> createState() => _AdvertiseCardState();
}

class _AdvertiseCardState extends State<AdvertiseCard> {
  final PageController _pageController = PageController();
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 4,
            onPageChanged: (newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 13, 155, 180),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4,
            (index) => AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: (_currentIndex == index) ? 16 : 8,
              decoration: BoxDecoration(
                color: (_currentIndex == index) ? Colors.orange : Colors.grey,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
