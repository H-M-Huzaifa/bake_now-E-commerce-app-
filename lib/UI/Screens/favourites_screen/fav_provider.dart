import 'package:flutter/material.dart';

class class_fav_provider with ChangeNotifier{
  List<Map<dynamic, dynamic>> _arr_items = [
    {
      "image": "assets/images/cake.png",
      "name": "Chocolate Fudge",
      "size": "3 Pound",
      "price": "1750/-"
    },
    {
      "image": "assets/images/cake2.png",
      "name": "Strawberella",
      "size": "2.5 Pound",
      "price": "1250/-"
    },
    {
      "image": "assets/images/cake3.png",
      "name": "Velvet Dream",
      "size": "5 Pound",
      "price": "4350/-"
    },
    {
      "image": "assets/images/cake4.png",
      "name": "Oreolicious",
      "size": "2 Pound",
      "price": "1100/-"
    },
    {
      "image": "assets/images/cake5.png",
      "name": "Chocolava",
      "size": "2.5 Pound",
      "price": "1500/-"
    },
    {
      "image": "assets/images/cake6.png",
      "name": "Marry Berry",
      "size": "8.7 Pound",
      "price": "11,200/-"
    },
    {
      "image": "assets/images/cake7.png",
      "name": "Dreamland",
      "size": "5 Pound",
      "price": "3350/-"
    },
    {
      "image": "assets/images/cake8.png",
      "name": "Bubble Gummers",
      "size": "6.5 Pound",
      "price": "7700/-"
    },
  ];
  List<Map<dynamic, dynamic>> get arr_items => _arr_items;

  List<dynamic> _favourites=[];
  List<dynamic> get favourites=> _favourites;

  void add_fav_item(int value){
    _favourites.add(value);
    notifyListeners();
  }

  void remove_fav_item(int value){
    _favourites.remove(value);
    notifyListeners();
  }
}