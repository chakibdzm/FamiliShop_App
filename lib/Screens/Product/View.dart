import 'package:famili_shop_app/Const.dart';
import 'package:famili_shop_app/Size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(

        backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
               height: getHeight(75),
               child: Stack(
                 children: [
                   Positioned(child: InkWell(
                     child: SvgPicture.asset("assets/icons/arrow.svg",height: getHeight(17),),
                   ),
                   top: getHeight(28),
                     left: getWidth(17),
                   ),
                   Positioned(child:Container(
                     height: getHeight(40),
                     width: getWidth(187),
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
                           borderSide:  BorderSide(
                             width: 1,
                             color: Kprimary,
                           ),
                         ),

                         prefixIconConstraints: const BoxConstraints(maxHeight: 25),

                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(34.0),
                             borderSide:  BorderSide(
                               width: 1,
                               color: Kprimary,
                             )),
                         fillColor:Colors.white,
                         filled: true,
                         hintText: 'Chercher Sur FamiliShop',

                         hintStyle: TextStyle(
                           fontSize: getHeight(12),
                           fontWeight: FontWeight.w400,
                           color: Color(0xFF565555),
                         ),
                         prefixIcon: Padding(
                           padding:  EdgeInsets.only(left: getWidth(15),right: getWidth(5)),
                           child: SvgPicture.asset("assets/icons/search.svg"),
                         )

                       ),
                     ),
                   ),
                   top: getHeight(20),
                     left: getWidth(60),


                   ),
                   
                   Positioned(child: InkWell(child: SvgPicture.asset("assets/icons/panier.svg")),
                   top: getHeight(21),
                     right: getWidth(71),
                   ),
                   
                   Positioned(child: InkWell(child:SvgPicture.asset("assets/icons/carbon_overflow-menu-vertical.svg"),),
                   top: getHeight(18),
                     right: getWidth(20),
                   
                   )





                 ],
               ),

             ),
              Container(
                height: getHeight(332),
                width: getWidth(393),
                decoration: BoxDecoration(
                  color: Color(0xFFF8F8F8)
                ),
                child: Stack(
                  children: [
                    Positioned(child: Image.asset('assets/illustrations/sete-3-1-removebg-preview 1.png'),
                    left: getWidth(42),
                    ),
                    Positioned(child: Container(
                        height: getHeight(31),
                        width: getWidth(55),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(getHeight(25))
                        ),
                        child: Center(child: InkWell(
                            onTap: null,
                            child: SvgPicture.asset('assets/illustrations/Vector (3).svg'))),
                    ),
                      bottom: getHeight(19),
                      right: getWidth(20),

                    ),

                    Positioned(child: Container(
                      height: getHeight(31),
                      width: getWidth(55),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(getHeight(25))
                      ),
                      child: Center(child: InkWell(
                          onTap: null,
                          child: Text('1/2',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: getHeight(14)
                          ),),
                      )),
                    ),
                      bottom: getHeight(19),
                      left: getWidth(20),

                    )
                  ],
                )



              ),

            SizedBox(height: getHeight(16),),
            Padding(
              padding:  EdgeInsets.only(left: getWidth(21)),
              child: Text('Smart Watch - T500',
              style: TextStyle(
                color: Colors.black,
                fontSize: getHeight(22),
                  fontWeight: FontWeight.w500

              ),
              ),
            ),
            SizedBox(height: getHeight(12),),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: getWidth(21),),
                Text('12,100 DA',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: getHeight(20)
                ),
                ),

                RichText(
                  text: new TextSpan(
                      text: '  ',
                    children: <TextSpan>[
                      new TextSpan(
                        text: '14,750DA',
                        style: new TextStyle(
                          fontSize: getHeight(14),
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,

                        ),
                      ),


                    ],
                  ),
                )

              ],
            ),
            SizedBox(height: getHeight(16),),
            Padding(padding: EdgeInsets.symmetric(horizontal: getWidth(20)),

            child: Text('Smart Watch T500 est une montre intelligente connecté magnifique et adorable conçu pour votre vie active. La montre a été développée dans le but de satisfaire tous les amateurs de sport.',
            style: TextStyle(
              color: Colors.black,
              fontSize: getHeight(12),
              fontWeight: FontWeight.w500
            ),
            ),),
            SizedBox(height: getHeight(19),),
            Padding(
              padding:  EdgeInsets.only(left: getWidth(20)),
              child: Text('COULEURS DISPONIBLES',
              style: TextStyle
                (
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: getHeight(13)

              ),),
            ),
            SizedBox(height: getHeight(12),),
            Padding(
              padding:  EdgeInsets.only(left: getWidth(20)),
              child: Container(
                width: getWidth(21),
                height: getHeight(21),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),

              ),
            ),



            Spacer(),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getWidth(107)),
              child: InkWell(onTap: null,
              child: Container(
                height: getHeight(46),
                width: getWidth(180),
                decoration: BoxDecoration(
                  color: Kprimary,
                  borderRadius: BorderRadius.circular(getHeight(34))
                ),
                child: Center(
                  child: Text(
                    'AJOUTER AU PANIER',

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getHeight(14),
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
              ),
            ),
            SizedBox(height: getHeight(19),),


          ],
        ),
      ),
      
    ));
  }
}
