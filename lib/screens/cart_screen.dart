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
        title: Text('Cart'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: cartList.isEmpty
          ? Center(
              child: Text(
                'Cart is Empty',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartList.length,
                    padding: EdgeInsets.only(bottom: 80),
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                cartList[index]['image'],
                                height: size.width * 0.25,
                                width: size.width * 0.3,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartList[index]['name'],
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 5),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "\$${cartList[index]['price'].toString()}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      // mainAxisSize: MainAxisSize.min,
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                            style: IconButton.styleFrom(
                                              backgroundColor: Color.fromRGBO(
                                                  234, 240, 247, 1),
                                            ),
                                            onPressed: () {
                                              context
                                                  .read<Cart>()
                                                  .increaseQuantity(
                                                      cartList[index]);
                                            },
                                            icon: Icon(
                                              Icons.add,
                                            )),
                                        SizedBox(width: 5),
                                        Text(
                                          cartList[index]['quantity']
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(width: 5),
                                        IconButton(
                                          style: IconButton.styleFrom(
                                            backgroundColor: Color.fromRGBO(
                                                234, 240, 247, 1),
                                          ),
                                          onPressed: () {
                                            if (cartList[index]['quantity'] ==
                                                1) {
                                              return;
                                            } else {
                                              context
                                                  .read<Cart>()
                                                  .decreaseQuantity(
                                                      cartList[index]);
                                            }
                                          },
                                          icon: Icon(Icons.remove),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                        //Image.network(cartList[index]['image']);
                      );
                    },
                  ),
                ),
                Container(
                  color:
                      Colors.white, // Background color for the bottom container
                  padding: EdgeInsets.all(16.0),
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
                                fontSize: 16.0, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "\$${context.watch<Cart>().getTotal.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // Proceed to Checkout Button
                      ElevatedButton(
                        onPressed: () {
                          print("checkout");
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Theme.of(context).primaryColor),
                        child: Text(
                          "Proceed to Checkout",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
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
