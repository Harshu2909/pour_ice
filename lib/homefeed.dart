import 'package:flutter/material.dart';
import 'package:pour_ice/discover.dart';
import 'package:pour_ice/home.dart';
import 'package:pour_ice/profile.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pour_ice/setting.dart';
import 'package:pour_ice/post.dart';

class HomeFeed extends StatefulWidget {
  HomeFeed({Key? key}) : super(key: key);

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this,initialIndex: 1);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: SafeArea(
          child: AppBar(
            centerTitle: true,
            title:Container(
                    height: 100,
                    width: 150,
                    child: Image(image: AssetImage("assets/home_logo.png"))),
              

            //     Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     IconButton(
            //         color: HexColor("47532F"),
            //         iconSize: 30,
            //         onPressed: () {},
            //         icon: Icon(Icons.group_add)),
            //     Container(
            //         height: 100,
            //         width: 150,
            //         child: Image(image: AssetImage("assets/home_logo.png"))),
            //     IconButton(
            //         color: HexColor("47532F"),
            //         iconSize: 30,
            //         onPressed: () {
            //           Navigator.of(context).pushReplacement(MaterialPageRoute(
            //               builder: ((context) => Settings())));
            //         },
            //         icon: Icon(Icons.settings)),
            //   ],
            // ),
            backgroundColor: HexColor("E5E5E5"),
            elevation: 0,
            leading:IconButton(
                    color: HexColor("47532F"),
                    iconSize: 30,
                    onPressed: () {
                       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => Post())));
                    },
                    icon: Icon(Icons.group_add)),
            
           
            
          
            bottom: TabBar(
              controller: _controller,
              indicatorWeight: 5,
              indicatorColor: HexColor("98B742"),
              indicatorPadding: EdgeInsets.all(5),
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.account_circle,
                    color: HexColor("46522F"),
                    size: 35,
                  ),
                ),
                Tab(
                    icon: Icon(
                  Icons.home,
                  color: HexColor("46522F"),
                  size: 28,
                )),
                Tab(
                  icon: Icon(
                    Icons.search,
                    color: HexColor("46522F"),
                    size: 28,
                  ),
                ),
              ],
            ),
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
          ),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [Profile(), Home(), Discover()],
      ),
    );
  }
}
