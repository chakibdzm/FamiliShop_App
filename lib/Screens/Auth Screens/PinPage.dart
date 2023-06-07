import 'package:famili_shop_app/Const.dart';
import 'package:famili_shop_app/Screens/Auth%20Screens/Reset_Password.dart';
import 'package:famili_shop_app/Size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PinPage extends StatefulWidget {
  const PinPage({Key? key}) : super(key: key);

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getHeight(133),),
          Center(
              child: Stack(
                children: [
                  SizedBox(
                    height: getHeight(87),
                    width: getWidth(87),
                  ),
                  Positioned(child: SvgPicture.asset("assets/illustrations/Group 393.svg")),

                  Positioned(left: getHeight(9),
                    top: getHeight(9),child: SvgPicture.asset("assets/illustrations/Group 394.svg"),
                  ),
                  Positioned(top: getHeight(22),
                    left: getWidth(22),child: Image.asset("assets/illustrations/email 1.png"),
                  )
                ],
              )
          ),
          SizedBox(height: getHeight(26),),
          Center(
            child: Text('Vérifier votre email',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getHeight(17),
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          SizedBox(height: getHeight(23),),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: getWidth(30)),
            child: Text("Nous avons envoyé un lien de réinitialisation du mot de passe à mn.adem@esi-sbadz",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: getHeight(15),
              ),

            ),
          ),
          SizedBox(height: getHeight(32),),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal:getWidth(22) ),
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
                hintText: 'Enter le code ',

                hintStyle: TextStyle(

                  fontSize: getHeight(12),
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF565555),
                ),

              ),
            ),
          ),
          SizedBox(height: getHeight(46),),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: getWidth(22)),
            child: InkWell(
              onTap: (){
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => const ResetPage(),
    ),
    );
    },

              child: Container(
                height: getHeight(54),
                width: getWidth(353),
                decoration: BoxDecoration(
                    color: Kprimary,
                    borderRadius: BorderRadius.circular(getHeight(33))
                ),
                child: Center(child:Text('Valider ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getHeight(16),
                      fontWeight: FontWeight.w600
                  ),
                )),
              ),
            ),
          ),
          SizedBox(height: getHeight(31),),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: getWidth(60)),
            child: Text("N'a pas reçu l'e-mail ? cliquez pour renvoyer",
            style: TextStyle(
              color: Colors.black,
              fontSize: getHeight(14),
              fontWeight: FontWeight.w600
            ),

            ),
          )


        ],
      )
      ,
    ));
  }
}
