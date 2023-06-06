import 'dart:convert';

import 'package:famili_shop_app/Const.dart';
import 'package:famili_shop_app/Size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import '../Auth Screens/Api/ProductModel.dart';
import '../Panier/Panier.dart';
import 'api-service.dart';

class ProductPage extends StatefulWidget {
  final id;
  const ProductPage({required this.id,Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Map<String, dynamic> data = {};
  int currentIndex = 0;
  bool _ischanged = true;
  @override
  void initState() {
    super.initState();
    fetchData(widget.id).then((result) {
      setState(() {
        data = result;
      });
    });
  }




  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      data['src_image'],
      data['alt_image'],
    ];

    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(

        backgroundColor: Colors.white,
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
               height: getHeight(75),
               child: Stack(
                 children: [
                   Positioned(top: getHeight(28),
                     left: getWidth(17),child: InkWell(
                       onTap: () {
                         Navigator.pop(context);
                       },
                     child: SvgPicture.asset("assets/icons/arrow.svg",height: getHeight(17),),
                   ),
                   ),
                   Positioned(top: getHeight(20),
                     left: getWidth(60),child:SizedBox(
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
                           color: const Color(0xFF565555),
                         ),
                         prefixIcon: Padding(
                           padding:  EdgeInsets.only(left: getWidth(15),right: getWidth(5)),
                           child: SvgPicture.asset("assets/icons/search.svg"),
                         )

                       ),
                     ),
                   ),


                   ),

                   Positioned(top: getHeight(21),
                     right: getWidth(71),child: InkWell(
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (context) => PanierPage(),
                             ),
                           );
                         },



                         child: SvgPicture.asset("assets/icons/panier.svg")),
                   ),

                   Positioned(top: getHeight(18),
                     right: getWidth(20),child: InkWell(child:SvgPicture.asset("assets/icons/carbon_overflow-menu-vertical.svg"),),

                   )





                 ],
               ),

             ),
              Container(
                height: getHeight(332),
                width: getWidth(393),
                decoration: const BoxDecoration(
                  color: Color(0xFFF8F8F8)
                ),
                child: Stack(
                  children: [
                    Positioned(child: SizedBox(
                        height: getHeight(332),
                        width: getWidth(393),
                        child:
                        PageView.builder(
                          itemCount: imageUrls.length,
                          onPageChanged: (index) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Container(child: Image.network('https:'+imageUrls[index],fit: BoxFit.fill,));
                          },
                        ),





                        ),
                    ),
                    Positioned(bottom: getHeight(19),
                      right: getWidth(20),child: Container(
                        height: getHeight(31),
                        width: getWidth(55),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(getHeight(25))
                        ),
                        child: Center(child: InkWell(
                            onTap: () {
                              setState(() {
                                _ischanged = !_ischanged;
                              })
                              ;
                            },
                            child:
                            _ischanged?
                            SvgPicture.asset('assets/illustrations/Vector (3).svg')
                            :Icon(Icons.favorite,color: Colors.red,)
                        )),
                    ),

                    ),

                    Positioned(bottom: getHeight(19),
                      left: getWidth(20),child: Container(
                      height: getHeight(31),
                      width: getWidth(55),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(getHeight(25))
                      ),
                      child: Center(child: InkWell(
                          onTap: null,
                          child: Text((currentIndex+1).toString()+'/2',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: getHeight(14)
                          ),),
                      )),
                    ),

                    )
                  ],
                )



              ),

            SizedBox(height: getHeight(16),),
            Padding(
              padding:  EdgeInsets.only(left: getWidth(21)),
              child: Text(data["title"],
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
                Text(data['price'].toString()+' DA',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: getHeight(20)
                ),
                ),

                RichText(
                  text: TextSpan(
                      text: '  ',
                    children: <TextSpan>[
                      TextSpan(
                        text: (data['price']-((data['discount_percentage']/100)*data['price'])).toString(),
                        style: TextStyle(
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

            child: Text(data['description'],
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
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),

              ),
            ),



            const Spacer(),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: getWidth(107)),
              child: InkWell(onTap: () async {
                final token = await getToken();
                await postProductToCart(widget.id, 5,token);

              },
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

