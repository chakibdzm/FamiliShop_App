import 'package:famili_shop_app/Const.dart';
import 'package:famili_shop_app/Screens/Auth%20Screens/Login.dart';
import 'package:famili_shop_app/Size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Product/api-service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Map<String, dynamic> userData={};

  @override
  void initState() {
    super.initState();
    fetchUserData().then((result) {
      setState(() {
        userData = result;
      });
    });
  }


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
                      onTap: ()async{
                        await destroy();

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  const LoginPage(),
                          ),
                        );
                      },
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
                 child: Text("Username :"+userData["username"],
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
                 child: Text("Email :"+userData["email"],
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
                 child: Text("First Name :"+userData["first_name"],
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
                 child: Text("Last Name :"+userData["last_name"],
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
                 child: Text("Phone Number :${userData["phone_number"]}",
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
                 child: Text("Membership :"+userData["membership"],
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
                 child: Text("Points :${userData["points"]}",
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
          const Spacer(),
          Center(child: SvgPicture.asset("assets/illustrations/Group 1.svg")),
          SizedBox(height: getHeight(20),)

          
        ],
      ),
    ));
  }
}
