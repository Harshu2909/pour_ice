import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pour_ice/cardscreen.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text(("Post")),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: (() {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CardScreen()));
                }),
                child: Container(
                  height: 168,
                  width: 372,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    color: Colors.grey[300],
                    elevation: 2,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 5.0,
                                bottom: 15,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "John Smith",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: "Lato-Regular",
                                        color: HexColor("47532F"),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Image(
                                    image: AssetImage("assets/c1.png"),
                                    width: 106,
                                    height: 117,
                                  )
                                ],
                              ),
                            )),
                        Expanded(
                            flex: 6,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 10.0, top: 14),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "1,245",
                                        style: TextStyle(
                                          fontFamily: "Lato-Regular",
                                            fontSize: 13,
                                            color: HexColor("98B742")),
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Icon(
                                        Icons.favorite_border,
                                        size: 13,
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Agave Margarita",
                                        style: TextStyle(
                                          fontFamily: "Lato-Regular",
                                          color: HexColor("47532F"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore etnderit in volupt. tempor incididunt ut labore etnderit in volupt. ",
                                    style: TextStyle(
                                      fontFamily: "Lato-Regular",
                                        fontSize: 10, color: HexColor("252340")),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Read More",
                                        style: TextStyle(
                                          
                                            color: HexColor("98B742"),
                                            fontFamily: "Lato-Regular",
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Container(
                height: 168,
                width: 372,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  color: Colors.grey[300],
                  elevation: 2,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 5.0,
                              bottom: 15,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "John Smith",
                                  style: TextStyle(
                                    fontFamily: "Lato-Regular",
                                      color: HexColor("47532F"),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Image(
                                  image: AssetImage("assets/c2.png"),
                                  width: 106,
                                  height: 117,
                                )
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 6,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, top: 14),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "1,245",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: HexColor("98B742")),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Icon(
                                      Icons.favorite_border,
                                      size: 13,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Bourbon Sidecar.",
                                      style: TextStyle(
                                        fontFamily: "Lato-Regular",
                                        color: HexColor("47532F"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore etnderit in volupt. tempor incididunt ut labore etnderit in volupt. ",
                                  style: TextStyle(
                                    fontFamily: "Lato-Regular",
                                      fontSize: 10, color: HexColor("252340")),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Read More",
                                      style: TextStyle(
                                          color: HexColor("98B742"),
                                          fontFamily: "Lato-Regular",
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Container(
                height: 168,
                width: 372,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  color: Colors.grey[300],
                  elevation: 2,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 5.0,
                              bottom: 15,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "John Smith",
                                  style: TextStyle(
                                    fontFamily: "Lato-Regular",
                                      color: HexColor("47532F"),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Image(
                                  image: AssetImage("assets/c3.png"),
                                  width: 106,
                                  height: 117,
                                )
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 6,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, top: 14),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "1,245",
                                      style: TextStyle(
                                        fontFamily: "Lato-Regular",
                                          fontSize: 13,
                                          color: HexColor("98B742")),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Icon(
                                      Icons.favorite_border,
                                      size: 13,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Cadillac Margarita.",
                                      style: TextStyle(
                                        fontFamily: "Lato-Regular",
                                        color: HexColor("47532F"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore etnderit in volupt. tempor incididunt ut labore etnderit in volupt. ",
                                  style: TextStyle(
                                    fontFamily: "Lato-Regular",
                                      fontSize: 10, color: HexColor("252340")),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Read More",
                                      style: TextStyle(
                                          color: HexColor("98B742"),
                                          fontFamily: "Lato-Regular",
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Container(
                height: 168,
                width: 372,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  color: Colors.grey[300],
                  elevation: 2,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 5.0,
                              bottom: 15,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "John Smith",
                                  style: TextStyle(
                                    fontFamily: "Lato-Regular",
                                      color: HexColor("47532F"),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Image(
                                  image: AssetImage("assets/c4.png"),
                                  width: 106,
                                  height: 117,
                                )
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 6,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, top: 14),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "1,245",
                                      style: TextStyle(
                                        fontFamily: "Lato-Regular",
                                          fontSize: 13,
                                          color: HexColor("98B742")),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Icon(
                                      Icons.favorite_border,
                                      size: 13,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Coconut Margarita",
                                      style: TextStyle(
                                        fontFamily: "Lato-Regular",
                                        color: HexColor("47532F"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore etnderit in volupt. tempor incididunt ut labore etnderit in volupt. ",
                                  style: TextStyle(
                                      fontSize: 10, color: HexColor("252340")),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Read More",
                                      style: TextStyle(
                                          color: HexColor("98B742"),
                                          fontFamily: "Lato-Regular",
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Container(
                height: 168,
                width: 372,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  color: Colors.grey[300],
                  elevation: 2,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 5.0,
                              bottom: 15,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "John Smith",
                                  style: TextStyle(
                                    fontFamily: "Lato-Regular",
                                      color: HexColor("47532F"),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Image(
                                  image: AssetImage("assets/c1.png"),
                                  width: 106,
                                  height: 117,
                                )
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 6,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, top: 14),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "1,245",
                                      style: TextStyle(
                                        fontFamily: "Lato-Regular",
                                          fontSize: 13,
                                          color: HexColor("98B742")),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Icon(
                                      Icons.favorite_border,
                                      size: 13,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Agave Margarita",
                                      style: TextStyle(
                                        fontFamily: "Lato-Regular",
                                        color: HexColor("47532F"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore etnderit in volupt. tempor incididunt ut labore etnderit in volupt. ",
                                  style: TextStyle(
                                    fontFamily: "Lato-Regular",
                                      fontSize: 10, color: HexColor("252340")),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Read More",
                                      style: TextStyle(
                                          color: HexColor("98B742"),
                                          fontFamily: "Lato-Regular",
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
