import 'package:flutter/material.dart';

class prod_cate extends StatefulWidget {
  const prod_cate({super.key});

  @override
  State<prod_cate> createState() => _prod_cateState();
}

class _prod_cateState extends State<prod_cate> {
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
              "Cakes",
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
