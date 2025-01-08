import 'package:flutter/material.dart';
import 'package:leatning_flutter/cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartList = context.watch<Cart>().cart;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: cartList.isEmpty
          ? Center(
              child: Text(
                'Cart is Empty',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartList.length,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    itemBuilder: (context, index) {
                      return Container(
                        // color: Colors.blue,
                        // padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      cartList[index]['image'],
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          cartList[index]['name'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Text(
                                        "\$${cartList[index]['price'].toString()}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      // SizedBox(height: 5),

                                      SizedBox(height: 5)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                        style: IconButton.styleFrom(
                                          backgroundColor:
                                              Color.fromRGBO(234, 240, 247, 1),
                                        ),
                                        onPressed: () {
                                          context.read<Cart>().increaseQuantity(
                                              cartList[index]);
                                        },
                                        icon: Icon(
                                          Icons.add,
                                        )),
                                    SizedBox(width: 5),
                                    Text(
                                      cartList[index]['quantity'].toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(width: 5),
                                    IconButton(
                                      style: IconButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(234, 240, 247, 1),
                                      ),
                                      onPressed: () {
                                        if (cartList[index]['quantity'] == 1) {
                                          return;
                                        } else {
                                          context.read<Cart>().decreaseQuantity(
                                              cartList[index]);
                                        }
                                      },
                                      icon: Icon(Icons.remove),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    context
                                        .read<Cart>()
                                        .deleteProduct(cartList[index]);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    size: 20,
                                  ),
                                  color: Colors.red,
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color:
                      Colors.white, // Background color for the bottom container
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Cart Total
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "\$${context.watch<Cart>().getTotal.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // Proceed to Checkout Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Theme.of(context).primaryColor),
                        child: Text(
                          "Proceed to Checkout",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(10),
      //   child: ElevatedButton(
      //     style: ElevatedButton.styleFrom(
      //         padding: const EdgeInsets.symmetric(vertical: 15),
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(8),
      //         ),
      //         foregroundColor: Colors.black,
      //         backgroundColor: Color.fromRGBO(195, 231, 3, 1)),
      //     onPressed: () {},
      //     child: Text(
      //       'Proceed to Checkout',
      //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //     ),
      //   ),
      // ),
    );
  }
}
