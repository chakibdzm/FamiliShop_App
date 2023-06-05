
import 'package:famili_shop_app/Const.dart';
import 'package:famili_shop_app/Screens/Auth%20Screens/Login.dart';
import 'package:famili_shop_app/Screens/Panier/Panier.dart';
import 'package:famili_shop_app/Screens/Product/View.dart';
import 'package:famili_shop_app/Screens/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Screens/Home/Home_screen.dart';

class BottomNav extends StatefulWidget {
  @override
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  var currentIndex = 0;
  List<Widget> screens=[
    const HomePage(),
    const PanierPage(),
    const ProductPage(),
    const ProfilePage(),
  ];



  @override
  Widget build(BuildContext context) {







    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(5),
        height: screenWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: screens.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(
                  width: screenWidth * .2125,
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? screenWidth * .12 : 0,
                      width: index == currentIndex ? screenWidth * .2125 : 0,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? Color(0xFFEC6FFD).withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth * .2125,
                  alignment: Alignment.center,
                  child: Icon(
                    listOfIcons[index],
                    size: screenWidth * .076,
                    color: index == currentIndex
                        ? Kprimary
                        : Colors.black26,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: screens[currentIndex],

    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.category,
    Icons.favorite,
    Icons.person_rounded,
  ];
}



