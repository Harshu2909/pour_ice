import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/gestures.dart';
import 'package:pour_ice/homefeed.dart';
import 'package:pour_ice/login.dart';

import 'models/user_model.dart';

class Reg extends StatefulWidget {
  Reg({Key? key}) : super(key: key);

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  bool isHiddenpwd = true;
  bool isHiddenpwdd = true;

  final _auth = FirebaseAuth.instance;

  //formkey
  final _formkey = GlobalKey<FormState>();

  //editing controller
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  final countryEditingController = TextEditingController();
  final dobEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //First name field
    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.text,
        //validator
        // validator: (value) {
        //   RegExp regex = RegExp(r'^.{3,}$');
        //   if (value!.isEmpty) {
        //     return (" First Name can not be empty");
        //   }
        //   if (!regex.hasMatch(value)) {
        //     return ("Please Enter Name (Min 3 Character) ");
        //   }
        //   return null;
        // },

        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "First Name",
          hintStyle: TextStyle(color: HexColor("98B742"), fontSize: 12),
          prefixIcon: Icon(Icons.account_circle),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ));

    //Second name Field
    final secondNameField = TextFormField(
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.text,
        //validator
        // validator: (value) {
        //   RegExp regex = RegExp(r'^.{3,}$');
        //   if (value!.isEmpty) {
        //     return ("Second Name can not be empty");
        //   }
        //   if (!regex.hasMatch(value)) {
        //     return ("Please Enter Name (Min 3 Character) ");
        //   }
        //   return null;
        // },

        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Second Name",
          hintStyle: TextStyle(color: HexColor("98B742"), fontSize: 12),
          prefixIcon: Icon(Icons.account_circle),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ));

    //country field
    final countryField = TextFormField(
      autofocus: false,
      controller: countryEditingController,
      keyboardType: TextInputType.text,
      //validator
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return ("Please Enter your Email");
      //   }
      //   if (RegExp("A[a-zA-Z0-9+_.-1+@[a-zA-Z0-9.-1+. [a-z]").hasMatch(value)) {
      //     return ("Please Enter a valid email");
      //   }
      //   return null;
      // },

      onSaved: (value) {
        countryEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "Country name",
        hintStyle: TextStyle(color: HexColor("98B742"), fontSize: 12),
        prefixIcon: Icon(Icons.flag),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // date of birth field

    //email field
    final emailFiel = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      //validator
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return ("Please Enter your Email");
      //   }
      //   if (RegExp("A[a-zA-Z0-9+_.-1+@[a-zA-Z0-9.-1+. [a-z]").hasMatch(value)) {
      //     return ("Please Enter a valid email");
      //   }
      //   return null;
      // },

      onSaved: (value) {
        emailEditingController.text = value!;
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
        autofocus: false,
        controller: passwordEditingController,
        obscureText: isHiddenpwd,
        //validator
        // validator: (value) {
        //   RegExp regex = RegExp(r'^.{6,}$');
        //   if (value!.isEmpty) {
        //     return ("password is required for login");
        //   }
        //   if (!regex.hasMatch(value)) {
        //     return ("Please Enter valid password (Min 6 Character) ");
        //   }
        // },

        onSaved: (value) {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Enter Password",
          hintStyle: TextStyle(color: HexColor("98B742"), fontSize: 12),
          prefixIcon: Icon(Icons.lock_outline),
          suffixIcon: InkWell(
            onTap: _togglepwd,
            child: Icon(Icons.visibility_off),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ));

    //confirm password field
    final confirmpasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: isHiddenpwdd,
        //validator
        // validator: (value) {
        //   if (confirmPasswordEditingController.text.length !=
        //       passwordEditingController.text) {
        //     return ("Password don't match");
        //   }
        // },

        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Confirm Password",
          hintStyle: TextStyle(color: HexColor("98B742"), fontSize: 12),
          prefixIcon: Icon(Icons.vpn_key),
          suffixIcon: InkWell(
            onTap: _togglepwdd,
            child: Icon(Icons.visibility_off),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ));

    //signup button
    final signupButton = Material(
      // elevation: 5,
      // borderRadius: BorderRadius.circular(20),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        elevation: 7,
        color: HexColor("47532F"),
        onPressed: () {
          signUp(emailEditingController.text, passwordEditingController.text);
        },
        child: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );

    return WillPopScope(
      onWillPop: () async {
        print('Backbutton pressed');
        final shouldPop = await Navigator.pushReplacement(
            context, (MaterialPageRoute(builder: ((context) => Login()))));
        return true;
      },
      child: Scaffold(
        // appBar: AppBar(
        //     backgroundColor: Colors.transparent,
        //     elevation: 0,
        //     leading: IconButton(
        //       onPressed: () {
        //         Navigator.of(context).pushReplacement(
        //                         MaterialPageRoute(
        //                             builder: ((context) => Login())));
        //       },
        //       icon: Icon(
        //         Icons.arrow_back,
        //         color: HexColor("47532F"),
        //       ),
        //     )),

        // backgroundColor: HexColor("E5E5E5"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 70, left: 70),
                child: Container(
                    child: Image(image: AssetImage("assets/home_logo.png"))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                child: Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(height: 45, child: firstNameField),
                    SizedBox(
                      height: 10,
                    ),
                    Container(height: 45, child: secondNameField),
                    SizedBox(
                      height: 10,
                    ),
                    Container(height: 45, child: countryField),
                    SizedBox(
                      height: 10,
                    ),
                    Container(height: 45, child: emailFiel),
                    SizedBox(
                      height: 10,
                    ),
                    Container(height: 45, child: passwordField),
                    SizedBox(
                      height: 10,
                    ),
                    Container(height: 45, child: confirmpasswordField),
                    SizedBox(
                      height: 10,
                    ),
                    signupButton,
                    SizedBox(
                      height: 10,
                    ),

                    // TextFormField(
                    //   decoration: InputDecoration(
                    //       hintText: "Full Name",

                    //       hintStyle: TextStyle(color: HexColor("98B742"),
                    //       fontSize: 12),
                    //       icon: Icon(Icons.account_circle)),
                    //   keyboardType: TextInputType.emailAddress,
                    // ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //       hintText: "Date Of Birth",
                    //       hintStyle: TextStyle(color: HexColor("98B742"),fontSize: 12),
                    //       icon: Icon(Icons.calendar_today_outlined)),
                    //   keyboardType: TextInputType.emailAddress,
                    // ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //       hintStyle: TextStyle(color: HexColor("98B742"),fontSize: 12),
                    //       hintText: "Email@example.com",
                    //       icon: Icon(Icons.mail)),
                    //   keyboardType: TextInputType.emailAddress,
                    // ),
                    // Container(
                    //   width: 500,
                    //   child: DropdownButton<String>(
                    //     // icon: Icon(Icons.flag),
                    //     hint: Text(
                    //       "Country",
                    //       style: TextStyle(color: HexColor("98B742"),fontSize: 12),
                    //     ),

                    //     items: <String>[
                    //       'India',
                    //       'Usa',
                    //       'Canada',
                    //       'Turkey',
                    //       'Pakistan'
                    //     ].map((String value) {
                    //       return DropdownMenuItem<String>(
                    //         value: value,
                    //         child: Text(value),
                    //       );
                    //     }).toList(),
                    //     onChanged: (_) {},
                    //   ),
                    // ),
                    // Container(
                    //   width: 500,
                    //   child: DropdownButton<String>(
                    //     // icon: Icon(Icons.male),
                    //     hint: Text("Gender",
                    //         style: TextStyle(
                    //             color: HexColor("98B742"), fontSize: 12)),
                    //     items: <String>[
                    //       'Male',
                    //       'Female',
                    //       'Other',
                    //     ].map((String value) {
                    //       return DropdownMenuItem<String>(
                    //         value: value,
                    //         child: Text(value),
                    //       );
                    //     }).toList(),
                    //     onChanged: (_) {},
                    //   ),
                    // ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //       hintText: "Enter Password",
                    //       hintStyle: TextStyle(color: HexColor("98B742"),fontSize: 12),
                    //       icon: Icon(Icons.lock_outline)),
                    //   keyboardType: TextInputType.emailAddress,
                    // ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //       hintText: "Re-enter password",
                    //       hintStyle: TextStyle(color: HexColor("98B742"),fontSize: 12),
                    //       icon: Icon(Icons.lock_outline)),
                    //   keyboardType: TextInputType.emailAddress,
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   width: 500,
                    //   child: RaisedButton(
                    //     hoverColor: HexColor("98B742"),
                    //     color: HexColor("47532F"),
                    //     onPressed: () {
                    //       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => HomeFeed())));
                    //     },
                    //     child: Text(
                    //       "Register",
                    //       style: TextStyle(
                    //           color: Colors.white, fontWeight: FontWeight.bold),
                    //     ),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(7.0),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already Have An Account ? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: ((context) => Login())));
                          },
                          child: Text(
                            "Login Now",
                            style: TextStyle(
                              color: HexColor("47532F"),
                              fontWeight: FontWeight.bold,
                              // decoration: TextDecoration.underline
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  // void signUp(String email, String password) async {
  //   if (_formkey.currentState!.validate()) {
  //     await _auth
  //         .createUserWithEmailAndPassword(email: email, password: password)
  //         .then((value) => {
  //               postDetailsToFirestore(),
  //             })
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e!.message);
  //     });
  //   };
  // }

  void signUp(String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              postDetailsToFirestore(),
            })
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  postDetailsToFirestore() async {
// calling our firestore
    // calling our user modet
    // sedning these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    //writing all value
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully  ");

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomeFeed()), (route) => false);
  }

  void _togglepwd() {
    setState(() {
      isHiddenpwd = !isHiddenpwd;
    });
  }

    void _togglepwdd() {
    setState(() {
      isHiddenpwdd = !isHiddenpwdd;
    });
  }
}
