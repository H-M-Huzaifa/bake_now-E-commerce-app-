import 'package:bake_now/UI/Screens/Bottom_nav_bar/nav_bar.dart';
import 'package:bake_now/UI/Screens/Cart/Cart_screen.dart';
import 'package:bake_now/UI/Screens/Product_Description_Screen/product_description.dart';
import 'package:bake_now/UI/Screens/favourites_screen/fav_provider.dart';
import 'package:bake_now/UI/Screens/favourites_screen/fav_screen.dart';
import 'package:bake_now/UI/Screens/home_screen/home_screen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class prod_cate extends StatefulWidget {
  int index;
  String name;
  List<Map<String, List<Map<String, dynamic>>>> allItems;

  prod_cate({
    super.key,
    required this.index,
  required this.name,
    required this.allItems,
  });

  @override
  State<prod_cate> createState() => _prod_cateState();
}

class _prod_cateState extends State<prod_cate> {
  late List<Map<String, dynamic>> list;

  @override
  void initState() {
    super.initState();
    list = widget.allItems[widget.index][widget.name]!;  // Access the specific map
  }

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
            padding: const EdgeInsets.only(top: 50),
            child: Row(
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
                GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => favourite_screen(),));},
                  child: Icon(
                    Icons.favorite_outline,
                    color: Color(0xff8D3F00),
                    size: 25,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              child: GridView.builder(
                itemCount: list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 30, crossAxisSpacing: 5, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  //final product = list_items[index];
                  //final isFavorite = instance_favourites.isFavourite(product);
                  return Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => product_description(
                                name : list[index]['name'].toString(),
                                image : list[index]['image'].toString(),
                                description: list[index]['description'].toString(),
                                size: list[index]['size'].toString(),
                                price: list[index]['price'].toString(),
                              ),
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
                              image: AssetImage(list[index]['image']),
                              width: 150,
                              height: 100,
                            ),

                            //Name
                            Text(
                              list[index]['name'],
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
                                      list[index]['size'],
                                      style: TextStyle(
                                          fontFamily: "Bebas",
                                          color: Colors.grey,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "Rs " + list[index]['price'],
                                      style: TextStyle(
                                          fontSize: 18, fontFamily: "Bebas"),
                                    ),
                                  ],
                                ),
                                Consumer<class_fav_provider>(
                                  builder: (context, vm, child) {
                                    return InkWell(
                                      onTap: () {
                                        // instance_favourites.toggleFavourite(list_items[index]);
                                        vm.favourites.contains(list[index])
                                            ? vm.remove_fav_item(list[index])
                                            : vm.add_fav_item(list[index]);
                                      },
                                      child:
                                      vm.favourites.contains(list[index])
                                          ? Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                          : Icon(Icons.favorite_outline),
                                    );
                                    // IconButton(
                                    //   icon:
                                    //   vm.favourites.contains(list_items[index])
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
        ],
      ),
    );
  }
}
