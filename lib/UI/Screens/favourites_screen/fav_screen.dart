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
  @override
  Widget build(BuildContext context) {
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

          Consumer<class_fav_provider>(
            builder: (context, vm, child) {
              return Expanded(
                  child: ListView.builder(
                itemCount: vm.favourites.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image(
                      image: AssetImage(vm.favourites[index]['image']),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                      ),
                      onPressed: () {
                        vm.remove_fav_item(vm.favourites[index]);
                        //instance_favourite_provider.toggleFavourite(instance_favourite_provider.favourites[index]);
                      },
                    ),
                    title: Text(
                        vm.favourites[index]['name']),
                    subtitle: Text(
                        vm.favourites[index]['price']),
                  );
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
