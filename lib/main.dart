import 'package:famili_shop_app/Components/Bottom_nav_bar.dart';
import 'package:famili_shop_app/Screens/Auth%20Screens/Login.dart';
import 'package:famili_shop_app/Screens/Home/Home_screen.dart';
import 'package:famili_shop_app/Screens/Product/Allproducts.dart';
import 'package:famili_shop_app/Screens/Product/View.dart';
import 'package:famili_shop_app/Screens/Profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'errorscreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    return CustomErrorWidget(errorDetails);
  };
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});



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
        home:  isLoggedIn ?BottomNav() :LoginPage());
  }
}
