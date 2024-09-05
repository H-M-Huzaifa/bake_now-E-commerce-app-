import 'package:bake_now/UI/Screens/Bottom_nav_bar/nav_bar.dart';
import 'package:bake_now/UI/Screens/Cart/Cart.dart';
import 'package:bake_now/UI/Screens/home_screen/home_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class checkout extends StatefulWidget {
  const checkout({super.key});

  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  bool? is_selected_checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF7DE),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => cart(),
                                ));
                          },
                          child: Icon(
                              color: Color(0xff8D3F00),
                              Icons.arrow_back_ios_new))),
                  Text(
                    "Checkout",
                    style: TextStyle(
                        fontFamily: 'Bebas',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff8D3F00)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bottom_nav_bar(),
                          ));
                    },
                    child: Icon(
                      Icons.home,
                      color: Color(0xff8D3F00),
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),

            //Checkout Image
            Image(
              height: 300,
              width: 300,
              image: AssetImage('assets/images/checkout.png'),
            ),

            //Name
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xff8D3F00),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide:
                                BorderSide(width: 2, color: Colors.green),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                          prefixIcon: Icon(
                            Icons.drive_file_rename_outline,
                            color: Color(0xffFFC107),
                          ),
                          hintText: 'Daniel Ritchie',
                          hintStyle: TextStyle(color: Colors.grey),
                          labelText: 'Name',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),

                  //Contact number
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xff8D3F00),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide:
                                BorderSide(width: 2, color: Colors.green),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: Color(0xffFFC107),
                          ),
                          hintText: 'Anywhere North St 123',
                          hintStyle: TextStyle(color: Colors.grey),
                          labelText: 'Address',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),

                  //Phone
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xff8D3F00),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide:
                                BorderSide(width: 2, color: Colors.green),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: Color(0xffFFC107),
                          ),
                          hintText: '0321-1234567',
                          hintStyle: TextStyle(color: Colors.grey),
                          labelText: 'Contact Number',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),

                  //Checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: is_selected_checkbox,
                        onChanged: (value) {
                          setState(() {
                            is_selected_checkbox = value;
                          });
                        },
                      ),
                      Text(
                        "Save this information for future",
                        style:
                            TextStyle(color: Color(0xff8D3F00), fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //Total
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Total"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text("2370/-"),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Standard Delivery Charges"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text("200/-"),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Sub Total",
                          style: TextStyle(
                              color: Color(0xff8D3F00),
                              fontFamily: "Bebas",
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          "2570/-",
                          style: TextStyle(
                              color: Color(0xff8D3F00),
                              fontFamily: "Bebas",
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            //Order Now
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Color(0xfffaf1cf),
                                borderRadius: BorderRadius.circular(30)),
                            height: double.infinity,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Container(
                                    width: 70,
                                    height: 7,
                                    decoration: BoxDecoration(
                                        color: Color(0xffbb5900),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                                Lottie.asset(
                                    frameRate: FrameRate(120),
                                    "assets/animations/checkout_animation.json"),
                                Center(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(50.0),
                                        child: RichText(textAlign: TextAlign.center,
                                            text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Order Confirmed",
                                              style: TextStyle(
                                                color: Colors.black,
                                                  fontFamily: 'Bebas',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            TextSpan(
                                              text: "\nYou will recieve a confirmation message shortly",
                                              style: TextStyle(
                                                fontFamily: 'Bebas',
                                                color: Colors.grey,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        )),
                                      ),

                                      //Explore more
                                      InkWell(
                                        onTap:(){
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => bottom_nav_bar(),));
                                        },
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
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Color(0xffFFC107),
                                            ),
                                            child: Center(
                                                child: Text(
                                              "Continue Shopping",
                                              style: TextStyle(
                                                  fontFamily: "Bebas",
                                                  fontSize: 25,
                                                  color: Color(0xff8D3F00)),
                                            ))),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
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
                        "order now",
                        style: TextStyle(
                            fontFamily: "Bebas",
                            fontSize: 25,
                            color: Color(0xff8D3F00)),
                      ))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
