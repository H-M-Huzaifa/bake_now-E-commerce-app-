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
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            //Profile Image
            CircleAvatar(
              maxRadius: 150,
              backgroundImage: AssetImage("assets/images/boy.jpg"),
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
                ],
              ),
            ),

            //Save
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
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
