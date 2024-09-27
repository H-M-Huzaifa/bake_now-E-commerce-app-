import 'package:bake_now/UI/Screens/Bottom_nav_bar/nav_bar.dart';
import 'package:bake_now/UI/Screens/Cart/cart_provider.dart';
import 'package:bake_now/UI/Screens/sign_in&up/signin.dart';
import 'package:bake_now/UI/Screens/sign_in&up/signup_provider.dart';
import 'package:bake_now/UI/Screens/user_profile_screen/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class user_profile extends StatefulWidget {
  const user_profile({super.key});

  @override
  State<user_profile> createState() => _user_profileState();
}

class _user_profileState extends State<user_profile> {
  @override
  void initState() {
    super.initState();

    // Fetch user data via provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<class_user_profile_provider>(context, listen: false)
          .fetchUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<class_cart_provider>(context);
    return Scaffold(
      backgroundColor: Color(0xffFFF7DE),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //app bar
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bottom_nav_bar(),
                          ));
                    },
                    child: Icon(
                        color: Color(0xff8D3F00), Icons.arrow_back_ios_new)),
                Text(
                  "My Profile",
                  style: TextStyle(
                      fontFamily: 'Bebas',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff8D3F00)),
                ),
                Consumer<class_sign_up_provider>(
                  builder: (context, vm, child) {
                    return GestureDetector(
                      onTap: () async {
                        vm.clearImageData();
                        await FirebaseAuth.instance.signOut().then((value) => {
                          cartProvider.clearCart(),
                        });

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => signin(),
                            ));
                      },
                      child: Icon(
                        Icons.logout,
                        color: Color(0xff8D3F00),
                        size: 25,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Profile Image
          Consumer<class_sign_up_provider>(builder: (context, vm, child) {
            return Stack(
              children: [
                CircleAvatar(
                  maxRadius: 80,
                  backgroundImage: vm.imageUrl != null
                      ? NetworkImage(
                          vm.imageUrl!) // Network image if available
                      : AssetImage('assets/images/avatar.png')
                          as ImageProvider, // Default avatar image
                ),
                Positioned(
                  right: -10,
                  bottom: 0,
                  child: IconButton(
                    onPressed: () async {
                      // Let the user pick a new image
                      await vm.pickImage();

                      // After picking the image, upload and save it to Firestore
                      if (vm.pickedImage != null) {
                        await vm.uploadImageAndSaveToFirestore();
                      }
                    },
                    icon: Icon(Icons.edit),
                  ),
                ),
              ],
            );
          }),

          //Text Fields
          Consumer<class_user_profile_provider>(
            builder: (context, vm, child) {
              return Container(
                child: Column(
                  children: [
                    //name
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextField(
                        controller: vm.nameController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xff8D3F00),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.green),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                            suffixIcon: Icon(Icons.edit),
                            prefixIcon: Icon(
                              Icons.drive_file_rename_outline,
                              color: Color(0xffFFC107),
                            ),
                            hintText: 'Daniel Ritchie',
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: 'Name',
                            labelStyle:
                                TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),

                    //email
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextField(
                        controller: vm.emailController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xff8D3F00),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.green),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                            suffixIcon: Icon(Icons.edit),
                            prefixIcon: Icon(
                              Icons.alternate_email,
                              color: Color(0xffFFC107),
                            ),
                            hintText: 'abc123@xyz.com',
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: 'Email',
                            labelStyle:
                                TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),

                    //Address
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextField(
                        controller: vm.addressController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xff8D3F00),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.green),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                            suffixIcon: Icon(Icons.edit),
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: Color(0xffFFC107),
                            ),
                            hintText: 'Anywhere North St 123',
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: 'Address',
                            labelStyle:
                                TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),

                    //Phone
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextField(
                        controller: vm.contactController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xff8D3F00),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.green),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                            suffixIcon: Icon(Icons.edit),
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: Color(0xffFFC107),
                            ),
                            hintText: '0321-1234567',
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: 'Contact Number',
                            labelStyle:
                                TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),

                    // //Password
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 30, vertical: 10),
                    //   child: TextField(
                    //     obscureText: true,
                    //     decoration: InputDecoration(
                    //         enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(11),
                    //           borderSide: BorderSide(
                    //             width: 1,
                    //             color: Color(0xff8D3F00),
                    //           ),
                    //         ),
                    //         focusedBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(11),
                    //           borderSide: BorderSide(
                    //               width: 2, color: Color(0xffFFC107)),
                    //         ),
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(11),
                    //         ),
                    //         prefixIcon: Icon(
                    //           Icons.drive_file_rename_outline,
                    //           color: Color(0xffFFC107),
                    //         ),
                    //         suffixIcon: Icon(Icons.edit),
                    //         hintText: '(0-9)(A-Z)(a-z)(alphanumeric)',
                    //         hintStyle: TextStyle(color: Colors.grey),
                    //         labelText: 'Password',
                    //         labelStyle:
                    //             TextStyle(fontWeight: FontWeight.bold)),
                    //   ),
                    // ),
                    // //Confirm Password
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 30, vertical: 10),
                    //   child: TextField(
                    //     obscureText: true,
                    //     decoration: InputDecoration(
                    //         enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(11),
                    //           borderSide: BorderSide(
                    //             width: 1,
                    //             color: Color(0xff8D3F00),
                    //           ),
                    //         ),
                    //         focusedBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(11),
                    //           borderSide: BorderSide(
                    //               width: 2, color: Color(0xffFFC107)),
                    //         ),
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(11),
                    //         ),
                    //         hintStyle: TextStyle(color: Colors.grey),
                    //         labelText: 'Confirm Password',
                    //         labelStyle:
                    //             TextStyle(fontWeight: FontWeight.bold)),
                    //   ),
                    // ),
                  ],
                ),
              );
            },
          ),

          //Save
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () async {
                  // Save updated data to Firestore
                  await Provider.of<class_user_profile_provider>(context,
                          listen: false)
                      .updateUserData().then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 2),
                    backgroundColor: Color(0xff8D3F00),
                    content: Center(
                      child: Text(
                        "Profile Updated!",
                        style: TextStyle(fontSize: 20, fontFamily: 'Bebas'),
                      ),
                    ),
                  )));
                },
                child: Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff7D7D7D),
                          spreadRadius: -1,
                          blurRadius: 7,
                          offset: Offset(0, 10),
                        )
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xffFFC107),
                    ),
                    child: Center(
                        child: Text(
                      "Save",
                      style: TextStyle(
                          fontFamily: "Bebas",
                          fontSize: 25,
                          color: Color(0xff8D3F00)),
                    ))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
