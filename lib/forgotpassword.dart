import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_fb_auth_emailpass/pages/login.dart';
// import 'package:flutter_fb_auth_emailpass/pages/signup.dart';
import 'package:pour_ice/login.dart';
import 'package:pour_ice/registration.dart';
import 'package:hexcolor/hexcolor.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  var email = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();

  

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Password Reset Email has been sent !',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'No user found for that email.',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: () async {
    print('Backbutton pressed');
    final shouldPop = await Navigator.pushReplacement(
        context, (MaterialPageRoute(builder: ((context) => Login()))));

    return true;
  },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("47532F"),
          centerTitle: true,
          title: Text("Reset Password"),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                'Reset Link will be sent to your email id !',
                style: TextStyle(
                            fontFamily: "Lato-Regular",
                            fontSize: 15,
                            color: HexColor("47532F")),
              ),
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'Email: ',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle:
                                TextStyle(color: Colors.redAccent, fontSize: 15),
                          ),
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            } else if (!value.contains('@')) {
                              return 'Please Enter Valid Email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 60.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                
                              onPressed: () {
                                // Validate returns true if the form is valid, otherwise false.
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    email = emailController.text;
                                  });
                                  resetPassword();
                                }
                              },
                              child: Text(
                                'Send Email',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                            TextButton(
                              onPressed: () => {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Login()))
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                          fontFamily: "Lato-Regular",
                          fontWeight: FontWeight.bold,
                          // fontSize: 20,
                          color: HexColor("47532F")),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an Account? ",style: TextStyle(
                            fontFamily: "Lato-Regular",
                            // fontSize: 20,
                            color: HexColor("47532F")),),
                            TextButton(
                                onPressed: () => {
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Reg()))
                                    },
                                child: Text('Register Now',style: TextStyle(
                          fontFamily: "Lato-Regular",
                          // fontSize: 20,
                          color: HexColor("47532F")),))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}