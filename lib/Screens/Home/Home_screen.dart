import 'package:famili_shop_app/Const.dart';
import 'package:famili_shop_app/Size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: getHeight(75),
            child: Stack(
              children: [

                Positioned(child: Container(
                  height: getHeight(40),
                  width: getWidth(289),
                  child: TextFormField(
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: getHeight(18),
                      color: Colors.black,
                    ),

                    cursorColor: const Color(0xFF9DA3B6),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            width: 1,
                            color: Kprimary,
                          ),
                        ),

                        prefixIconConstraints: const BoxConstraints(
                            maxHeight: 25),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(34.0),
                            borderSide: BorderSide(
                              width: 1,
                              color: Kprimary,
                            )),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Chercher Sur FamiliShop',

                        hintStyle: TextStyle(
                          fontSize: getHeight(12),
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF565555),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              left: getWidth(15), right: getWidth(5)),
                          child: SvgPicture.asset("assets/icons/search.svg"),
                        )

                    ),
                  ),
                ),
                  top: getHeight(20),
                  left: getWidth(20),


                ),

                Positioned(child: InkWell(child: SvgPicture.asset(
                    "assets/icons/panier.svg")),
                  top: getHeight(21),
                  right: getWidth(18),
                ),

              ],
            ),
          ),
          SizedBox(height: getHeight(5),),
          Container(
            height: getHeight(195),
            width: getWidth(393),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getHeight(18)),
                color: Klight

            ),

            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: getWidth(22),top: getHeight(9)),
                  child: Text('Stock Limité',
                  style: TextStyle
                    (
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: getHeight(18),
                  ),
                  ),
                ),
                SizedBox(height: getHeight(8),),
                Padding(
                  padding:  EdgeInsets.only(left: getWidth(22)),
                  child: Text('Termine dans : 11j',
                    style: TextStyle
                      (
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: getHeight(18),
                    ),
                  ),
                ),
                SizedBox(height: getHeight(11),),
                Row(
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {

                        return Container(
                          width: 20,
                          height: 20,
                          color: Colors.black,

                        );
                      },
                    ),
                  ],
                )
                
              ],
            ),
          )

        ],
      ),

    ),);
  }
}
