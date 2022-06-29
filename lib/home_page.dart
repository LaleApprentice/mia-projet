import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutterfbauth/services/authservice.dart';
import 'MapPage.dart';
import 'ProfilePage.dart';
import 'Leaderboard.dart';
import 'ScannerPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index=1;
  final screens =[
    MapPage(),
    ScannerPage(),
    ProfilePage(),
    LeaderBoard()

  ];


  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.map,size:30),
      Icon(Icons.qr_code,size:30),
      Icon(Icons.person,size:30),
      Icon(Icons.leaderboard,size:30),

    ];
    return Scaffold(
    backgroundColor:Colors.lightGreen,

      body: screens[index],

bottomNavigationBar: CurvedNavigationBar(

    backgroundColor: Colors.transparent,
    height:60,
    index: index,
    items:items,
    onTap:(index)=>setState(() => this.index=index),
    ),
    );
  }
}