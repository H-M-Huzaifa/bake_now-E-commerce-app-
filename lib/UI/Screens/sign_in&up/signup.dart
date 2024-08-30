import 'package:bake_now/UI/Screens/sign_in&up/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF7DE),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Text(
                "Signup",
                style: TextStyle(
                    fontFamily: 'Bebas',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff8D3F00)),
              ),
            ),

            //Profile Image
            Container(
              height: 150,
              child: Center(child: Icon(Icons.camera_alt)),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                  shape: BoxShape.circle
              ),
            ),

            //Text Fields
            Container(
              child: Column(
                children: [
                  //name
                  Padding(
                    padding: const EdgeInsets.all(10),
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

                  //Contact number
                  Padding(
                    padding: const EdgeInsets.all(10),
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
                            color: Color(0xff8D3F00),
                          ),
                          suffixIcon: Icon(Icons.visibility_off,color: Color(0xffFFC107),),
                          hintText: '(0-9)(A-Z)(a-z)(alphanumeric)',
                          hintStyle: TextStyle(color: Colors.grey),
                          labelText: 'Password',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  //Confirm Password
                  Padding(
                    padding: const EdgeInsets.all(10),
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
                          // prefixIcon: Icon(
                          //   Icons.drive_file_rename_outline,
                          //   color: Color(0xff8D3F00),
                          // ),
                          suffixIcon: Icon(Icons.visibility_off,color: Color(0xffFFC107),),
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
                padding: const EdgeInsets.only(top: 20),
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
                      "Create Account",
                      style: TextStyle(
                          fontFamily: "Bebas",
                          fontSize: 25,
                          color: Color(0xff8D3F00)),
                    ))),
              ),
            ),

            //Already have an account
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => signin(),));
                },
                child: RichText(text: TextSpan(children: [
                  TextSpan(text: "Already have an account? ",style: TextStyle(fontSize: 12,color: Colors.grey)),
                  TextSpan(text: "Login",style: TextStyle(fontSize: 15,color: Color(0xffFFC107),fontWeight: FontWeight.bold ))
                ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
