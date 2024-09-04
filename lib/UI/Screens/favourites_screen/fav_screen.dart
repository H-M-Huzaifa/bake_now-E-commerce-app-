import 'package:bake_now/UI/Screens/favourites_screen/fav_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class favourite_screen extends StatefulWidget {
  const favourite_screen({super.key});

  @override
  State<favourite_screen> createState() => _favourite_screenState();
}

class _favourite_screenState extends State<favourite_screen> {
  // List<Map<String, dynamic>> arr_items = [
  //   {
  //     "image": "assets/images/cake.png",
  //     "name": "Chocolate Fudge",
  //     "size": "3 Pound",
  //     "price": "1750/-"
  //   },
  //   {
  //     "image": "assets/images/cake2.png",
  //     "name": "Strawberella",
  //     "size": "2.5 Pound",
  //     "price": "1250/-"
  //   },
  //   {
  //     "image": "assets/images/cake3.png",
  //     "name": "Velvet Dream",
  //     "size": "5 Pound",
  //     "price": "4350/-"
  //   },
  //   {
  //     "image": "assets/images/cake4.png",
  //     "name": "Oreolicious",
  //     "size": "2 Pound",
  //     "price": "1100/-"
  //   },
  //   {
  //     "image": "assets/images/cake5.png",
  //     "name": "Chocolava",
  //     "size": "2.5 Pound",
  //     "price": "1500/-"
  //   },
  //   {
  //     "image": "assets/images/cake6.png",
  //     "name": "Marry Berry",
  //     "size": "8.7 Pound",
  //     "price": "11,200/-"
  //   },
  //   {
  //     "image": "assets/images/cake7.png",
  //     "name": "Dreamland",
  //     "size": "5 Pound",
  //     "price": "3350/-"
  //   },
  //   {
  //     "image": "assets/images/cake8.png",
  //     "name": "Bubble Gummers",
  //     "size": "6.5 Pound",
  //     "price": "7700/-"
  //   },
  // ];

//List<Map<String, dynamic>> get arr_items => _arr_items;
  @override
  Widget build(BuildContext context) {
    final instance_favourite_provider =
        Provider.of<class_fav_provider>(context);

    return Scaffold(
      backgroundColor: Color(0xffFFF7DE),
      body: Column(
        children: [
          //app bar
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              "Favourites",
              style: TextStyle(
                  fontFamily: 'Bebas',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff8D3F00)),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: instance_favourite_provider.favourites.length,
              itemBuilder: (context, index) {
                final product = instance_favourite_provider.favourites[index];
                return
                  Consumer<class_fav_provider>(
                      builder: (context, vm, child) {
                    return ListTile(
                      leading: Image(
                        image: AssetImage(vm.favourites[index]['image']),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete,),
                        onPressed: () {
                          instance_favourite_provider.toggleFavourite(product);
                        },
                      ),
                      title: Text(instance_favourite_provider.favourites[index]
                          ['name']),
                      subtitle: Text(instance_favourite_provider
                          .favourites[index]['price']),
                    );
                  });
              },
            ),
          ),
        ],
      ),
    );
  }
}
