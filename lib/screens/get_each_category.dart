import 'package:flutter/material.dart';
import 'package:leatning_flutter/data.dart';
import 'package:leatning_flutter/screens/detials.dart';

class GetEachCategory extends StatefulWidget {
  final String eachProduct;
  const GetEachCategory({super.key, required this.eachProduct});

  @override
  State<GetEachCategory> createState() => _GetEachCategoryState();
}

class _GetEachCategoryState extends State<GetEachCategory> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> eachProductList =
        widget.eachProduct == 'All'
            ? electronicProducts
            : electronicProducts
                .where((product) => product['category'] == widget.eachProduct)
                .toList();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.eachProduct,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor:
            Theme.of(context).primaryColor, // Fixed background color
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: eachProductList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailsPage(
                            electronicProduct: eachProductList[index]);
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
                          image: NetworkImage(eachProductList[index]['image']),
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
                          eachProductList[index]['name'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text("\$${eachProductList[index]['price'].toString()}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
