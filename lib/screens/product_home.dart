import 'package:flutter/material.dart';
import 'package:leatning_flutter/cart.dart';
import 'package:leatning_flutter/data.dart';
import 'package:leatning_flutter/screens/all_category.dart';
import 'package:leatning_flutter/screens/cart_screen.dart';
import 'package:leatning_flutter/screens/detials.dart';
import 'package:leatning_flutter/screens/searchProduct.dart';
import 'package:provider/provider.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({super.key});

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  TextEditingController searchProduct = TextEditingController();
  String selectedCategory = 'All';
  List<String> displayCategories = [
    'All',
    ...electronicProducts.map((product) {
      return product['category'];
    }).toSet()
  ];
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filterResults = selectedCategory == 'All'
        ? electronicProducts
        : electronicProducts
            .where((product) => product['category'] == selectedCategory)
            .toList();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        // scrolledUnderElevation: 0.0,
        surfaceTintColor: Colors.transparent,
        actions: [
          SizedBox(width: 15),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Color.fromRGBO(193, 229, 3, 1),
                borderRadius: BorderRadius.circular(20)),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                size: 30,
              ),
            ),
          ),
          Spacer(),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: 'Delivery Address\n',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                TextSpan(
                  text: '92 High Street, Ilorin',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Spacer(),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 241, 242, 1),
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return CartScreen();
                    }));
                  },
                  icon: Icon(
                    Icons.shopping_basket,
                    size: 32,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 5,
                child: CircleAvatar(
                  radius: 13,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text(context.watch<Cart>().cart.length.toString()),
                ),
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SearchProduct(searchItem: value);
                      }));
                    }
                  },
                  controller: searchProduct,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: size.height * 0.023),
                    hintText: 'Search the entire Shop',
                    hintStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                    filled: true,
                    fillColor: Color.fromRGBO(240, 241, 242, 1),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      size: 30,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(200, 219, 214, 1),
                        Color.fromRGBO(174, 212, 208, 1)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.023),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Delivery is',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: size.width * 0.02,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.05,
                            vertical: size.height * 0.002),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          '50%',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'cheaper',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return AllCategory(
                                    allcategory: displayCategories);
                              },
                            ),
                          );
                        },
                        child: Text(
                          'See all',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                // SizedBox(
                //   height: size.height * 0.11,
                //   child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: categoryProduct.length,
                //       physics: const BouncingScrollPhysics(),
                //       itemBuilder: (context, index) {
                //         return Container(
                //           margin: EdgeInsets.symmetric(
                //               horizontal: size.width * 0.02),
                //           child: Column(
                //             children: [
                //               CircleAvatar(
                //                 radius: 30,
                //                 backgroundColor:
                //                     Color.fromRGBO(240, 241, 242, 1),
                //                 backgroundImage: NetworkImage(
                //                     categoryProduct[index]['image']),
                //               ),
                //               SizedBox(
                //                 height: size.height * 0.01,
                //               ),
                //               Text(
                //                 categoryProduct[index]['name'],
                //                 style: TextStyle(fontSize: 20),
                //               ),
                //             ],
                //           ),
                //         );
                //       }),
                // ),
                productFilterCategory(context),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Flash Sales',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text('See all',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of items per row
                      crossAxisSpacing:
                          10.0, // Space between items horizontally
                      // mainAxisSpacing: 10.0, // Space between items vertically
                      childAspectRatio: 0.7, // Aspect ratio of each item
                    ),
                    itemCount: filterResults.length,
                    itemBuilder: (context, index) {
                      final electronicProduct = filterResults[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailsPage(
                                    electronicProduct: electronicProduct);
                              },
                            ),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Container(
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10),
                            //     color: Colors.red,
                            //   ),
                            //   child: Image.network(
                            //     electronicProducts[index]['image'],
                            //     fit: BoxFit.contain,
                            //   ),
                            // ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                electronicProduct['image'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 180,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.error,
                                      size: 30, color: Colors.red);
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                (loadingProgress
                                                        .expectedTotalBytes ??
                                                    1)
                                            : null,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Text(
                              electronicProducts[index]['name'],
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "\$${electronicProducts[index]['price'].toString()}",
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                    style: IconButton.styleFrom(
                                        backgroundColor:
                                            Theme.of(context).primaryColor),
                                    onPressed: () {
                                      final result = context
                                          .read<Cart>()
                                          .addToCart(electronicProducts[index]);
                                      if (result) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'Product added to cart')),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'Product Already Exist')),
                                        );
                                      }
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      weight: 10,
                                    ))
                              ],
                            )
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget productFilterCategory(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: displayCategories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = displayCategories[index];
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: selectedCategory == displayCategories[index]
                    ? Theme.of(context).primaryColor
                    : Color.fromRGBO(178, 214, 210, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  displayCategories[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
