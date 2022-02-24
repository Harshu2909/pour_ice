import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pour_ice/home.dart';
import 'package:pour_ice/homefeed.dart';
import 'package:pour_ice/login.dart';
import 'package:pour_ice/registration.dart';
import 'package:pour_ice/setting.dart';

Future <void> main() async {

WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  
  runApp(MaterialApp(
    
    theme: ThemeData(primaryColor: HexColor("98B742"),accentColor: HexColor("98B742")),
    
     
    initialRoute: '/',
    routes: {
      '/':(context)=>Login(),

      // '/':(context)=>HomeFeed(),
      // '/location':(context)=>ChooseLocation(),

    },
    
  ));
}
