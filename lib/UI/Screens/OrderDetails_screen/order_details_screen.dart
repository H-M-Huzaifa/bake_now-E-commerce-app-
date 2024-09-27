import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> order;

  const OrderDetailsScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF7DE),
      body: Column(
        children: [
          // Appbar-like header
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              "Order #${order['orderNumber']}",
              style: TextStyle(
                  fontFamily: 'Bebas',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff8D3F00)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: order['cartItems'].length,
              itemBuilder: (context, index) {
                final item = order['cartItems'][index];
                return ListTile(
                  title: Text(item['name']),
                  trailing: Image.network(item['image']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price: Rs. ${item['price']}"),
                      Text("Quantity: ${item['quantity']}"),
                      // Add code to display item image here (if available)
                    ],                    
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
