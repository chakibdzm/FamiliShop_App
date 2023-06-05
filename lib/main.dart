import 'package:famili_shop_app/Components/Bottom_nav_bar.dart';
import 'package:famili_shop_app/Screens/Auth%20Screens/Login.dart';
import 'package:famili_shop_app/Screens/Home/Home_screen.dart';
import 'package:famili_shop_app/Screens/Profile.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FamiliShop',
        theme: ThemeData(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          primarySwatch: Colors.blue,
        ),
        home:  BottomNav());
  }
}
