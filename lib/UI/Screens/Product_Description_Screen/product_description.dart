import 'package:bake_now/UI/Screens/Bottom_nav_bar/nav_bar.dart';
import 'package:bake_now/UI/Screens/Cart/Cart_screen.dart';
import 'package:bake_now/UI/Screens/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:badges/badges.dart' as badges;


class product_description extends StatefulWidget {
  String name;
  String image;
  String description;
  String size;
  String price;

  product_description({super.key,
  required this.name,
  required this.image,
  required this.description,
  required this.size,
  required this.price,
  });

  @override
  State<product_description> createState() => _product_descriptionState();
}

class _product_descriptionState extends State<product_description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF7DE),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //product_container
            Container(
              width: double.infinity,
              height: 460,
              decoration:  BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage(widget.image)),
                color: Color(0xffFFC107),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(150),
                  bottomLeft: Radius.circular(150),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => bottom_nav_bar(),));},child: Icon(color: Color(0xff8D3F00), Icons.arrow_back_ios_new)),
                        Text(
                          widget.name,
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
                                  builder: (context) => cart(),
                                ));
                          },
                          child: badges.Badge(position: badges.BadgePosition.topEnd(end: -10,top: -10),
                            badgeAnimation: badges.BadgeAnimation.slide(),
                            badgeContent: Text(
                              "5",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            child: Icon(
                              Icons.shopping_bag,
                              color: Color(0xff8D3F00),
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //Text Description
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  textAlign: TextAlign.center,
                  widget.description.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Color(0xff8D3F00)),
                ),
              ),
            ),

            //Size
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Container(
                  width: 350,
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
                    color: Colors.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("Size" ,style: TextStyle(fontFamily: "Bebas",fontSize: 25),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(widget.size,style: TextStyle(fontFamily: "Bebas",fontSize: 25,color: Color(0xff8D3F00)),),
                      )
                    ],
                  ),

                ),
              ),
            ),

            //Price
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Container(
                  width: 350,
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
                      color: Colors.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("Price",style: TextStyle(fontFamily: "Bebas",fontSize: 25),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(widget.price,style: TextStyle(fontFamily: "Bebas",fontSize: 25,color: Color(0xff8D3F00)),),
                      )
                    ],
                  ),

                ),
              ),
            ),

            //Quantity
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Container(
                  width: 350,
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
                      color: Colors.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("Quantity",style: TextStyle(fontFamily: "Bebas",fontSize: 25),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(

                          child: Row(
                            children: [

                              //remove
                              Container(
                                width: 35,
                                height: 35,
                                child: Icon(color: Colors.white,Icons.remove),
                              decoration: BoxDecoration(color: Color(0xffFFC107),shape: BoxShape.circle),),

                              //number
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text("1",style: TextStyle(fontFamily: "Bebas",fontSize: 25),),
                              ),

                              //add
                              Container(
                                width: 35,
                                height: 35,
                                child: Icon(color: Colors.white,Icons.add),
                                decoration: BoxDecoration(color: Color(0xffFFC107),shape: BoxShape.circle),),


                            ]
                          ),
                        )

                      ),
                    ],
                  ),

                ),
              ),
            ),


            //Add to Cart
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => cart(),));
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
                    child: Center(child: Text("Add to cart",style: TextStyle(fontFamily: "Bebas",fontSize: 25,color: Color(0xff8D3F00)),))

                  ),
                ),
              ),
            ),




          ],
        ),
      ),
    );
  }
}
