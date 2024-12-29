import 'package:flutter/material.dart';
import 'package:leatning_flutter/data.dart';
import 'package:leatning_flutter/screens/detials.dart';

class SearchProduct extends StatelessWidget {
  final String searchItem;
  const SearchProduct({super.key, required this.searchItem});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> seachItemProduct = electronicProducts
        .where((product) =>
            product['name']!.toLowerCase().contains(searchItem.toLowerCase()))
        .toList();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Item',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: seachItemProduct.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'No product found',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: seachItemProduct.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailsPage(
                                    electronicProduct: seachItemProduct[index]);
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: size.height / 3.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      seachItemProduct[index]['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Image.network(eachProductList[index]['image']),
                            SizedBox(height: 10),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  seachItemProduct[index]['name'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "\$${seachItemProduct[index]['price'].toString()}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
