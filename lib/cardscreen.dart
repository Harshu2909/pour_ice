import 'package:flutter/material.dart';
import 'package:pour_ice/home.dart';
import 'package:pour_ice/homefeed.dart';
import 'package:hexcolor/hexcolor.dart';

class CardScreen extends StatefulWidget {
  CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
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
        appBar: AppBar(
          backgroundColor: HexColor("98B742"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeFeed()));
            },
          ),
          title: Text("Post"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              children: [
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(20))
                //   ),
                //     height: 250,
                //     width: 320,
                //     child: Image.asset(

                //       "assets/c1.png",
                //       fit: BoxFit.fitWidth,
                //       // colorBlendMode: BlendMode.darken,
                //     )),
                Container(
                  height: 250,
                  width: 320,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(
                      'assets/c1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Agave Margarita",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Lato-Regular",
                        color: HexColor("47532F"),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 55,
                    ),
                    Text(
                      "1,245",
                      style: TextStyle(
                          fontFamily: "Lato-Regular",
                          fontSize: 20,
                          color: HexColor("98B742")),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Icons.favorite_border,
                      size: 25,
                    )
                  ],
                ), 
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Lato-Regular",
                    color: HexColor("47532F"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
