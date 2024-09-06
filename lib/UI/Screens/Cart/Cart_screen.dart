import 'package:bake_now/UI/Screens/Cart/cart_provider.dart';
import 'package:bake_now/UI/Screens/Checkout_Screen/Checkout.dart';
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
        body: Column(
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
                return Expanded(
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
                    ));
              },
            ),
          ],
        ),
      );
  }
}
