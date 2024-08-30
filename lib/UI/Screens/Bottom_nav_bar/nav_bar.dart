import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:bake_now/UI/Screens/favourites_screen/fav_screen.dart';
import 'package:bake_now/UI/Screens/home_screen/home_screen.dart';
import 'package:bake_now/UI/Screens/order_history_screen/order_history.dart';
import 'package:bake_now/UI/Screens/user_profile_screen/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';

class bottom_nav_bar extends StatefulWidget {
  const bottom_nav_bar({super.key});

  @override
  State<bottom_nav_bar> createState() => _bottom_nav_barState();
}

class _bottom_nav_barState extends State<bottom_nav_bar> {

  List<Widget> Screens=[
    home_screen(),
  favourite_screen(),
    user_profile(),
    order_history(),
  ];

  int selectedstate=0;

  List<TabItem> items = [
    TabItem(
      icon: Icons.home,
      title: 'Home',
    ),
    TabItem(
      icon: Icons.favorite_border,
      title: 'Favourite',
    ),
    TabItem(
      icon: Icons.account_box,
      title: 'Profile',
    ),
    TabItem(
      icon: Icons.history,
      title: 'History',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Image(
              width: 40,
              height: 40,
              image: AssetImage('assets/icons/chat.png')),
          backgroundColor: Color(0xffFFC107),
          onPressed: () {}),
      body: Screens[selectedstate],
      bottomNavigationBar: BottomBarInspiredOutside(
        items: items,
        backgroundColor: Color(0xffefc332),
        color: Colors.black,
        colorSelected: Colors.white,
        indexSelected: selectedstate,
        onTap: (index) => setState(() {
          selectedstate = index;
        }),
        chipStyle:const ChipStyle(color: Colors.red,background: Color(0xffbb5900),convexBridge: false
          ,notchSmoothness: NotchSmoothness.sharpEdge,),
        itemStyle: ItemStyle.circle,isAnimated: true,
        animated: true,
      ),

    );
  }
}
