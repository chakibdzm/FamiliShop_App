import 'package:famili_shop_app/Components/Bottom_nav_bar.dart';
import 'package:famili_shop_app/Components/Page_transition.dart';
import 'package:famili_shop_app/Const.dart';
import 'package:famili_shop_app/Screens/Auth%20Screens/Forgot_password.dart';
import 'package:famili_shop_app/Screens/Auth%20Screens/Registerations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../Size_config.dart';

import '../Product/api-service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;
  String apiUrl = 'https://familishop.onrender.com/login';
  Future<String?> login(String email, String password) async {

    Map<String, String> body = {
      'email': email,
      'password': password,
    };


    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );


    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData != null && responseData['jwt'] != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);

        String token = responseData['jwt'];
        await saveToken(token);
        return token;
      } else {

      }
    } else {

    }


  }
  bool _showCircleAvatar = false;



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
          SizedBox(height: getHeight(146)),
          Center(child: SvgPicture.asset('assets/illustrations/Group 1.svg')),
          SizedBox(height: getHeight(98)),

          Padding(
              padding:  EdgeInsets.symmetric(horizontal:getWidth(25) ),
              child: TextFormField(
                controller: _emailController,

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
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0x0ff2f2f2),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: getHeight(20),
                      horizontal: getWidth(20)),
                  prefixIconConstraints: const BoxConstraints(maxHeight: 25),

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      )),
                  fillColor:Klight,
                  filled: true,
                  hintText: 'Adresse e-mail ou numéro de téléphone portable',

                  hintStyle: TextStyle(

                    fontSize: getHeight(12),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF565555),
                  ),

                ),
              ),
          ),
            SizedBox(height: getHeight(28),),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal:getWidth(20) ),
              child: TextFormField(
                controller: _passwordController,

                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: getHeight(18),
                  color: Colors.black,
                ),
                obscureText: _obscureText,
                cursorColor: const Color(0xFF9DA3B6),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0x0ff2f2f2),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: getHeight(20),
                      horizontal: getWidth(20)),
                  prefixIconConstraints: const BoxConstraints(maxHeight: 25),

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      )),
                  fillColor:Klight,
                  filled: true,
                  hintText: 'Mot de passe',

                  hintStyle: TextStyle(

                    fontSize: getHeight(12),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF565555),
                  ),


                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: getWidth(16)),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        })
                        ;
                      },
                      child:_obscureText?
                      const Icon(Icons.visibility_off_outlined)
                     : const Icon(Icons.visibility_outlined)

                    ),
                  )

                ),
              ),
            ),
            SizedBox(height: getHeight(49),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
              child: GestureDetector(
                onTap: () async {

            setState(() {
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  _showCircleAvatar = false;
                });

              });

              _showCircleAvatar = true;
            });

              String email = _emailController.text;
              String password = _passwordController.text;
              String? token = await login(email, password);
              if (token != null) {
                Navigator.pushReplacement(
                  context,
                    SlideTransition2(BottomNav())

                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Login success'),
                  backgroundColor: Colors.green,),
                );


              } else {
              ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login failed'),
              backgroundColor: Colors.red,
              ),
              );



              }
              },
                child: Container(
                  height: getHeight(54),
                  width: getWidth(353),
                  decoration: BoxDecoration(
                    color: Kprimary,
                    borderRadius: BorderRadius.circular(getHeight(33))
                  ),
                  child:
                  _showCircleAvatar?

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: getWidth(160),
                    vertical: getHeight(15)),
                    child: const CircularProgressIndicator(
                      color: Colors.white),
                  )
                  : Center(child:Text('Connexion',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getHeight(16),
                    fontWeight: FontWeight.w600
                  ),
                  )),
                ),
              ),
            ),
            SizedBox(height: getHeight(19),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: getWidth(78),),
                Text('Vous n’avez pas un compte! ',
                style: TextStyle(

                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: getHeight(14)
                ),

                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      SlideTransition2(RegisterPage())

                    );
                  },
                  child: Text('Inscrire',
                  style: TextStyle(
                    color: Kprimary,
                    fontSize: getHeight(14),
                    fontWeight: FontWeight.w400
                  ),
                  ),

                )

              ],
            ),
            SizedBox(height: getHeight(10),),

            Center(
              child: InkWell(
                onTap: (){
    Navigator.push(
    context,
        SlideTransition2(ForgotPage())

    );
    },

                child: Text('Reset Password?',style: TextStyle(
                  color: Kprimary,
                  fontWeight: FontWeight.w500,
                  fontSize: getHeight(14)
                ),)
              ),
            ),
            SizedBox(height: getHeight(15),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: getWidth(15),),
                Padding(
                  padding:  EdgeInsets.only(top: getHeight(8)),
                  child: SvgPicture.asset('assets/icons/Line 40.svg'),
                ),
                SizedBox(width: getWidth(8),),
                Text('Continuer avec',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: getHeight(14)
                ),
                ),
                SizedBox(width: getWidth(8)),
                Padding(
                  padding:  EdgeInsets.only(top: getHeight(8)),
                  child: SvgPicture.asset('assets/icons/Line 40.svg'),
                ),



              ],
            ),

            SizedBox(height: getHeight(23),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: getWidth(146),),
                Image.asset('assets/illustrations/facebook 2.png'),
                SizedBox(width: getWidth(24),),
                Image.asset('assets/illustrations/google-logo-9808 1.png')
              ],
            )





          ],

        ),
      ),

    ),);
  }
}

