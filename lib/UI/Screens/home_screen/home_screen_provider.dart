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
  List<Map<String, dynamic>> _list_items = [
    {
      "image": "assets/images/cake.png",
      "name": "Chocolate Fudge",
      "size": "3 Pound",
      "price": "1750/-",
      "description" : "Indulge in our rich, velvety chocolate cake, loaded with decadent fudge and a deep, dark chocolate flavor that will leave you craving more"
    },
    {
      "image": "assets/images/cake2.png",
      "name": "Strawberella",
      "size": "2.5 Pound",
      "price": "1250/-",
      "description" : "Sweeten up your day with our Strawberella cake, bursting with fresh strawberries and a hint of whipped cream, perfect for warm weather treats."
    },
    {
      "image": "assets/images/cake3.png",
      "name": "Velvet Dream",
      "size": "5 Pound",
      "price": "4350/-",
    "description" : "Experience the luxury of our Velvet Dream cake, featuring a moist, fluffy texture and a subtle cocoa flavor, topped with a creamy velvet frosting."
    },
    {
      "image": "assets/images/cake4.png",
      "name": "Oreolicious",
      "size": "2 Pound",
      "price": "1100/-",
      "description" : "Get your cookie fix with our Oreolicious cake, a cream-filled chocolate sandwich cake inspired by the classic favorite, perfect for a nostalgic treat."
    },
    {
      "image": "assets/images/cake5.png",
      "name": "Chocolava",
      "size": "2.5 Pound",
      "price": "1500/-",
      "description" : "Go lava or go home! Our Chocolava cake oozes with warm, gooey chocolate sauce, providing the ultimate chocolate experience."
    },
    {
      "image": "assets/images/cake6.png",
      "name": "Marry Berry",
      "size": "8.7 Pound",
      "price": "11,200/-",
      "description" : "Celebrate with our Marry Berry cake, a fruitful and flavorful combination of sweet and tangy berries with a hint of lemon, perfect for springtime festivities."
    },
    {
      "image": "assets/images/cake7.png",
      "name": "Dreamland",
      "size": "5 Pound",
      "price": "3350/-",
      "description" : "Escape to our whimsical Dreamland cake, featuring a light and airy texture, topped with a fluffy meringue and a sprinkle of magic."
    },
    {
      "image": "assets/images/cake8.png",
      "name": "Bubble Gummers",
      "size": "6.5 Pound",
      "price": "7700/-",
      "description" : "Blast from the past! Our Bubble Gummmers cake captures the fun and playfulness of childhood, with a sweet and tangy bubblegum flavor that will leave you feeling like a kid again."
    },
  ];
  List<Map<String, dynamic>> get list_items => _list_items ;

}