import 'package:bake_now/UI/Screens/Bottom_nav_bar/nav_bar.dart';
import 'package:bake_now/UI/Screens/Cart/Cart_screen.dart';
import 'package:bake_now/UI/Screens/Cart/cart_provider.dart';
import 'package:bake_now/UI/Screens/Checkout_Screen/Checkout.dart';
import 'package:bake_now/UI/Screens/Product_Description_Screen/product_description.dart';
import 'package:bake_now/UI/Screens/Product_Description_Screen/product_description_provider.dart';
import 'package:bake_now/UI/Screens/Product_categories/product_category_provider.dart';
import 'package:bake_now/UI/Screens/favourites_screen/fav_provider.dart';
import 'package:bake_now/UI/Screens/favourites_screen/fav_screen.dart';
import 'package:bake_now/UI/Screens/home_screen/home_screen.dart';
import 'package:bake_now/UI/Screens/home_screen/home_screen_provider.dart';
import 'package:bake_now/UI/Screens/sign_in&up/signin.dart';
import 'package:bake_now/UI/Screens/sign_in&up/signin_provider.dart';
import 'package:bake_now/UI/Screens/sign_in&up/signup.dart';
import 'package:bake_now/UI/Screens/sign_in&up/signup_provider.dart';
import 'package:bake_now/UI/Screens/splash_screen/splash_screen.dart';
import 'package:bake_now/UI/Screens/user_profile_screen/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'services/firebase_options.dart';

void main()async{

  //lock screen oreintation
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => class_fav_provider()),
          ChangeNotifierProvider(create: (_) => class_homescreen_provider()),
          ChangeNotifierProvider(create: (_) => class_cart_provider()),
          ChangeNotifierProvider(create: (_) => class_prod_cate_provider()),
          ChangeNotifierProvider(create: (_) => class_prod_desc()),
          ChangeNotifierProvider(create: (_) => class_sign_up_provider()),
          ChangeNotifierProvider(create: (_) => class_sign_in_provider()),

        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bake Now',
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
