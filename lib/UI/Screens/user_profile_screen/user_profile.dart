import 'package:bake_now/UI/Screens/Bottom_nav_bar/nav_bar.dart';
import 'package:bake_now/UI/Screens/sign_in&up/signin.dart';
import 'package:bake_now/UI/Screens/sign_in&up/signup_provider.dart';
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
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: Color(0xffFFF7DE),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => bottom_nav_bar(),
                                ));
                          },
                          child: Icon(
                              color: Color(0xff8D3F00),
                              Icons.arrow_back_ios_new))),
                  Text(
                    "My Profile",
                    style: TextStyle(
                        fontFamily: 'Bebas',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff8D3F00)),
                  ),
                  GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => signin(),
                          )));
                    },
                    child: Icon(
                      Icons.logout,
                      color: Color(0xff8D3F00),
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),

            //Profile Image
            Consumer<class_sign_up_provider>(builder: (context, vm, child) {
              return Stack(
                children:[
                  CircleAvatar(
                  maxRadius: 80,
                  backgroundImage: vm.imageUrl != null
                      ? NetworkImage(vm.imageUrl!) // Network image if available
                      : AssetImage('assets/images/avatar.png') as ImageProvider, // Default avatar image
                ),
                  Positioned(right: -10,bottom: 0,child: IconButton(onPressed: (){
                    vm.pickAndUploadImage();
                  },icon: Icon(Icons.edit),)),
                ]
              );

            },
            ),

            //Text Fields
            Container(
              child: Column(
                children: [
                  //name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    child: TextField(
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
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),

                  //email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    child: TextField(
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
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),

                  //Address
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    child: TextField(
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
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),

                  //Phone
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    child: TextField(
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
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),

                  //Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    child: TextField(
                      obscureText: true,
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
                            BorderSide(width: 2, color: Color(0xffFFC107)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                          prefixIcon: Icon(
                            Icons.drive_file_rename_outline,
                            color: Color(0xffFFC107),
                          ),
                          suffixIcon: Icon(Icons.edit),
                          hintText: '(0-9)(A-Z)(a-z)(alphanumeric)',
                          hintStyle: TextStyle(color: Colors.grey),
                          labelText: 'Password',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  //Confirm Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    child: TextField(
                      obscureText: true,
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
                            BorderSide(width: 2, color: Color(0xffFFC107)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),

                          hintStyle: TextStyle(color: Colors.grey),
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),

            //Save
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
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
          ],
        ),
      ),
    );
  }
}
