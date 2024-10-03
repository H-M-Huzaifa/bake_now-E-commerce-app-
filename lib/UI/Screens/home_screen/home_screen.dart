import 'package:bake_now/UI/Screens/Bottom_nav_bar/nav_bar.dart';
import 'package:bake_now/UI/Screens/Cart/Cart_screen.dart';
import 'package:bake_now/UI/Screens/Cart/cart_provider.dart';
import 'package:bake_now/UI/Screens/Product_Description_Screen/product_description.dart';
import 'package:bake_now/UI/Screens/Product_categories/product_category.dart';
import 'package:bake_now/UI/Screens/Product_categories/product_category_provider.dart';
import 'package:bake_now/UI/Screens/favourites_screen/fav_provider.dart';
import 'package:bake_now/UI/Screens/home_screen/home_screen_provider.dart';
import 'package:bake_now/UI/Screens/sign_in&up/signup_provider.dart';
import 'package:bake_now/UI/Screens/user_profile_screen/user_profile.dart';
import 'package:bake_now/Utilities/colors.dart';
import 'package:bake_now/Utilities/colors.dart';
import 'package:bake_now/Utilities/colors.dart';
import 'package:bake_now/Utilities/colors.dart';
import 'package:bake_now/Utilities/colors.dart';
import 'package:bake_now/Utilities/colors.dart';
import 'package:bake_now/Utilities/colors.dart';
import 'package:bake_now/Utilities/colors.dart';
import 'package:bake_now/Utilities/colors.dart';
import 'package:bake_now/Utilities/colors.dart';
import 'package:bake_now/Utilities/colors.dart';
import 'package:bake_now/Utilities/colors.dart';
import 'package:bake_now/Utilities/colors.dart';
import 'package:bake_now/Utilities/colors.dart';
import 'package:bake_now/Utilities/screen_size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  void initState() {
    super.initState();
    Provider.of<class_prod_cate_provider>(context, listen: false).populatePopularItems();
  }
  @override
  Widget build(BuildContext context) {
    screen_config size=screen_config(context);
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final instance_cart_provider = Provider.of<class_cart_provider>(context);
    final instance_prod_cate_provider = Provider.of<class_prod_cate_provider>(context,listen: false);

    return Scaffold(
      backgroundColor: myColors.tertiary_color,

      //Floating Button
      // floatingActionButton: FloatingActionButton(
      //     child: Image(
      //         height: size.h*0.04,
      //         image: AssetImage('assets/icons/chat.png')),
      //     backgroundColor: myColors.primary_color,
      //     onPressed: () {}),

      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //app bar
        Container(
          width: double.infinity,
          height: size.h*0.37,
          decoration: const BoxDecoration(
            color: myColors.primary_color,
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
                    Consumer<class_sign_up_provider>(builder: (context, vm, child) {
                      vm.fetchUserImage();
                      return CircleAvatar(
                        maxRadius: size.h*0.016,
                        backgroundColor: myColors.textSecondary.shade300,
                        backgroundImage: vm.imageUrl != null
                            ? NetworkImage(vm.imageUrl!) // Network image if available
                            : AssetImage('assets/images/avatar.png') as ImageProvider, // Default avatar image
                      );

                    },
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                          fontFamily: 'Bebas',
                          fontSize: size.text*1.2,
                          fontWeight: FontWeight.bold,
                          color: myColors.secondary_color),
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
                          instance_cart_provider.cart_items.length>=1 ?
                          instance_cart_provider.cart_items.length.toString() : "",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        child: Icon(
                          Icons.shopping_bag,
                          color: myColors.secondary_color,
                          size: size.h*0.027,
                        ),
                      ),
                    ),
                  ],
                ),

                //Logo
                Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                        color: Color(0xff7D7D7D),
                        spreadRadius: -15,
                        blurRadius: 0,
                        offset: Offset(-10, 10),
                      ),
                    ]),
                    child: Image(
                      width: size.w*0.4,
                      image: AssetImage('assets/images/logo.png'),
                    )),

                //Search Bar
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                  child: TextField(
                    onTapOutside: (event) => () {},
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      hintStyle: TextStyle(fontFamily: "Bebas",fontSize: size.text*0.9),
                      fillColor: Colors.white,
                      filled: true,
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        //Categoires
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5, left: 20),
          child: Text(
            "categories:",
            style: TextStyle(
                fontSize: size.text*1.1, fontFamily: 'Bebas', color: myColors.secondary_color),
          ),
        ),

        // //List of Categories
        // Container(
        //   height: 100,
        //   child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: instance_homescreen_provider.list_categories.length,
        //     itemBuilder: (context, index) {
        //       return Padding(
        //         padding: const EdgeInsets.all(5.0),
        //         child: InkWell(
        //           onTap: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (context) => prod_cate(
        //                     name: instance_homescreen_provider.list_categories[index]['name'],
        //                     allItems: instance_prod_cate_provider.allItems,
        //                     index: index,
        //                   ),
        //                 ));
        //           },
        //           child: Container(
        //             width: 70,
        //             height: 70,
        //             decoration: BoxDecoration(
        //                 boxShadow: [
        //                   BoxShadow(
        //                       color: Color(0xff7D7D7D),
        //                       spreadRadius: -5,
        //                       blurRadius: 4,
        //                       offset: Offset(-10, 5)),
        //                 ],
        //                 borderRadius: BorderRadius.circular(30),
        //                 color: myColors.primary_color),
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Image(
        //                     width: 40,
        //                     height: 40,
        //                     image: AssetImage(instance_homescreen_provider.list_categories[index]["image"])),
        //                 Text(
        //                   instance_homescreen_provider.list_categories[index]['name'],
        //                   style: TextStyle(fontFamily: "Bebas", fontSize: 15),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ),


        // List of Categories from Firestore
        Container(
          height: size.h*0.1,
          child: FutureBuilder<QuerySnapshot>(
            future: _firestore.collection('allitems').get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.hasData) {
                final allitems = snapshot.data!.docs;

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: allitems.length,
                  itemBuilder: (context, index) {
                    final item = allitems[index].data() as Map<String, dynamic>;

                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => prod_cate(
                                name: item['name'],
                                index: index,

                                //before FB
                                //allItems: instance_prod_cate_provider.allItems,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: size.w*0.17,
                          height: size.h*0.17,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff7D7D7D),
                                  spreadRadius: -5,
                                  blurRadius: 4,
                                  offset: Offset(-10, 5)),
                            ],
                            borderRadius: BorderRadius.circular(30),
                            color: myColors.primary_color,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                item['image_url'],
                                width: size.w*0.4,
                                height: size.h*0.04,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.error),
                              ),
                              Text(
                                item['name'],
                                style: TextStyle(fontFamily: "Bebas", fontSize: size.text*0.7),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }

              return Text("No categories available");
            },
          ),
        ),

        //Popular Items
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5, left: 20),
          child: Text(
            "Popular Items:",
            style: TextStyle(
                fontSize: size.text*1.1, fontFamily: 'Bebas', color: myColors.secondary_color),
          ),
        ),

        //Before FB
        // Expanded(
        //   child: Container(
        //     child: Consumer<class_prod_cate_provider>(builder: (context, vm, child) {
        //           List<Map<String, dynamic>> list = vm.getPopularItems();
        //       return GridView.builder(
        //         itemCount: list.length,
        //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //             mainAxisSpacing: 10, crossAxisSpacing: 5, crossAxisCount: 2),
        //         itemBuilder: (context, index) {
        //           //final product = poplular_items[index];
        //           //final isFavorite = instance_favourites.isFavourite(product);
        //           return Center(
        //             child: GestureDetector(
        //               onTap: () {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                       builder: (context) => product_description(
        //                         name : list[index]['name'].toString(),
        //                         image : list[index]['image'].toString(),
        //                         description: list[index]['description'].toString(),
        //                         size: list[index]['size'].toString(),
        //                         price: list[index]['price'].toString(),
        //                       ),
        //                     ));
        //               },
        //               child: Container(
        //                 width: 170,
        //                 height: 250,
        //                 decoration: BoxDecoration(
        //                     color: Colors.white,
        //                     borderRadius: BorderRadius.circular(22),
        //                     boxShadow: [
        //                       BoxShadow(
        //                         color: myColors.textSecondary,
        //                         spreadRadius: 2,
        //                         blurRadius: 2,
        //                         offset: Offset(0, 5),
        //                       ),
        //                     ]),
        //                 child: Column(
        //                   children: [
        //                     //Image
        //                     Image(
        //                       image: AssetImage(list[index]['image']),
        //                       width: 150,
        //                       height: 100,
        //                     ),
        //
        //                     //Name
        //                     Text(
        //                       list[index]['name'],
        //                       style: TextStyle(
        //                         fontFamily: "Bebas",
        //                         fontSize: 22,
        //                         fontWeight: FontWeight.bold,
        //                       ),
        //                     ),
        //
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                       children: [
        //                         Column(
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           children: [
        //                             Text(
        //                               list[index]['size'],
        //                               style: TextStyle(
        //                                   fontFamily: "Bebas",
        //                                   color: myColors.textSecondary,
        //                                   fontSize: 18),
        //                             ),
        //                             Text(
        //                               "Rs " + list[index]['price'],
        //                               style: TextStyle(
        //                                   fontSize: 18, fontFamily: "Bebas"),
        //                             ),
        //                           ],
        //                         ),
        //                         Consumer<class_fav_provider>(
        //                           builder: (context, vm, child) {
        //                             return InkWell(
        //                               onTap: () {
        //                                 // instance_favourites.toggleFavourite(poplular_items[index]);
        //                                 vm.favourites.contains(list[index])
        //                                     ? vm.remove_fav_item(list[index])
        //                                     : vm.add_fav_item(list[index]);
        //                               },
        //                               child:
        //                               vm.favourites.contains(list[index])
        //                                   ? Icon(
        //                                 Icons.favorite,
        //                                 color: Colors.red,
        //                               )
        //                                   : Icon(Icons.favorite_outline),
        //                             );
        //                             // IconButton(
        //                             //   icon:
        //                             //   vm.favourites.contains(poplular_items[index])
        //                             //       ? Icon(
        //                             //     Icons.favorite,
        //                             //     color: Colors.red,
        //                             //   )
        //                             //       : Icon(Icons.favorite_border),
        //                             //   onPressed: () {
        //                             //     instance_favourites
        //                             //         .toggleFavourite(product);
        //                             //   },
        //                             // );
        //                           },
        //                         ),
        //                       ],
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           );
        //         },
        //       );
        //     },
        //
        //     ),
        //   ),
        // ),

        //After FB
        Expanded(
          child: Container(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: instance_prod_cate_provider
                  .fetchPopularItemsFromFirebase(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No popular items found."));
                }

                List<Map<String, dynamic>> list = snapshot.data!;

                return GridView.builder(
                  itemCount: list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10, crossAxisSpacing: 5, crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => product_description(
                                name: list[index]['name'].toString(),
                                image: list[index]['image_url'].toString(),
                                description: list[index]['description'].toString(),
                                size: list[index]['size'].toString(),
                                price: list[index]['price'].toString(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: size.w*0.4,
                          //height: 250,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: myColors.textSecondary,
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              // Image
                              Image.network(
                                list[index]['image_url'],
                                width: size.w*0.5,
                                height: size.h*0.12,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.error),
                              ),
                              // Name
                              Text(
                                list[index]['name'],
                                style: TextStyle(
                                  fontFamily: "Bebas",
                                  fontSize: size.text*1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        list[index]['size'],
                                        style: TextStyle(
                                            fontFamily: "Bebas",
                                            color: myColors.textSecondary,
                                            fontSize: size.text*0.8),
                                      ),
                                      Text(
                                        "Rs ${list[index]['price']+"/-"}",
                                        style: TextStyle(
                                            fontSize: size.text*0.8, fontFamily: "Bebas"),
                                      ),
                                    ],
                                  ),
                          Consumer<class_fav_provider>(
                            builder: (context, vm, child) {
                              return InkWell(
                                onTap: () {
                                  String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
                                  if (userId.isNotEmpty) {
                                    vm.favourites.contains(list[index])
                                        ? vm.remove_fav_item(userId, list[index])
                                        : vm.add_fav_item(userId, list[index]);
                                  }
                                },
                                child: vm.favourites.contains(list[index])
                                    ? Icon(Icons.favorite, color: Colors.red)
                                    : Icon(Icons.favorite_outline),
                              );
                            },
                          ),

                          ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),

      ]),
    );
  }
}
