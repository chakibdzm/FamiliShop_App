import 'package:famili_shop_app/Const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Size_config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
            SizedBox(height: getHeight(146)),
            Center(child: Image.asset('assets/illustrations/logo-Famili-shop 2.png')),
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
                        color: Color(0xFF2F2F2),
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
                      color: Color(0xFF565555),
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
                        color: Color(0xFF2F2F2),
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
                      color: Color(0xFF565555),
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
                        Icon(Icons.visibility_off_outlined)
                       : Icon(Icons.visibility_outlined)

                      ),
                    )

                  ),
                ),
              ),
              SizedBox(height: getHeight(49),),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: InkWell(
                  onTap: null,
                  child: Container(
                    height: getHeight(54),
                    width: getWidth(353),
                    decoration: BoxDecoration(
                      color: Kprimary,
                      borderRadius: BorderRadius.circular(getHeight(33))
                    ),
                    child: Center(child:Text('Connexion',
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
                    onTap: null,
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

              SizedBox(height: getHeight(54),),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: getWidth(20),),
                  Padding(
                    padding:  EdgeInsets.only(top: getHeight(8)),
                    child: SvgPicture.asset('assets/icons/Line 40.svg'),
                  ),
                  SizedBox(width: getWidth(8),),
                  Text('Continuer avec',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: getHeight(16)
                  ),
                  ),
                  SizedBox(width: getWidth(8),),
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
      ),

    ),);
  }
}

