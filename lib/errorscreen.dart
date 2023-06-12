
import 'package:famili_shop_app/Const.dart';

import 'package:famili_shop_app/Size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  CustomErrorWidget(this.errorDetails, {super.key});

  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("Please Wait....",
              style: TextStyle(
                color: Kprimary,
                fontWeight: FontWeight.w700,
                fontSize: getHeight(15)
              ),
              ),
              SizedBox(height: getHeight(20),),
              CircularProgressIndicator(),
              SizedBox(height: getHeight(55),),
              InkWell(onTap:  () {
                Navigator.pop(context
                );
              },
              child: Container(
                height: getHeight(50),
                width: getWidth(150),
                color: Kprimary,
                child: Center(
                  child: Text("Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getHeight(20),
                    fontWeight: FontWeight.w500
                  ),

                  ),
                ),
              ),
              ),
              SizedBox(height: getHeight(20),),
              SvgPicture.asset("assets/illustrations/Group 1.svg",height: getHeight(50),),



            ],
          )
          ),

      ),
    );
  }
}
