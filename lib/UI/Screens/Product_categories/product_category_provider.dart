import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class class_prod_cate_provider with ChangeNotifier {

  //Before Firebase
  // List<Map<String, List<Map<String, dynamic>>>> allItems = [
  //   {
  //     "Sweets": [
  //       {
  //         "image": "assets/images/sweet1.png",
  //         "name": "Gulab Jamun",
  //         "size": "1 Kg",
  //         "price": "600",
  //         "description": "Soft and spongy milk-solid dumplings soaked in rose-flavored sugar syrup, offering a sweet, traditional taste.",
  //         "isPopular" : true,
  //       },
  //       {
  //         "image": "assets/images/sweet2.png",
  //         "name": "Barfi",
  //         "size": "0.5 Kg",
  //         "price": "450",
  //         "description": "Delicious and rich milk-based fudge, available in various flavors like pistachio, almond, and coconut.",
  //         "isPopular" : false,
  //       },
  //       {
  //         "image": "assets/images/sweet3.png",
  //         "name": "Jalebi",
  //         "size": "1 Kg",
  //         "price": "500",
  //         "description": "Crispy, spiral-shaped sweets made from deep-fried dough and soaked in sugary syrup for a crunchy yet soft texture.",
  //         "isPopular" : false,
  //       }
  //     ]
  //   },
  //   {
  //     "Cookies": [
  //       {
  //         "image": "assets/images/cookie1.png",
  //         "name": "Choco Chip Cookie",
  //         "size": "12 pieces",
  //         "price": "350",
  //         "description": "Crispy on the outside and chewy on the inside, loaded with gooey chocolate chips for the ultimate indulgence.",
  //       "isPopular" : true,
  //       },
  //       {
  //         "image": "assets/images/cookie2.png",
  //         "name": "Oatmeal Raisin Cookie",
  //         "size": "10 pieces",
  //         "price": "300",
  //         "description": "A wholesome blend of oats and sweet raisins, offering a chewy texture and a perfect balance of sweetness.",
  //         "isPopular" : false
  //       },
  //       {
  //         "image": "assets/images/cookie3.png",
  //         "name": "Peanut Butter Cookie",
  //         "size": "8 pieces",
  //         "price": "280",
  //         "description": "Buttery and nutty, our peanut butter cookies are crumbly and delicious, with a melt-in-your-mouth texture.",
  //         "isPopular" : false
  //       }
  //     ]
  //   },
  //   {
  //     "Cakes": [
  //       {
  //         "image": "assets/images/cake.png",
  //         "name": "Chocolate Fudge",
  //         "size": "3 Pound",
  //         "price": "1750",
  //         "description": "Indulge in our rich, velvety chocolate cake, loaded with decadent fudge and a deep, dark chocolate flavor.",
  //         "isPopular" : false,
  //       },
  //       {
  //         "image": "assets/images/cake2.png",
  //         "name": "Strawberella",
  //         "size": "2.5 Pound",
  //         "price": "1250",
  //         "description": "Sweeten up your day with our Strawberella cake, bursting with fresh strawberries and a hint of whipped cream.",
  //         "isPopular" : true,
  //       },
  //       {
  //         "image": "assets/images/cake3.png",
  //         "name": "Velvet Dream",
  //         "size": "5 Pound",
  //         "price": "4350",
  //         "description": "Experience the luxury of our Velvet Dream cake, featuring a moist, fluffy texture, topped with creamy velvet frosting.",
  //         "isPopular" : false,
  //       }
  //     ]
  //   },
  //   {
  //     "Pastries": [
  //       {
  //         "image": "assets/images/pastry1.png",
  //         "name": "Chocolate Éclair",
  //         "size": "Single piece",
  //         "price": "150",
  //         "description": "A light pastry filled with rich chocolate cream and topped with a glossy chocolate glaze.",
  //         "isPopular" : false
  //       },
  //       {
  //         "image": "assets/images/pastry2.png",
  //         "name": "Vanilla Slice",
  //         "size": "Single piece",
  //         "price": "120",
  //         "description": "Layers of flaky pastry filled with smooth vanilla custard, topped with icing for a sweet finish.",
  //         "isPopular" : false
  //       },
  //       {
  //         "image": "assets/images/pastry3.png",
  //         "name": "Fruit Tart",
  //         "size": "Single piece",
  //         "price": "200",
  //         "description": "A buttery crust filled with creamy custard and topped with fresh seasonal fruits for a burst of flavor.",
  //         "isPopular" : true
  //       }
  //     ]
  //   },
  //   {
  //     "Snacks": [
  //       {
  //         "image": "assets/images/snack1.png",
  //         "name": "Samosa",
  //         "size": "6 pieces",
  //         "price": "250",
  //         "description": "Crispy, golden pastries filled with spiced potatoes and peas, perfect for a savory snack.",
  //         "isPopular" : false,
  //       },
  //       {
  //         "image": "assets/images/snack2.png",
  //         "name": "Pakora",
  //         "size": "500 grams",
  //         "price": "350",
  //         "description": "Deep-fried fritters made with gram flour and a mix of vegetables, offering a crunchy and spicy flavor.",
  //         "isPopular" : false,
  //       },
  //       {
  //         "image": "assets/images/snack3.png",
  //         "name": "Spring Rolls",
  //         "size": "8 pieces",
  //         "price": "400",
  //         "description": "Crispy rolls stuffed with vegetables and served with a side of tangy dipping sauce.",
  //         "isPopular" : true,
  //       }
  //     ]
  //   },
  //   {
  //     "Fast Food": [
  //       {
  //         "image": "assets/images/fastfood1.png",
  //         "name": "Cheeseburger",
  //         "size": "Single piece",
  //         "price": "500",
  //         "description": "A juicy beef patty topped with melted cheese, fresh lettuce, tomatoes, and special sauce in a toasted bun.",
  //         "isPopular" : true,
  //       },
  //       {
  //         "image": "assets/images/fastfood2.png",
  //         "name": "Pizza Slice",
  //         "size": "Single slice",
  //         "price": "250",
  //         "description": "A generous slice of pizza topped with mozzarella, pepperoni, and a savory tomato sauce.",
  //         "isPopular" : false,
  //       },
  //       {
  //         "image": "assets/images/fastfood3.png",
  //         "name": "Fried Chicken",
  //         "size": "2 pieces",
  //         "price": "300",
  //         "description": "Crispy and golden-fried chicken, seasoned to perfection for a flavorful crunch with each bite.",
  //         "isPopular" : true,
  //       }
  //     ]
  //   }
  // ];
  //
  //
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // // Function to extract popular items from allItems
  // List<Map<String, dynamic>> getPopularItems() {
  //   List<Map<String, dynamic>> popularItems = [];
  //
  //   for (var category in allItems) {
  //     List<Map<String, dynamic>> itemsInCategory = category.values.first;
  //
  //     // Filter items where isPopular is true
  //     popularItems.addAll(itemsInCategory.where((item) => item['isPopular'] == true));
  //   }
  //
  //   return popularItems;
  // }

  //After Firebase
  //Uploading data to FB
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> populatePopularItems() async {
    CollectionReference allItems = _firestore.collection('allitems');
    CollectionReference popularItems = _firestore.collection('popularItems');

    QuerySnapshot categoriesSnapshot = await allItems.get();

    for (var categoryDoc in categoriesSnapshot.docs) {
      // Access the items sub-collection
      CollectionReference items = allItems.doc(categoryDoc.id).collection('items');
      QuerySnapshot itemsSnapshot = await items.get();

      for (var itemDoc in itemsSnapshot.docs) {
        if (itemDoc['isPopular'] == true) {
          // Use the item name as the document ID (with category for uniqueness)
          String docId = '${itemDoc['name']}_${categoryDoc.id}';

          // Check if the item already exists in the popularItems collection
          DocumentSnapshot existingItem = await popularItems.doc(docId).get();

          // If the item doesn't exist, add it to the popularItems collection
          if (!existingItem.exists) {
            popularItems.doc(docId).set({
              'name': itemDoc['name'],
              'image_url': itemDoc['image_url'],
              'description': itemDoc['description'],
              'size': itemDoc['size'],
              'price': itemDoc['price'],
              'category': categoryDoc.id, // Store the category for reference
            });
          }
        }
      }
    }
  }


  // Function to fetch popular items from Firebase
  Future<List<Map<String, dynamic>>> fetchPopularItemsFromFirebase() async {
    QuerySnapshot snapshot = await _firestore.collection('popularItems').get();

    // Mapping the documents to a list of Maps
    return snapshot.docs.map((doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();
  }
}