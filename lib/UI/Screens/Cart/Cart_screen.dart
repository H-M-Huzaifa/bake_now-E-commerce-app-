import 'package:bake_now/UI/Screens/Cart/cart_provider.dart';
import 'package:bake_now/UI/Screens/Checkout_Screen/Checkout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Color(0xffFFF7DE),
        body: Center(
          child: Column(
            children: [
              //app bar
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  "Cart",
                  style: TextStyle(
                      fontFamily: 'Bebas',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff8D3F00)),
                ),
              ),

              Consumer<class_cart_provider>(
                builder: (context, vm, child) {
                  if(vm.cart_items.isEmpty){
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/shoppingbag.png', // Replace with your image path
                            //width: 200,
                            //height: 200,
                          ),
                          SizedBox(height: 20),
                          Text(textAlign: TextAlign.center,
                            "Hungry for some delicious treats?\nYour bag is empty, but our bakery is full of goodies!",
                            style: TextStyle(
                              fontFamily: 'Bebas',
                              fontSize: 22,
                              color: Color(0xff8D3F00),
                            ),
                          ),
                        ],
                      ),
                    );

                  }else{
                    return
                        Column(
                          children: [
                            Container(
                              height: 760,
                              child: ListView.builder(
                                itemCount: vm.cart_items.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Image(
                                      image: AssetImage(vm.cart_items[index]['image']),
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                      ),
                                      onPressed: () {
                                        vm.remove_cart_item(vm.cart_items[index]);
                                        //instance_favourite_provider.toggleFavourite(instance_favourite_provider.favourites[index]);
                                      },
                                    ),
                                    title: Text(
                                        vm.cart_items[index]['name']),
                                    subtitle: Text(
                                        vm.cart_items[index]['price']),
                                  );
                                },
                              ),
                            ),

                            //Checkout
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => checkout()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Container(
                                    width: 200,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xff7D7D7D),
                                          spreadRadius: -1,
                                          blurRadius: 7,
                                          offset: Offset(0, 10),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xffFFC107),
                                    ),
                                    child: Center(
                                        child: Text(
                                          "Checkout",
                                          style: TextStyle(
                                              fontFamily: "Bebas",
                                              fontSize: 25,
                                              color: Color(0xff8D3F00)),
                                        ))),
                              ),
                            ),
                          ],
                        );

                        




                  }

                },
              ),


            ],
          ),
        ),
      );
  }
}
