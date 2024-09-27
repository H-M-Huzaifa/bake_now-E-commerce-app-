import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class class_fav_provider with ChangeNotifier {
  List<Map<String, dynamic>> _favourites = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> get favourites => _favourites;

  // Fetch user favorites from Firestore
  Future<void> fetchUserFavorites(String userId) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('userFavorites').doc(userId).get();

      if (userDoc.exists && userDoc.data() != null) {
        _favourites = List<Map<String, dynamic>>.from(userDoc['favorites']);
      } else {
        _favourites = [];
      }
      notifyListeners();
    } catch (e) {
      print('Error fetching user favorites: $e');
    }
  }

  // Add favorite item to Firestore
  Future<void> add_fav_item(String userId, Map<String, dynamic> item) async {
    _favourites.add(item);
    await _updateUserFavoritesInFirestore(userId);
    notifyListeners();
  }

  // Remove favorite item from Firestore
  Future<void> remove_fav_item(String userId, Map<String, dynamic> item) async {
    _favourites.removeWhere((fav) => fav['name'] == item['name']);  // Assuming 'name' is unique
    await _updateUserFavoritesInFirestore(userId);
    notifyListeners();
  }

  // Private method to update the Firestore document for the user's favorites
  Future<void> _updateUserFavoritesInFirestore(String userId) async {
    try {
      await _firestore.collection('userFavorites').doc(userId).set({
        'favorites': _favourites,
      });
    } catch (e) {
      print('Error updating user favorites in Firestore: $e');
    }
  }
}


//static favourite code before firebase
// class class_fav_provider with ChangeNotifier {
//   List<Map<String, dynamic>> _arr_items = [
//     {
//       "image": "assets/images/cake.png",
//       "name": "Chocolate Fudge",
//       "size": "3 Pound",
//       "price": "1750/-"
//     },
//     {
//       "image": "assets/images/cake2.png",
//       "name": "Strawberella",
//       "size": "2.5 Pound",
//       "price": "1250/-"
//     },
//     {
//       "image": "assets/images/cake3.png",
//       "name": "Velvet Dream",
//       "size": "5 Pound",
//       "price": "4350/-"
//     },
//     {
//       "image": "assets/images/cake4.png",
//       "name": "Oreolicious",
//       "size": "2 Pound",
//       "price": "1100/-"
//     },
//     {
//       "image": "assets/images/cake5.png",
//       "name": "Chocolava",
//       "size": "2.5 Pound",
//       "price": "1500/-"
//     },
//     {
//       "image": "assets/images/cake6.png",
//       "name": "Marry Berry",
//       "size": "8.7 Pound",
//       "price": "11,200/-"
//     },
//     {
//       "image": "assets/images/cake7.png",
//       "name": "Dreamland",
//       "size": "5 Pound",
//       "price": "3350/-"
//     },
//     {
//       "image": "assets/images/cake8.png",
//       "name": "Bubble Gummers",
//       "size": "6.5 Pound",
//       "price": "7700/-"
//     },
//   ];
//   List<Map<String, dynamic>> get arr_items => _arr_items;
//
//   List<Map<String, dynamic>> _favourites = [];
//   List<Map<String, dynamic>> get favourites => _favourites;
//
// void add_fav_item(Map<String,dynamic> item){
//   _favourites.add(item);
//   notifyListeners();
// }
//
// void remove_fav_item(Map<String,dynamic> item){
//   _favourites.remove(item);
//   notifyListeners();
// }
//
// }






//old logic for favoutire button
// void toggleFavourite(Map<String, dynamic> product) {
//   if (_favourites.contains(product)) {
//     _favourites.remove(product);
//   } else {
//     _favourites.add(product);
//   }
//   notifyListeners();
// }

//bool isFavourite(Map<String, dynamic> product) {
// return _favourites.contains(product);
