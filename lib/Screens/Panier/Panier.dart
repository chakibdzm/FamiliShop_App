import 'package:famili_shop_app/Const.dart';
import 'package:famili_shop_app/Screens/Product/api-service.dart';
import 'package:famili_shop_app/Size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PanierPage extends StatefulWidget {
  const PanierPage({Key? key}) : super(key: key);

  @override
  State<PanierPage> createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  var cpt = 1;


  List<Map<String, dynamic>> products = [];
  final _location = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchPanier().then((result) {
      setState(() {
        products = result;
      });
    });
  }
  List<int> counters = List.generate(10, (index) => 1);
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
          body: SizedBox(
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: SingleChildScrollView(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getHeight(75),
                      width: getWidth(393),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: getWidth(15),top: getHeight(20)),
                            child: InkWell( onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_outlined,size: getHeight(35),)),
                          ),
                          Padding(
                            padding:
                            EdgeInsets.only(left: getWidth(28), top: getHeight(28)),
                            child: Text(
                              'Panier',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: getHeight(16),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    products.isEmpty?
                        SizedBox(
                            height: getHeight(640),

                            child: Center(child: Column(
                              children: [
                                SizedBox(height: getHeight(320),),
                                Text('List is empty',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getHeight(16)
                                ),
                                ),
                                SizedBox(height: getHeight(15),),
                                
                                Icon(Icons.shopping_cart_outlined,color: Kprimary
                                  ,size: getHeight(50),)

                              ],
                            ),))
                    :
                    SizedBox(
                        height: getHeight(640),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: products.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                children: [
                                  Container(
                                    height: getHeight(107),
                                  ),
                                  Positioned(
                                    top: getHeight(17),
                                    left: getWidth(93),
                                    right:getWidth(85),
                                    child: Text(
                                      products[index]['product_name'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: getHeight(16),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: getWidth(17),
                                    child: SvgPicture.asset(
                                        "assets/illustrations/Line 42.svg"),
                                  ),
                                  Positioned(
                                    left: getWidth(17),
                                    top: getHeight(17),
                                    bottom:getHeight(35),
                                    child: SizedBox(
                                        height:getHeight(60),
                                        width:getWidth(65),
                                        child: ClipRRect(
                                            borderRadius:BorderRadius.circular(getHeight(10)),
                                            child: Image.network('https:${products[index]["alt_image"]}',fit: BoxFit.fill,))),
                                  ),
                                  Positioned(
                                    top: getHeight(40),
                                    left: getWidth(93),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Volume :",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                              fontSize: getHeight(12)),
                                        ),
                                        SizedBox(
                                          width: getWidth(2),
                                        ),
                                        Text(
                                          "80ml",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: getHeight(12),
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    left: getWidth(93),
                                    top: getHeight(60),
                                    child: Text(
                                      "${products[index]["product_quantity"]} articles seulement",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: getHeight(12),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Positioned(
                                    right: getWidth(23),
                                    top: getHeight(17),
                                    child: Text(
                                      '${products[index]['product_price']}DA',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: getHeight(16),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: getHeight(6),
                                    left: getWidth(17),
                                    child: InkWell(
                                      onTap:()async{
                                        final token = await getToken();
                                        await deleteProductFromCart(products[index]["product_id"], token);

                                      },
                                      child: Row(
                                        children: [
                                          Icon(Icons.delete, color: Kprimary),
                                          Text(
                                            'Supprimer',
                                            style: TextStyle(
                                                color: Kprimary,
                                                fontWeight: FontWeight.w500,
                                                fontSize: getHeight(14)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: getHeight(6),
                                    right: getWidth(17),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: (){setState(() {
                                            counters[index]--;
                                          });},
                                          child: Container(
                                            width: getWidth(21),
                                            height: getHeight(21),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Kprimary,
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                                size: getHeight(20),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: getWidth(10),
                                        ),
                                        Text(
                                          counters[index].toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: getHeight(16)),
                                        ),
                                        SizedBox(
                                          width: getWidth(10),
                                        ),
                                        InkWell(onTap: (){setState(() {
                                          counters[index]++;
                                        });},
                                          child: Container(
                                            width: getWidth(21),
                                            height: getHeight(21),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Kprimary,
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: getHeight(20),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            })),
                    SizedBox(height: getHeight(19),),
                    Center(
                      child: Row(
                        children: [
                          SizedBox(width: getWidth(20),),
                          InkWell(
                            onTap: () async{
                              final token = await getToken();
                              await postOrderWithAddress(token,_location.text);
                            },
                            child: Container(
                              height: getHeight(50),
                              width: getWidth(180),
                              decoration: BoxDecoration(
                                  color: Kprimary,
                                  borderRadius: BorderRadius.circular(getHeight(34))
                              ),

                              child:Center(
                                child: Text("Commander",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: getHeight(14),
                                  fontWeight: FontWeight.w600
                                ),
                                ),
                              )
                              ),
                            ),
                          SizedBox(width: getWidth(20),),
                          SizedBox(
                            width: getWidth(150),
                            height: getHeight(50),
                            child: TextFormField(
                              controller: _location,
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
                                  hintText: 'Location',

                                  hintStyle: TextStyle(
                                    fontSize: getHeight(12),
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF565555),
                                  ),
                                  prefixIcon: Padding(
                                    padding:  EdgeInsets.only(left: getWidth(8)),
                                    child: Icon(Icons.location_on,color: Kprimary,),
                                  )

                              ),
                            ),
                          ),
                        ],
                      ),
                      ),

                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
