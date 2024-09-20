import 'dart:io';

import 'package:bake_now/UI/Screens/sign_in&up/signin.dart';
import 'package:bake_now/UI/Screens/sign_in&up/signup_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  //Image Picker
  //String imageURL='';

  //Form validation
  final _formkey = GlobalKey<FormState>();

  //for authentication module
  FirebaseAuth auth = FirebaseAuth.instance;

  //for database module
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //for accessing currect user
  User? currentuser=FirebaseAuth.instance.currentUser;

  //for showing indicator in create accountbutton while loading
  bool _isloading =false;


  //Text Field Controllers
  TextEditingController name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();
  TextEditingController contact_controller = TextEditingController();
  TextEditingController Password_controller = TextEditingController();
  TextEditingController confirmPass_controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name_controller.dispose();
    email_controller.dispose();
    address_controller.dispose();
    contact_controller.dispose();
    Password_controller.dispose();
    confirmPass_controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF7DE),
      body: SingleChildScrollView(
        child: Consumer<class_sign_up_provider>(
          builder: (context, vm, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // App bar
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    "Signup",
                    style: TextStyle(
                      fontFamily: 'Bebas',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff8D3F00),
                    ),
                  ),
                ),

                // Profile Image
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: vm.imageUrl != null
                      ? ClipOval(
                    child: Image.network(
                      vm.imageUrl!,
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
                  )
                      : ClipOval(
                    child: Image.asset(
                      'assets/images/avatar.png', // Default avatar image
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),

                // Button to pick and upload image
                Center(
                  child: IconButton(
                    onPressed: () async {
                      // This will trigger image picking and uploading in the provider
                      await vm.pickAndUploadImage();
                      // The UI will automatically update because notifyListeners() is called in the provider
                    },
                    icon: Icon(Icons.edit),
                  ),
                ),

              //Text Fields
              Container(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      //name
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            } else {
                              return null;
                            }
                          },
                          controller: name_controller,
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
                                color: Color(0xff8D3F00),
                              ),
                              hintText: 'Daniel Ritchie',
                              hintStyle: TextStyle(color: Colors.grey),
                              labelText: 'Name',
                              labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),

                      //Email
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            } else {
                              return null;
                            }
                          },
                          controller: email_controller,
                          keyboardType: TextInputType.emailAddress,
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
                                Icons.alternate_email,
                                color: Color(0xff8D3F00),
                              ),
                              hintText: 'abc123@xyz.com',
                              hintStyle: TextStyle(color: Colors.grey),
                              labelText: 'Email',
                              labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),

                      //Address
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Address";
                            } else {
                              return null;
                            }
                          },
                          controller: address_controller,
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
                                Icons.location_on,
                                color: Color(0xff8D3F00),
                              ),
                              hintText: 'Anywhere North St 123',
                              hintStyle: TextStyle(color: Colors.grey),
                              labelText: 'Address',
                              labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),

                      //Phone
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Contact Number";
                            } else {
                              return null;
                            }
                          },
                          controller: contact_controller,
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
                                BorderSide(width: 2, color: Color(0xffFFC107)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                              ),
                              prefixIcon: Icon(
                                Icons.phone_android,
                                color: Color(0xff8D3F00),
                              ),
                              hintText: '0321-1234567',
                              hintStyle: TextStyle(color: Colors.grey),
                              labelText: 'Contact Number',
                              labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),

                      //Password
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Password";
                            } else {
                              return null;
                            }
                          },
                          controller: Password_controller,
                          obscureText: !vm.isPasswordVisible,
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
                                Icons.lock,
                                color: Color(0xff8D3F00),
                              ),
                              suffixIconColor: Color(0xffFFC107),
                              suffixIcon: IconButton(
                                icon: Icon(vm.isPasswordVisible ? Icons.visibility:
                                Icons.visibility_off),
                                onPressed: (){
                                  vm.togglePasswordVisibility();
                                },),
                              hintText: '(0-9)(A-Z)(a-z)(alphanumeric)',
                              hintStyle: TextStyle(color: Colors.grey),
                              labelText: 'Password',
                              labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),

                      //Confirm Password
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Confirm Password";
                            } else {
                              return null;
                            }
                          },
                          controller: confirmPass_controller,
                          obscureText: !vm.isConfirmPasswordVisible,
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
                              // prefixIcon: Icon(
                              //   Icons.drive_file_rename_outline,
                              //   color: Color(0xff8D3F00),
                              // ),
                              suffixIconColor: Color(0xffFFC107),
                              suffixIcon:
                              IconButton(
                                icon: Icon(vm.isConfirmPasswordVisible ? Icons.visibility:
                                Icons.visibility_off),
                                onPressed: (){
                                  vm.toggleConfirmPasswordVisibility();
                                },),

                              hintStyle: TextStyle(color: Colors.grey),
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //or login with
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                    child: Text(
                      "or Signup with",
                      style: TextStyle(color: Colors.grey),
                    )),
              ),

              //Services Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //google
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Center(
                          child: Image(
                              width: 25,
                              height: 25,
                              image: AssetImage('assets/icons/google.png'))),
                    ),
                  ),

                  //facebook
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Center(
                          child: Image(
                              width: 25,
                              height: 25,
                              image:
                              AssetImage('assets/icons/facebook.png'))),
                    ),
                  ),
                ],
              ),

              //Create Account
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () async {

                      // First, validate the form
                      if (_formkey.currentState!.validate()) {

                        // Now, check if passwords match
                        if (confirmPass_controller.text.trim() == Password_controller.text.trim()) {
                          setState(() {
                            _isloading = true; // Show loading indicator
                          });
                          try {
                            await auth
                                .createUserWithEmailAndPassword(
                                email: email_controller.text.trim(),
                                password: Password_controller.text.trim())
                                .then((value) {
                              firestore.collection('users').doc(currentuser!.uid).set({
                                'name': name_controller.text.trim(),
                                'email' :email_controller.text.trim(),
                                'address' :address_controller.text.trim(),
                                'contact' :contact_controller.text.trim(),
                                'created at' :DateTime.now(),
                                'user ID' :currentuser!.uid,
                                'image' : vm.imageUrl,
                              });
                              setState(() {
                                _isloading = true; // Show loading indicator
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => signin(),
                                  ));
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 2),
                                  backgroundColor: Color(0xff8D3F00),
                                  content: Center(
                                      child: Text(
                                        "Account Created Successfully!",
                                        style:
                                        TextStyle(fontSize: 20, fontFamily: 'Bebas'),
                                      ))));
                            }).onError((error, stackTrace) {
                              setState(() {
                                _isloading = true; // Show loading indicator
                              });
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 2),
                                  backgroundColor: Color(0xff8D3F00),
                                  content: Center(
                                      child: Text(
                                        error.toString(),
                                        style:
                                        TextStyle(fontSize: 20, fontFamily: 'Bebas'),
                                      ))));
                            });
                          } catch (e) {
                            setState(() {
                              _isloading = true; // Show loading indicator
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 2),
                                backgroundColor: Color(0xff8D3F00),
                                content: Center(
                                    child: Text(e.toString(),
                                      style:
                                      TextStyle(fontSize: 20, fontFamily: 'Bebas'),
                                    ))));
                          }
                        } else {
                          // Passwords don't match
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 2),
                              backgroundColor: Color(0xff8D3F00),
                              content: Center(
                                  child: Text(
                                    "Password Didn't Matched!",
                                    style:
                                    TextStyle(fontSize: 20, fontFamily: 'Bebas'),
                                  ))));
                        }

                      } else {
                        // Form validation failed
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 2),
                            backgroundColor: Color(0xff8D3F00),
                            content: Center(
                                child: Text(
                                  "Please Fill in the Required Fields",
                                  style:
                                  TextStyle(fontSize: 20, fontFamily: 'Bebas'),
                                ))));
                      }
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
                            child: _isloading? CircularProgressIndicator():Text(
                              "Create Account",
                              style: TextStyle(
                                  fontFamily: "Bebas",
                                  fontSize: 25,
                                  color: Color(0xff8D3F00)),
                            ))),
                  ),
                ),
              ),

              //Already have an account
              Padding(
                padding: const EdgeInsets.all(20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => signin(),
                        ));
                  },
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                        TextSpan(
                            text: "Login",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xffFFC107),
                                fontWeight: FontWeight.bold))
                      ])),
                ),
              )
            ],
          );
        },
        ),
      ),
    );
  }
}
