import 'package:bake_now/UI/Screens/Bottom_nav_bar/nav_bar.dart';
import 'package:bake_now/UI/Screens/home_screen/home_screen.dart';
import 'package:bake_now/UI/Screens/sign_in&up/signin_provider.dart';
import 'package:bake_now/UI/Screens/sign_in&up/signup.dart';
import 'package:bake_now/UI/Screens/sign_in&up/signup_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  //for showing indicator in login button while loading
  bool _isloading =false;

  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email_controller.dispose();
    password_controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF7DE),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //logo
                Center(
                  child: Container(
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                            color: Color(0xff7D7D7D),
                            spreadRadius: -20,
                            blurRadius: 0,
                            offset: Offset(-10, 5))
                      ]),
                      child: Image(
                        height: 250,
                        width: 250,
                        image: AssetImage('assets/images/logo.png'),
                      )),
                ),

                //Login
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontFamily: 'Bebas',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff8D3F00)),
                  ),
                ),

                //email
                Padding(
                  padding: const EdgeInsets.all(25.0),
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
                      prefixIconColor: Color(0xffFFC107),
                      prefixIcon: Icon(Icons.alternate_email_outlined),
                      hintText: "Email ID",
                    ),
                  ),
                ),

                //password
                Consumer<class_sign_in_provider>(
                  builder: (context, vm, child) {
                    return Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          } else {
                            return null;
                          }
                        },
                        controller: password_controller,
                        obscureText: !vm.isPasswordVisible,
                        decoration: InputDecoration(
                          suffixIconColor: Color(0xffFFC107),
                          suffixIcon: IconButton(
                            icon: Icon(vm.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              vm.togglePasswordVisibility();
                            },
                          ),
                          prefixIconColor: Color(0xffFFC107),
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Password",
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(
                  height: 20,
                ),

                //Login Button
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: GestureDetector(
                      onTap: ()async {
                        if(_formkey.currentState!.validate()){
                          try{
                            await auth.signInWithEmailAndPassword(
                                email: email_controller.text.trim(),
                                password: password_controller.text.trim()).then((value) {
                              setState(() {
                                _isloading = true; // Show loading indicator
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => bottom_nav_bar(),
                                  ));
                            });
                          }catch(e){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 2),
                                backgroundColor: Color(0xff8D3F00),
                                content: Center(
                                    child: Text(
                                      e.toString(),
                                      style:
                                      TextStyle(fontSize: 20, fontFamily: 'Bebas'),
                                    ))));
                          }

                        }else{
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
                        height: 55,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Color(0xffFFC107),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child:_isloading? CircularProgressIndicator(): Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Bebas'),
                        )),
                      ),
                    ),
                  ),
                ),

                //or login with
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                      child: Text(
                    "or login with",
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

                //New to this platform
                Consumer<class_sign_up_provider>(builder: (context, vm, child) {
                return Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              // Clear the provider's image data before navigating to the sign-up screen
                              vm.clearImageData();
                              return signup(); // Your sign-up screen widget
                            },
                          ),
                        );
                      },
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "New to this platform? ",
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                        TextSpan(
                            text: "Signup",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xffFFC107),
                                fontWeight: FontWeight.bold))
                      ])),
                    ),
                  );
                }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
