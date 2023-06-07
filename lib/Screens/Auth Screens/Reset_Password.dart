import 'package:famili_shop_app/Const.dart';
import 'package:famili_shop_app/Screens/Auth%20Screens/Login.dart';
import 'package:famili_shop_app/Size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class ResetPage extends StatefulWidget {
  const ResetPage({Key? key}) : super(key: key);

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  bool _obscureText = true;

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
                    left: getWidth(22),child: Image.asset("assets/illustrations/key 1.png"),
                  )
                ],
              )
          ),
          SizedBox(height: getHeight(26),),
          Center(
            child: Text('Récupérez votre mot de passe',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getHeight(17),
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          SizedBox(height: getHeight(23),),
          Center(
            child: Text("Insérez votre nouveau mot de passe",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: getHeight(14),
              ),

            ),
          ),
          SizedBox(height: getHeight(32),),

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
          SizedBox(height: getHeight(20),),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:getWidth(20) ),
            child: TextFormField(
              controller: _confirmpasswordController,

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
                  hintText: 'Confirmer le Mot de passe',

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
          SizedBox(height: getHeight(46),),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: getWidth(22)),
            child: InkWell(
              onTap: (){
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => const LoginPage(),
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
                child: Center(child:Text('Modifier le mot passe  ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getHeight(14),
                      fontWeight: FontWeight.w500
                  ),
                )),
              ),
            ),
          ),


        ],
      )
      ,
    ));
  }
}
