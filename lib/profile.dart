// ignore_for_file: avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pour_ice/homefeed.dart';
import 'package:pour_ice/login.dart';

import 'models/user_model.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

    User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
         onWillPop: () async {
    print('Backbutton pressed');
    final shouldPop = await Navigator.pushReplacement(
        context, (MaterialPageRoute(builder: ((context) => HomeFeed()))));

    return true;
  },
      
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Scaffold(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      SizedBox(
                          height: 180,
                          width: 125,
                          child: Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.expand,
                            children: [
                              Image(image: AssetImage("assets/profile/p1.png")),
                              Positioned(
                                  right: -18,
                                  bottom: 0,
                                  child: SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: FlatButton(
                                        
                                        shape: RoundedRectangleBorder(
                                          
                                          borderRadius: BorderRadius.circular(50),
                                          side: BorderSide(color: Colors.white),
                                        ),
                                        color: Color(0xFF98B742),
                                        onPressed: () {},
                                        // TODO: Icon not centered.
                                        child: Center(
                                          child: Container(
                                            margin: EdgeInsets.only(right: 5),
                                            child: Icon(Icons.edit))),
                                      )))
                            ],
                          )
                          // Image(image: AssetImage("assets/profile/p1.png"))),
                          )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${loggedInUser.firstName} ${loggedInUser.secondName}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Lato-Regular",
                            color: Color(0xff47532F)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Age:",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Lato-Regular",
                                color: Color(0xff47532F)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "24 years old",
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: "Lato-Regular",
                                color: Color(0xff98B742)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Text(
                            "Preference::",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Lato-Regular",
                                color: Color(0xff47532F)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Lorem ipsum dolor ",
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: "Lato-Regular",
                                color: Color(0xff98B742)),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore etnderit in volupt.",
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: "Lato-Regular",
                                color: Color(0xff98B742)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Text("Level:",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Lato-Regular",
                                  color: Color(0xff47532F))),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Level 0",
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: "Lato-Regular",
                                color: Color(0xff98B742)),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 27,
            ),
            Text(
              "My Friends",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: "Lato-Regular",
                  fontWeight: FontWeight.bold,
                  color: Color(0xff47532F)),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView(
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                children: [
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.all(3),
                          child:
                              Image(image: AssetImage("assets/profile/g1.png"))),
                      Text("Cameron Williamson",
                          style: TextStyle(
                              color: HexColor("47532F"),
                              fontSize: 9,
                              fontFamily: "Lato-Regular"))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(2000))),
                          margin: EdgeInsets.all(3),
                          child:
                              Image(image: AssetImage("assets/profile/g2.png"))),
                      Text("Leslie Alexander",
                          style: TextStyle(
                              color: HexColor("47532F"),
                              fontSize: 9,
                              fontFamily: "Lato-Regular"))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.all(3),
                          child:
                              Image(image: AssetImage("assets/profile/g3.png"))),
                      Text("Theresa Webb",
                          style: TextStyle(
                              color: HexColor("47532F"),
                              fontSize: 9,
                              fontFamily: "Lato-Regular"))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.all(3),
                          child:
                              Image(image: AssetImage("assets/profile/g4.png"))),
                      Text("Ronald Richards",
                          style: TextStyle(
                              color: HexColor("47532F"),
                              fontSize: 9,
                              fontFamily: "Lato-Regular"))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.all(3),
                          child:
                              Image(image: AssetImage("assets/profile/g5.png"))),
                      Text("Annette Black",
                          style: TextStyle(
                              color: HexColor("47532F"),
                              fontSize: 9,
                              fontFamily: "Lato-Regular"))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.all(3),
                          child:
                              Image(image: AssetImage("assets/profile/g6.png"))),
                      Text("Jerome Bell",
                          style: TextStyle(
                              color: HexColor("47532F"),
                              fontSize: 9,
                              fontFamily: "Lato-Regular"))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.all(3),
                          child:
                              Image(image: AssetImage("assets/profile/g7.png"))),
                      Text("Marvin McKinney",
                          style: TextStyle(
                              color: HexColor("47532F"),
                              fontSize: 9,
                              fontFamily: "Lato-Regular"))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.all(3),
                          child:
                              Image(image: AssetImage("assets/profile/g8.png"))),
                      Text("Esther Howard",
                          style: TextStyle(
                              color: HexColor("47532F"),
                              fontSize: 9,
                              fontFamily: "Lato-Regular"))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.all(3),
                          child:
                              Image(image: AssetImage("assets/profile/g9.png"))),
                      Text("Devon Lane",
                          style: TextStyle(
                              color: HexColor("47532F"),
                              fontSize: 9,
                              fontFamily: "Lato-Regular"))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.all(3),
                          child:
                              Image(image: AssetImage("assets/profile/g2.png"))),
                      Text("Devon Lane",
                          style: TextStyle(
                              color: HexColor("47532F"),
                              fontSize: 9,
                              fontFamily: "Lato-Regular"))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.all(3),
                          child:
                              Image(image: AssetImage("assets/profile/g3.png"))),
                      Text("Devon Lane",
                          style: TextStyle(
                              color: HexColor("47532F"),
                              fontSize: 9,
                              fontFamily: "Lato-Regular"))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.all(3),
                          child:
                              Image(image: AssetImage("assets/profile/g1.png"))),
                      Text("Devon Lane",
                          style: TextStyle(
                              color: HexColor("47532F"),
                              fontSize: 9,
                              fontFamily: "Lato-Regular"))
                    ],
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
