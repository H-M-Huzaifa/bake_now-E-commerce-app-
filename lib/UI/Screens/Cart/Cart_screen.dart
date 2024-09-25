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
    double height_MQ = MediaQuery.of(context).size.height;
    double width_MQ = MediaQuery.of(context).size.width;
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
                              height: height_MQ*0.77,
                              child: ListView.builder(
                                itemCount: vm.cart_items.length,
                                itemBuilder: (context, index) {


                                  // int? price=int.tryParse(vm.cart_items[index]['price']);
                                  // int? quantity= vm.cart_items[index]['quantity'];
                                  // int total = (price ?? 0) * (quantity ?? 0);

                                  return
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                          color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: Offset(0, 5),
                                              ),
                                            ],
                                        ),
                                        width: double.infinity,
                                        height: height_MQ*0.14,
                                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,

                                          children: [
                                            Image(height: height_MQ*0.09,image: NetworkImage(vm.cart_items[index]['image']),errorBuilder: (context, error, stackTrace) =>
                                                Icon(Icons.error),),
                                            Container(child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                                  child: Text(vm.cart_items[index]['name'],style: TextStyle(color: Color(0xff8D3F00),fontSize: 25,fontFamily: 'Bebas'),),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                                  child: Text(vm.cart_items[index]['size']+"  x"+ vm.cart_items[index]['quantity'].toString(),style: TextStyle(color: Colors.grey,fontSize: 20,fontFamily: 'Bebas'),),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 7,top: 5.0),
                                                  child: Text("Rs "+vm.cart_items[index]['finalprice'].toString() +"/-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,fontFamily: 'Bebas'),),
                                                )
                                              ],
                                            ),),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 50),
                                              child: InkWell(onTap: (){
                                                vm.remove_cart_item(vm.cart_items[index]);
                                              },child: Icon(Icons.delete,color: Color(0xff8D3F00),)),
                                            )
                                          ],
                                        ) ,
                                      ),
                                    );
                                },
                              ),
                            ),


                            //Total Price
                            Container(
                              child: Column(children: [
                                Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Total",
                                        style: TextStyle(
                                            color: Color(0xff8D3F00),
                                            fontFamily: "Bebas",
                                            fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Text("Rs "+
                                        vm.totalprice.toStringAsFixed(0)+"/-",
                                        style: TextStyle(
                                            color: Color(0xff8D3F00),
                                            fontFamily: "Bebas",
                                            fontSize: 20),
                                      ),
                                    ),



                                  ],
                                ),
                                //Checkout
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => checkout()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
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
                              ],),
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
