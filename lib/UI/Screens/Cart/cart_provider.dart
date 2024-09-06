import 'package:flutter/material.dart';

class class_cart_provider with ChangeNotifier{

  List<Map<String, dynamic>> _cart_items=[];
  List<Map<String, dynamic>> get cart_items=> _cart_items;

  void add_cart_item(Map<String,dynamic> item){
    _cart_items.add(item);
    notifyListeners();
  }

  void remove_cart_item(Map<String,dynamic> item){
    _cart_items.remove(item);
    notifyListeners();
  }
}