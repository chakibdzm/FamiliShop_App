import 'package:famili_shop_app/Screens/Auth%20Screens/Registerations.dart';
import 'package:famili_shop_app/Screens/Product/View.dart';
import 'package:flutter/material.dart';

import 'Screens/Auth Screens/Login.dart';

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
        home: const ProductPage());
  }
}
