import 'package:bake_now/UI/Screens/Bottom_nav_bar/nav_bar.dart';
import 'package:bake_now/UI/Screens/home_screen/home_screen.dart';
import 'package:bake_now/UI/Screens/sign_in&up/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF7DE),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              //logo
              Center(
                child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                          color: Color(0xff7D7D7D),
                          spreadRadius: -20,
                          blurRadius: 0,
                          offset: Offset(-10, 5)
                      )
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
                  decoration: InputDecoration(prefixIconColor: Color(0xffFFC107),prefixIcon: Icon(Icons.alternate_email_outlined),hintText: "Email ID",),
                ),
              ),

              //password
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextFormField(
                  decoration: InputDecoration(suffixIconColor: Color(0xffFFC107),suffixIcon: Icon(Icons.visibility_off),prefixIconColor: Color(0xffFFC107),prefixIcon: Icon(Icons.lock),hintText: "Password",),
                ),
              ),

              SizedBox(height: 20,),

              //Login Button
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => bottom_nav_bar(),));
                    },
                    child: Container(
                      height:55,
                      width: 350,
                      decoration: BoxDecoration(color: Color(0xffFFC107),borderRadius: BorderRadius.circular(50)),
                      child: Center(child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Bebas'),)),
                    ),
                  ),
                ),
              ),

              //or login with
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(child: Text("or login with",style: TextStyle(color: Colors.grey),)),
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
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(20),color: Colors.white),
                      child: Center(child: Image(width: 25,height: 25,image: AssetImage('assets/icons/google.png'))),
                    ),
                  ),

                  //facebook
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(20),color: Colors.white),
                      child: Center(child: Image(width: 25,height: 25,image: AssetImage('assets/icons/facebook.png'))),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => signup(),));
                  },
                  child: RichText(text: TextSpan(children: [
                    TextSpan(text: "New to this platform? ",style: TextStyle(fontSize: 12,color: Colors.grey)),
                    TextSpan(text: "Signup",style: TextStyle(fontSize: 15,color: Color(0xffFFC107),fontWeight: FontWeight.bold ))
                  ])),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
