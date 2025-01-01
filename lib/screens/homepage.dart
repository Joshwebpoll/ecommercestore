import 'package:flutter/material.dart';
import 'package:leatning_flutter/data.dart';
import 'package:leatning_flutter/screens/cart_screen.dart';
import 'package:leatning_flutter/screens/detials.dart';
import 'package:leatning_flutter/screens/product_home.dart';
import 'package:leatning_flutter/screens/testingfilter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List page = [
    ProductHomePage(),
    CartScreen(),
    Testingfilter(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentPage],
      bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          currentIndex: currentPage,
          onTap: (value) {
            if (value != 1) {
              setState(() {
                currentPage = value;
              });
            } else {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return CartScreen();
              }));
            }
          },
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home,
                  size: 35,
                )),
            BottomNavigationBarItem(
                label: 'Cart',
                icon: Icon(
                  Icons.shopping_bag,
                  size: 35,
                )),
            // BottomNavigationBarItem(
            //     label: 'Whishlist',
            //     icon: Icon(
            //       Icons.shopping_cart_checkout,
            //       size: 35,
            //     )),
          ]),
    );
  }
}
