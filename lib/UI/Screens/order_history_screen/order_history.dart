import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class order_history extends StatefulWidget {
  const order_history({super.key});

  @override
  State<order_history> createState() => _order_historyState();
}

class _order_historyState extends State<order_history> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF7DE),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //appbar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Text(
              "Order History",
              style: TextStyle(
                  fontFamily: 'Bebas',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff8D3F00)),
            ),
            ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return ListTile();
            },),
          )
        ],
      ),
    );
  }
}
