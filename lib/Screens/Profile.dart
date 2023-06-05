import 'package:famili_shop_app/Const.dart';
import 'package:famili_shop_app/Size_config.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: getHeight(150),
            width: getWidth(395),
            decoration: BoxDecoration(
              color: Kprimary,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(getHeight(22)),bottomRight: Radius.circular(getHeight(22)))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getHeight(20),),

                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: getWidth(20)),
                      child: Text("MY PROFILE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getHeight(18),
                        fontWeight: FontWeight.w700
                      ),),
                    ),
                    SizedBox(width: getWidth(150),),
                    InkWell(
                      child: Container(
                        height: getHeight(60),
                        width: getWidth(95),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(getHeight(18))
                        ),
                        child: Center(
                          child: Text("LogOut",
                          style: TextStyle(
                            color: Kprimary,
                            fontWeight: FontWeight.w600,
                            fontSize: getHeight(16)
                          ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: getHeight(10),),


              ],
            ),
          ),
          SizedBox(height: getHeight(31),),
         Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
               height: getHeight(220),
               width: getWidth(20),
               decoration: BoxDecoration(
                 color: Kprimary,
                 borderRadius: BorderRadius.only(topRight: Radius.circular(getHeight(18)),bottomRight: Radius.circular(getHeight(18)))
               ),
             ),
             Column(crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(height: getHeight(10),),
               Padding(
                 padding:  EdgeInsets.only(left: getWidth(20)),
                 child: Text("Username :",
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: getHeight(16),
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ),
               SizedBox(height: getHeight(11),),
               Padding(
                 padding:  EdgeInsets.only(left: getWidth(20)),
                 child: Text("Email :",
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: getHeight(16),
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ),
               SizedBox(height: getHeight(11),),
               Padding(
                 padding:  EdgeInsets.only(left: getWidth(20)),
                 child: Text("First Name :",
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: getHeight(16),
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ),
               SizedBox(height: getHeight(11),),
               Padding(
                 padding:  EdgeInsets.only(left: getWidth(20)),
                 child: Text("Last Name :",
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: getHeight(16),
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ),
               SizedBox(height: getHeight(11),),
               Padding(
                 padding:  EdgeInsets.only(left: getWidth(20)),
                 child: Text("Phone Number :",
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: getHeight(16),
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ),
               SizedBox(height: getHeight(11),),
               Padding(
                 padding:  EdgeInsets.only(left: getWidth(20)),
                 child: Text("Membership :",
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: getHeight(16),
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ),
               SizedBox(height: getHeight(11),),
               Padding(
                 padding:  EdgeInsets.only(left: getWidth(20)),
                 child: Text("Points :",
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: getHeight(16),
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ),
             ],)

           ],
         ),
          Spacer(),
          Center(child: Image.asset("assets/illustrations/logo-Famili-shop 2.png")),
          SizedBox(height: getHeight(20),)

          
        ],
      ),
    ));
  }
}
