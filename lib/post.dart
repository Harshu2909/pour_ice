import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pour_ice/homefeed.dart';
import 'package:pour_ice/setting.dart';

class Post extends StatefulWidget {
  Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {},
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
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                                      right: -10,
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
                                                    margin: EdgeInsets.only(right: 0),
                                                    child: Icon(Icons.edit))),
                                          )))
                                ],
                              )
                              // Image(image: AssetImage("assets/profile/p1.png"))),
                              ),
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
                              "Coconut Margarita",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Lato-Regular",
                                  color: Color(0xff47532F)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Lorem ipsum dolor amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut laboe etnderit in voluptLorem ipsum dolor amet, consectetur adipiscing elit.",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Lato-Regular",
                                  color: Color(0xff98B742)),
                            )
                          ]),
                    )
                  ],
                ),
                SingleChildScrollView(
                  child: Form(
                      child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Lorem ipsum dolor sit amet, consectetur a",
                          hintStyle:
                              TextStyle(color: HexColor("98B742"), fontSize: 12),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Lorem ipsum dolor ",
                          hintStyle:
                              TextStyle(color: HexColor("98B742"), fontSize: 12),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Lorem ipsum dolor sit amet, ",
                          hintStyle:
                              TextStyle(color: HexColor("98B742"), fontSize: 12),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Lorem ipsum adipiscing elit,",
                          hintStyle:
                              TextStyle(color: HexColor("98B742"), fontSize: 12),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
                          hintStyle:
                              TextStyle(color: HexColor("98B742"), fontSize: 12),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Lorem ipsum dolor slit,",
                          hintStyle:
                              TextStyle(color: HexColor("98B742"), fontSize: 12),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Lorem ipsum dolor sit amet,  elit,",
                          hintStyle:
                              TextStyle(color: HexColor("98B742"), fontSize: 12),
                        ),
                      ),
                    ],
                  )),
                ),
                SizedBox(height: 20,),
                 Container(
                      width: 500,
                      child: RaisedButton(
                        hoverColor: HexColor("98B742"),
                        color: HexColor("47532F"),
                        onPressed: () {
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => HomeFeed())));
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                    ),
              ]),
              
            ),
          )),
    );
  }
}
