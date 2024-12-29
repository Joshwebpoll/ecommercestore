import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> electronicProduct;
  const DetailsPage({super.key, required this.electronicProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary),
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
                color: Colors.black,
              ),
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            productDetailsImage(context),
            singleProductDetails(context),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              // Logic to add the product to the cart
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Product added to cart!')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Add to Cart',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ));
  }

  Widget productDetailsImage(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.46,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 241, 242, 1),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            electronicProduct['image'],
          ),
        ),
      ),
    );
  }

  Widget singleProductDetails(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  electronicProduct['name'],
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$${electronicProduct['price'].toString()}",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  electronicProduct['description'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: electronicProduct['features'].length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              electronicProduct['features'][index].toString(),
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
