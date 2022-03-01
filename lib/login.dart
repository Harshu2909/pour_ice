// import 'dart:html';

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pour_ice/forgotpassword.dart';
import 'package:pour_ice/registration.dart';
import 'package:flutter/gestures.dart';

import 'homefeed.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = "";
  var password = "";

  //form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  //firebase auth
  final _auth = FirebaseAuth.instance;

  //hidden pwd
  bool isHiddenpwd = true;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      //validator
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter your Email");
        }
        if (RegExp("A[a-zA-Z0-9+_.-1+@[a-zA-Z0-9.-1+. [a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Email@example.com",
        hintStyle: TextStyle(color: HexColor("98B742"), fontSize: 12),
        prefixIcon: Icon(Icons.mail),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    //password field
    final passwordField = TextFormField(
      obscureText: isHiddenpwd,
      autofocus: false,
      controller: passwordController,
      //validator
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter valid password (Min 6 Character) ");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: "password",
        hintStyle: TextStyle(color: HexColor("98B742"), fontSize: 12),
        prefixIcon: Icon(Icons.lock_outline),
        suffixIcon: InkWell(
          onTap: _togglepwd,
          child: Icon(Icons.visibility_off),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    //login button
    final loginButton = Material(
      // elevation: 5,
      // borderRadius: BorderRadius.circular(20),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        elevation: 7,
        color: HexColor("47532F"),
        onPressed: () {
          // signIn(emailController.text, passwordController.text);

          if (_formKey.currentState!.validate()) {
            signIn(emailController.text.replaceAll(' ', ''), passwordController.text);
            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(( context) => Homescreen())));
          }
        },
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );

    return Scaffold(
      // backgroundColor: HexColor("E5E5E5"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Image(image: AssetImage("assets/home_logo.png")),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        emailField,
                        SizedBox(
                          height: 10,
                        ),
                        passwordField,
                        // TextFormField(
                        //   decoration: InputDecoration(
                        //       hintText: "Email@example.com",
                        //       hintStyle: TextStyle(color: HexColor("98B742"),fontSize: 12),
                        //       icon: Icon(Icons.mail)),
                        //   keyboardType: TextInputType.emailAddress,
                        // ),

                        // TextFormField(
                        //   decoration: InputDecoration(
                        //       hintText: "***********",
                        //       hintStyle: TextStyle(color: HexColor("98B742"),fontSize: 12),
                        //       icon: Icon(Icons.lock_outline)),
                        //   keyboardType: TextInputType.text,
                        //   obscureText: true,
                        // ),
                        SizedBox(height: 2),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          ForgotPassword())));
                            },
                            child: Text(
                              "Forget password ?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: HexColor("47532F")),
                            )),
                        // Text("Forget password ?"),
                        SizedBox(height: 20),
                        loginButton,

                        // Container(
                        //   width: 500,
                        //   child: RaisedButton(
                        //     hoverColor: HexColor("98B742"),
                        //     color: HexColor("47532F"),
                        //     onPressed: () {},
                        //     child: Text(
                        //       "Login",
                        //       style: TextStyle(
                        //           color: Colors.white,
                        //           fontWeight: FontWeight.bold),
                        //     ),
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(7.0),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't Have an Account ? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: ((context) => Reg())));
                              },
                              child: Text(
                                "Register Now",
                                style: TextStyle(
                                  color: HexColor("47532F"),
                                  fontWeight: FontWeight.bold,
                                  // decoration: TextDecoration.underline
                                ),
                              ),
                            )
                          ],
                        )

                        // ElevatedButton(
                        //     child: Text("Login",
                        //         style: TextStyle(fontSize: 14)),
                        //     style: ButtonStyle(
                        //         foregroundColor:
                        //             MaterialStateProperty.all<Color>(Colors.white),
                        //         backgroundColor:
                        //             MaterialStateProperty.all<Color>(Colors.redAccent),
                        //         shape: MaterialStateProperty.all<
                        //                 RoundedRectangleBorder>(
                        //             RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(5),
                        //                 side: BorderSide(color: Colors.red)))),
                        //     onPressed: () => null)

                        // ElevatedButton(onPressed: (){}, child: Text("Login",style: TextStyle(fontSize: 14)),),

                        // RaisedButton(

                        //   color: HexColor("47532F"),
                        //   onPressed: (){},
                        // child: Text("Login",style: TextStyle(color: Colors.white),),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  //login function

  // void signIn(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     await _auth
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then((uid) => {
  //               Fluttertoast.showToast(msg: "Login Sucessful"),
  //               Navigator.of(context).pushReplacement(
  //                   MaterialPageRoute(builder: (context) => HomeFeed())),
  //             })
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e!.message);
  //     });
  //   }
  // }

  void signIn(String email, String password) async {
  if (_formKey.currentState!.validate()) {


    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
          if(uid.user?.emailVerified == true){
            ScaffoldMessenger.of (context).showSnackBar(
              SnackBar(
                backgroundColor: Color(0xFF98B742),
                content: Text(
                  'Login Sucessful',
                  style: TextStyle(fontSize: 18.0,fontFamily: "Gilmer Medium",color: Colors.white),
                ), // Text
              ),
            ),
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: ((context) => HomeFeed()))),
          }else{
        ScaffoldMessenger.of (context).showSnackBar(
       SnackBar(
        backgroundColor: Color(0xFF0F2851),
        content: Text(
          'Please, verify your email',
          style: TextStyle(fontSize: 18.0,fontFamily: "Gilmer Medium",color: Colors.white),
        ), // Text
      ),
    ),
          }

        }).catchError((e)
        {
          ScaffoldMessenger.of (context).showSnackBar(
            SnackBar(
              backgroundColor: Color(0xFF0F2851),
              content: Text(
                'This User have No Record Found  Please SignUp!',
                style: TextStyle(fontSize: 18.0,fontFamily: "Gilmer Medium",color: Colors.white),
              ), // Text
            ),
          );

        });

  }
}

  void _togglepwd() {
    setState(() {
      isHiddenpwd = !isHiddenpwd;
    });
  }
}
