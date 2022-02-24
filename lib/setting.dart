import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pour_ice/discover.dart';
import 'package:pour_ice/home.dart';
import 'package:pour_ice/homefeed.dart';
import 'package:pour_ice/login.dart';
import 'package:pour_ice/models/user_model.dart';
import 'package:pour_ice/post.dart';
import 'package:pour_ice/profile.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pour_ice/setting.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<Settings> {
  //firebase code
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

  // late TabController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = TabController(length: 3, vsync: this, initialIndex: 1);
  //   _controller.addListener(() {
  //     setState(() {});
  //   });
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 3,
    //   child: Scaffold(
    //     appBar: PreferredSize(
    //       preferredSize: Size.fromHeight(120),
    //       child: SafeArea(
    //         child: AppBar(
    //           centerTitle: true,
    //           title:Container(
    //                 height: 100,
    //                 width: 150,
    //                 child: Image(image: AssetImage("assets/home_logo.png"))),

    //           //  Row(
    //           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           //   children: [
    //           //     IconButton(
    //           //         color: HexColor("47532F"),
    //           //         iconSize: 30,
    //           //         onPressed: () {},
    //           //         icon: Icon(Icons.group_add)),
    //           //     Container(
    //           //         height: 100,
    //           //         width: 150,
    //           //         child: Image(image: AssetImage("assets/home_logo.png"))),
    //           //     IconButton(
    //           //         color: HexColor("47532F"),
    //           //         iconSize: 30,
    //           //         onPressed: () {
    //           //           Navigator.of(context).pushReplacement(MaterialPageRoute(
    //           //               builder: ((context) => Settings())));
    //           //         },
    //           //         icon: Icon(Icons.settings)),
    //           //   ],
    //           // ),

    //           backgroundColor: HexColor("E5E5E5"),
    //           elevation: 0,
    //           leading:IconButton(
    //                 color: HexColor("47532F"),
    //                 iconSize: 30,
    //                 onPressed: () {},
    //                 icon: Icon(Icons.group_add)),
    //           bottom: TabBar(
    //             controller: _controller,
    //             indicatorWeight: 5,
    //             indicatorColor: HexColor("98B742"),
    //             indicatorPadding: EdgeInsets.all(5),
    //             tabs: [
    //               Tab(
    //                 icon: Icon(
    //                   Icons.account_circle,
    //                   color: HexColor("46522F"),
    //                   size: 35,
    //                 ),
    //               ),
    //               Tab(
    //                   icon: Icon(
    //                 Icons.home,
    //                 color: HexColor("46522F"),
    //                 size: 28,
    //               )),
    //               Tab(
    //                 icon: Icon(
    //                   Icons.search,
    //                   color: HexColor("46522F"),
    //                   size: 28,
    //                 ),
    //               ),
    //             ],
    //           ),
    //            actions: [
    //              IconButton(
    //                 color: HexColor("47532F"),
    //                 iconSize: 30,
    //                 onPressed: () {

    //                   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //                       builder: ((context) => Settings())));
    //                 },
    //                 icon: Icon(Icons.settings)),
    //         ],
    //         ),
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [Profile(), Home(), Discover()],
    //     ),
    //   ),
    // );

    return WillPopScope(
      onWillPop: () async {
        print('Backbutton pressed');
        final shouldPop = await Navigator.pushReplacement(
            context, (MaterialPageRoute(builder: ((context) => HomeFeed()))));

        return true;
      },
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(85),
              child: SafeArea(
                  child: AppBar(
                centerTitle: true,
                title: Container(
                    height: 100,
                    width: 150,
                    child: Image(image: AssetImage("assets/home_logo.png"))),
                backgroundColor: HexColor("E5E5E5"),
                elevation: 0,
                leading: IconButton(
                    color: HexColor("47532F"),
                    iconSize: 30,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Post()));
                    },
                    icon: Icon(Icons.group_add)),
                actions: [
                  IconButton(
                      color: HexColor("47532F"),
                      iconSize: 30,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: ((context) => Settings())));
                      },
                      icon: Icon(Icons.settings)),
                ],
              ))),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(children: [
                Text(
                  "Setting",
                  style: TextStyle(
                      color: HexColor("47532F"),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Form(
                    child: Column(
                  children: [
                    
                    TextFormField(
                      decoration: InputDecoration(
                          hintText:
                              "${loggedInUser.firstName} ${loggedInUser.secondName}",
                          hintStyle: TextStyle(
                              color: HexColor("98B742"), fontSize: 12),
                          icon: Icon(Icons.account_circle)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "11/12/2021",
                          hintStyle: TextStyle(
                              color: HexColor("98B742"), fontSize: 12),
                          icon: Icon(Icons.calendar_today_outlined)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: HexColor("98B742"), fontSize: 12),
                          hintText: "${loggedInUser.email}",
                          icon: Icon(Icons.mail)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: HexColor("98B742"), fontSize: 12),
                          hintText: "Pakistan",
                          icon: Icon(Icons.flag)),
                      // keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: HexColor("98B742"), fontSize: 12),
                          hintText: "Male",
                          icon: Icon(Icons.male)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: HexColor("98B742"), fontSize: 12),
                          icon: Icon(Icons.lock_outline)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Account Privacy",
                          hintStyle: TextStyle(
                              color: HexColor("98B742"), fontSize: 12),
                          icon: Icon(Icons.remove_red_eye)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: 500,
                      child: RaisedButton(
                        hoverColor: HexColor("98B742"),
                        color: HexColor("47532F"),
                        onPressed: () {
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => HomeFeed())));
                        },
                        child: Text(
                          "Save Setting",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                    ),
                     SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 85,
                      child: RaisedButton(
                        hoverColor: HexColor("98B742"),
                        color: HexColor("98B742"),
                        onPressed: () {
                         logout(context);
                        },
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                    ),
                   
                    // Container(
                    //   child: ActionChip(
                    //       label: Text("Logout"),
                    //       onPressed: () {
                    //         logout(context);
                    //       }),
                    // )
                  ],
                ))
              ]),
            ),
          )),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  }
}
