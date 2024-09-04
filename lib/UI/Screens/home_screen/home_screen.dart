import 'package:bake_now/UI/Screens/Bottom_nav_bar/nav_bar.dart';
import 'package:bake_now/UI/Screens/Cart/Cart.dart';
import 'package:bake_now/UI/Screens/Product_Description_Screen/product_description.dart';
import 'package:bake_now/UI/Screens/Product_categories/prod_cate.dart';
import 'package:bake_now/UI/Screens/favourites_screen/fav_provider.dart';
import 'package:bake_now/UI/Screens/user_profile_screen/user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {


  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> arr_categories = [
      {"name": "Sweets", "image": "assets/icons/ladu.png"},
      {"name": "Cookies", "image": "assets/icons/cookie.png"},
      {"name": "Cakes", "image": "assets/icons/cake.png"},
      {"name": "Pastries", "image": "assets/icons/pastry.png"},
      {"name": "Snacks", "image": "assets/icons/samosa.png"},
      {"name": "Fast Food", "image": "assets/icons/fast-food.png"},
    ];
    List<Map<String, dynamic>> arr_items = [
      {
        "image": "assets/images/cake.png",
        "name": "Chocolate Fudge",
        "size": "3 Pound",
        "price": "1750/-"
      },
      {
        "image": "assets/images/cake2.png",
        "name": "Strawberella",
        "size": "2.5 Pound",
        "price": "1250/-"
      },
      {
        "image": "assets/images/cake3.png",
        "name": "Velvet Dream",
        "size": "5 Pound",
        "price": "4350/-"
      },
      {
        "image": "assets/images/cake4.png",
        "name": "Oreolicious",
        "size": "2 Pound",
        "price": "1100/-"
      },
      {
        "image": "assets/images/cake5.png",
        "name": "Chocolava",
        "size": "2.5 Pound",
        "price": "1500/-"
      },
      {
        "image": "assets/images/cake6.png",
        "name": "Marry Berry",
        "size": "8.7 Pound",
        "price": "11,200/-"
      },
      {
        "image": "assets/images/cake7.png",
        "name": "Dreamland",
        "size": "5 Pound",
        "price": "3350/-"
      },
      {
        "image": "assets/images/cake8.png",
        "name": "Bubble Gummers",
        "size": "6.5 Pound",
        "price": "7700/-"
      },
    ];
    return Scaffold(
      backgroundColor: Color(0xffFFF7DE),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //app bar
        Container(
          width: double.infinity,
          height: 310,
          decoration: const BoxDecoration(
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => user_profile(),
                            ));
                      },
                      child: CircleAvatar(
                        maxRadius: 15,
                        backgroundImage: AssetImage('assets/images/boy.jpg'),
                      ),
                    ),
                    Text(
                      "Home",
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
                      child: Icon(
                        Icons.shopping_bag,
                        color: Color(0xff8D3F00),
                        size: 25,
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
                      width: 170,
                      height: 170,
                      image: AssetImage('assets/images/logo.png'),
                    )),

                //Search Bar
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                  child: TextField(
                    onTapOutside: (event) => () {},
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: "search",
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
                fontSize: 25, fontFamily: 'Bebas', color: Color(0xff8D3F00)),
          ),
        ),

        //List of Categories
        Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: arr_categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => prod_cate(),
                        ));
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff7D7D7D),
                              spreadRadius: -5,
                              blurRadius: 4,
                              offset: Offset(-10, 5)),
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xffFFC107)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            width: 40,
                            height: 40,
                            image: AssetImage(arr_categories[index]["image"])),
                        Text(
                          arr_categories[index]['name'],
                          style: TextStyle(fontFamily: "Bebas", fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        //Popular Items
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5, left: 20),
          child: Text(
            "Popular Items:",
            style: TextStyle(
                fontSize: 25, fontFamily: 'Bebas', color: Color(0xff8D3F00)),
          ),
        ),

        Expanded(
          child: Container(
            child: GridView.builder(
              itemCount: arr_items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10, crossAxisSpacing: 5, crossAxisCount: 2),
              itemBuilder: (context, index) {
                //final product = arr_items[index];
                //final isFavorite = instance_favourites.isFavourite(product);
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => product_description(),
                          ));
                    },
                    child: Container(
                      width: 170,
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 5),
                            ),
                          ]),
                      child: Column(
                        children: [
                          //Image
                          Image(
                            image: AssetImage(arr_items[index]['image']),
                            width: 150,
                            height: 100,
                          ),

                          //Name
                          Text(
                            arr_items[index]['name'],
                            style: TextStyle(
                              fontFamily: "Bebas",
                              fontSize: 22,
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
                                    arr_items[index]['size'],
                                    style: TextStyle(
                                        fontFamily: "Bebas",
                                        color: Colors.grey,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "Rs " + arr_items[index]['price'],
                                    style: TextStyle(
                                        fontSize: 18, fontFamily: "Bebas"),
                                  ),
                                ],
                              ),
                              Consumer<class_fav_provider>(
                                builder: (context, vm, child) {
                                  return InkWell(
                                    onTap: () {
                                      // instance_favourites.toggleFavourite(arr_items[index]);
                                      vm.favourites.contains(arr_items[index])
                                          ? vm.remove_fav_item(arr_items[index])
                                          : vm.add_fav_item(arr_items[index]);
                                    },
                                    child:
                                    vm.favourites.contains(arr_items[index])
                                        ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                        : Icon(Icons.favorite_outline),
                                  );
                                  // IconButton(
                                  //   icon:
                                  //   vm.favourites.contains(arr_items[index])
                                  //       ? Icon(
                                  //     Icons.favorite,
                                  //     color: Colors.red,
                                  //   )
                                  //       : Icon(Icons.favorite_border),
                                  //   onPressed: () {
                                  //     instance_favourites
                                  //         .toggleFavourite(product);
                                  //   },
                                  // );
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
            ),
          ),
        ),
      ]),
    );
  }
}
