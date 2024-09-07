import 'package:flutter/material.dart';

class class_homescreen_provider with ChangeNotifier{
  List<Map<String, dynamic>> _list_categories = [
    {"name": "Sweets", "image": "assets/icons/ladu.png"},
    {"name": "Cookies", "image": "assets/icons/cookie.png"},
    {"name": "Cakes", "image": "assets/icons/cake.png"},
    {"name": "Pastries", "image": "assets/icons/pastry.png"},
    {"name": "Snacks", "image": "assets/icons/samosa.png"},
    {"name": "Fast Food", "image": "assets/icons/fast-food.png"},
  ];
  List<Map<String, dynamic>> get list_categories => _list_categories ;

  //Popular Items
  List<Map<String, dynamic>> _poplular_items = [
    {
      "image": "assets/images/cake.png",
      "name": "Chocolate Fudge",
      "size": "3 Pound",
      "price": "1750/-",
      "description" : "Indulge in our rich, velvety chocolate cake, loaded with decadent fudge and a deep, dark chocolate flavor that will leave you craving more"
    },
    {
      "image": "assets/images/pastry2.png",
      "name": "Vanilla Slice",
      "size": "Single Slice",
      "price": "120/-",
      "description" : "Layers of flaky pastry filled with smooth vanilla custard, topped with icing for a sweet finish."
    },
    {
      "image": "assets/images/sweet2.png",
      "name": "Barfi",
      "size": "0.5 KG",
      "price": "450/-",
    "description" : "Delicious and rich milk-based fudge, available in various flavors like pistachio, almond, and coconut."
    },
    {
      "image": "assets/images/fastfood1.png",
      "name": "Cheeseburger",
      "size": "Single piece",
      "price": "500/-",
      "description": "A juicy beef patty topped with melted cheese, fresh lettuce, tomatoes, and special sauce in a toasted bun."
    },
    {
      "image": "assets/images/snack2.png",
      "name": "Pakora",
      "size": "500 grams",
      "price": "350/-",
      "description": "Deep-fried fritters made with gram flour and a mix of vegetables, offering a crunchy and spicy flavor."
    },
    {
      "image": "assets/images/fastfood2.png",
      "name": "Pizza Slice",
      "size": "Single slice",
      "price": "250/-",
      "description": "A generous slice of pizza topped with mozzarella, pepperoni, and a savory tomato sauce."
    },
    {
      "image": "assets/images/cake7.png",
      "name": "Dreamland",
      "size": "5 Pound",
      "price": "3350/-",
      "description" : "Escape to our whimsical Dreamland cake, featuring a light and airy texture, topped with a fluffy meringue and a sprinkle of magic."
    },
    {
      "image": "assets/images/sweet1.png",
      "name": "Gulab Jamun",
      "size": "1 Kg",
      "price": "600/-",
      "description": "Soft and spongy milk-solid dumplings soaked in rose-flavored sugar syrup, offering a sweet, traditional taste."
    },
  ];
  List<Map<String, dynamic>> get poplular_items => _poplular_items ;

}