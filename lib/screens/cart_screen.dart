import 'package:flutter/material.dart';
import 'package:leatning_flutter/data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String selectedCategory = 'All';

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   selectedCategory = 'All';
  // }

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'All',
      ...electronicProducts.map((product) => product['category']!).toSet()
    ];
    List<Map<String, dynamic>> filterProduct = selectedCategory == 'All'
        ? electronicProducts
        : electronicProducts
            .where((product) => product['category'] == selectedCategory)
            .toList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = categories[index];
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: selectedCategory == categories[index]
                                ? Colors.red
                                : Colors.yellow,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          categories[index],
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              width: 100,
              height: 140,
              child: ListView.builder(
                  itemCount: filterProduct.length,
                  itemBuilder: (context, index) {
                    return Text(filterProduct[index]['name']);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
