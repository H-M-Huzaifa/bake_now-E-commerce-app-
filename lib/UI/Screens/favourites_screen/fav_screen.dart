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
    final instance_favourite_provider = Provider.of<class_fav_provider>(
        context);

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
                return InkWell(
                onTap: (){
                instance_favourite_provider.favourites.contains(instance_favourite_provider.arr_items[index]['name']) ? instance_favourite_provider.remove_fav_item(instance_favourite_provider.arr_items[index]['name']) : instance_favourite_provider.add_fav_item(instance_favourite_provider.arr_items[index]['name']);
                },
                child: Consumer<class_fav_provider>(
                builder: (context, vm, child) {
                return ListTile(
                leading: Image(image: AssetImage(vm.arr_items[index]['image']),),
                trailing:vm.favourites.contains(index) ? Icon(Icons.favorite,color: Colors.red,) :Icon(Icons.favorite_outline),
                title:Text(vm.arr_items[index]['name']),
                subtitle: Text(vm.arr_items[index]['price']),
                );
                }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
