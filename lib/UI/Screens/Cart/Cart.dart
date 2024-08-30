import 'package:bake_now/UI/Screens/Checkout_Screen/Checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF7DE),
      body: Column(
        children: [
          Center(child: Text("Cart")),

          //Checkout
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => checkout(),));
                  },
                  child: Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff7D7D7D),
                            spreadRadius: -1,
                            blurRadius:7,
                            offset: Offset(0, 10),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xffFFC107),
                      ),
                      child: Center(child: Text("Checkout",style: TextStyle(fontFamily: "Bebas",fontSize: 25,color: Color(0xff8D3F00)),))
            
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
