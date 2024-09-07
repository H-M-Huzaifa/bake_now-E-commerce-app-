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
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
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
                // Check if favourites list is empty
                if (vm.favourites.isEmpty) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/brokenheart.png', // Replace with your image path
                          //width: 200,
                          //height: 200,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Oops! It seems like you haven't liked anything yet.  ",
                          style: TextStyle(
                            fontFamily: 'Bebas',
                            fontSize: 22,
                            color: Color(0xff8D3F00),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                // If there are items in the favourites
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
                          },
                        ),
                        title: Text(vm.favourites[index]['name']),
                        subtitle: Text(vm.favourites[index]['price']),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
