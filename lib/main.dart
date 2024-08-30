import 'package:bake_now/UI/Screens/Bottom_nav_bar/nav_bar.dart';
import 'package:bake_now/UI/Screens/Cart/Cart.dart';
import 'package:bake_now/UI/Screens/Checkout_Screen/Checkout.dart';
import 'package:bake_now/UI/Screens/Product_Description_Screen/product_description.dart';
import 'package:bake_now/UI/Screens/favourites_screen/fav_provider.dart';
import 'package:bake_now/UI/Screens/favourites_screen/fav_screen.dart';
import 'package:bake_now/UI/Screens/home_screen/home_screen.dart';
import 'package:bake_now/UI/Screens/sign_in&up/signin.dart';
import 'package:bake_now/UI/Screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'services/firebase_options.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=> class_fav_provider(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffFFC107)),
        useMaterial3: true,
      ),
      home: signin(),
    ));
  }
}

