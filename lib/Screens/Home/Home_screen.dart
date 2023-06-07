import 'package:famili_shop_app/Const.dart';
import 'package:famili_shop_app/Screens/Panier/Panier.dart';
import 'package:famili_shop_app/Screens/Product/Allproducts.dart';
import 'package:famili_shop_app/Screens/Product/View.dart';
import 'package:famili_shop_app/Size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


import '../Auth Screens/Api/ProductModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];
  List<Product> offers = [];
  List<Product> shop = [];

  bool isLoading = true;
  Future<void> fetchProducts() async {

      final response = await http.get(Uri.parse('https://familishop.onrender.com/products/'));
      if (response.statusCode == 200) {
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isLoading = false;
          });
        });
        final data = jsonDecode(response.body);

        setState(() {
          products = List<Product>.from(data.map((productData) => Product(
            // Create Product objects based on fetched data
            id: productData['id'],
            title: productData['title'],
            description: productData['description'],
            quantity: productData['quantity'],
            price: productData['price'],
            promotionStatus: productData['promotion_status'],
            discountPercentage: productData['discount_percentage'],
            collectionName: productData['collection_name'],
            srcImage: productData['src_image'],
            altImage: productData['alt_image'],
            taille: productData['taille'],
            colors: productData['colors'],
            comments: List<String>.from(productData['comments']),
          ))).toList();
          offers = List<Product>.from(data.map((productData) => Product(
            // Create Product objects based on fetched data
            id: productData['id'],
            title: productData['title'],
            description: productData['description'],
            quantity: productData['quantity'],
            price: productData['price'],
            promotionStatus: productData['promotion_status'],
            discountPercentage: productData['discount_percentage'],
            collectionName: productData['collection_name'],
            srcImage: productData['src_image'],
            altImage: productData['alt_image'],
            taille: productData['taille'],
            colors: productData['colors'],
            comments: List<String>.from(productData['comments']),
          ))).toList();
          shop = List<Product>.from(data.map((productData) => Product(
            // Create Product objects based on fetched data
            id: productData['id'],
            title: productData['title'],
            description: productData['description'],
            quantity: productData['quantity'],
            price: productData['price'],
            promotionStatus: productData['promotion_status'],
            discountPercentage: productData['discount_percentage'],
            collectionName: productData['collection_name'],
            srcImage: productData['src_image'],
            altImage: productData['alt_image'],
            taille: productData['taille'],
            colors: productData['colors'],
            comments: List<String>.from(productData['comments']),
          ))).toList();
        });
      }
      else {
        throw Exception('Failed to fetch products');
      }

  }
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }


  @override
  Widget build(BuildContext context) {
    products.shuffle();
    offers.shuffle();
    shop.shuffle();
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(75),
                child: Stack(
                  children: [

                    Positioned(top: getHeight(20),
                      left: getWidth(20),child: SizedBox(
                      height: getHeight(40),
                      width: getWidth(289),
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
                              borderSide: BorderSide(
                                width: 1,
                                color: Kprimary,
                              ),
                            ),

                            prefixIconConstraints: const BoxConstraints(
                                maxHeight: 25),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(34.0),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Kprimary,
                                )),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Chercher Sur FamiliShop',

                            hintStyle: TextStyle(
                              fontSize: getHeight(12),
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF565555),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left: getWidth(15), right: getWidth(5)),
                              child: SvgPicture.asset("assets/icons/search.svg"),
                            )

                        ),
                      ),
                    ),


                    ),

                    Positioned(top: getHeight(21),
                      right: getWidth(18),child: InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PanierPage(),
                              ),
                            );
                          },

                          child: SvgPicture.asset(
                        "assets/icons/panier.svg")),
                    ),

                  ],
                ),
              ),
              SizedBox(height: getHeight(5),),
              Container(
                height: getHeight(202),
                width: getWidth(393),
                  color: Klight,


                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: getWidth(22),top: getHeight(9)),
                      child: Text('Stock Limité',
                      style: TextStyle
                        (
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: getHeight(18),
                      ),
                      ),
                    ),
                    SizedBox(height: getHeight(8),),
                    Padding(
                      padding:  EdgeInsets.only(left: getWidth(22)),
                      child: Text('Termine dans : 11j',
                        style: TextStyle
                          (
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: getHeight(18),
                        ),
                      ),
                    ),
                    SizedBox(height: getHeight(11),),
                    SizedBox(
                      height: getHeight(105),

                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:  EdgeInsets.only(right: getWidth(5),left: getWidth(5)),
                            child: Container(
                              width: getWidth(98),
                              height: getHeight(125),
                              decoration:BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(getHeight(18))
                              ),
                                child: Center(
                                  child:
                                  isLoading ?
                                  SizedBox(
                                    height: getHeight(20),
                                    width: getWidth(20),
                                    child: CircularProgressIndicator(strokeWidth: getWidth(5),
                                    ),
                                  )
                                 : InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductPage(id:products[index].id),
                                        ),
                                      );
                                    },
                                   child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        SizedBox(
                                            height: getHeight(85),
                                            width: getWidth(98),
                                            child:
                                            ClipRRect(
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(getHeight(18)),topLeft:Radius.circular(getHeight(18)) ),
                                                child: Image.network('https:${products[index].srcImage}',fit: BoxFit.fill,))),

                              Padding(
                                padding:  EdgeInsets.only(left: getWidth(10)),
                                child: Text('${products[index].price.toStringAsFixed(2)} DA',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                        fontSize: getHeight(13)
                                    ),
                                ),
                              ),


                                      ],
                                    ),
                                 ),
                                ),
                            ),
                          );

                        },
                      ),
                    ),
                    SizedBox(height: getHeight(14),),


                  ],
                ),
              ),
              SizedBox(height: getHeight(31),),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: getHeight(110),
                      width: getWidth(110),
                      decoration: const BoxDecoration(

                      ),
                      child: Stack(
                        children: [
                          Positioned(child: ClipRRect(
                              borderRadius: BorderRadius.circular(getHeight(8)),
                              child: Image.asset("assets/illustrations/Rectangle 104.png"))),
                          Positioned(top: getHeight(37),
                            left: getWidth(13),child: Text('    OFFERS \n HIGH TECH',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: getHeight(14),
                                fontWeight: FontWeight.w700
                            ),

                          ),

                          )

                        ],
                      ),


                    ),
                    SizedBox(width: getWidth(8),),
                    Container(
                      height: getHeight(110),
                      width: getWidth(110),
                      decoration: const BoxDecoration(

                      ),
                      child: Stack(
                        children: [
                          Positioned(child: ClipRRect(
                              borderRadius: BorderRadius.circular(getHeight(8)),
                              child: Image.asset("assets/illustrations/Rectangle 104 (1).png"))),
                          Positioned(top: getHeight(37),
                            left: getWidth(13),child: Text('NOUVELLES \n ARRIVEES',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: getHeight(14),
                                fontWeight: FontWeight.w700
                            ),

                          ),

                          )

                        ],
                      ),


                    ),
                    SizedBox(width: getWidth(8),),
                    Container(
                      height: getHeight(110),
                      width: getWidth(110),
                      decoration: const BoxDecoration(

                      ),
                      child: Stack(
                        children: [
                          Positioned(child: ClipRRect(
                              borderRadius: BorderRadius.circular(getHeight(8)),
                              child: Image.asset("assets/illustrations/Rectangle 104 (2).png", ))),
                          Positioned(top: getHeight(37),
                            left: getWidth(13),child: Text('    OFFERS \n SPECIALES',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: getHeight(14),
                                fontWeight: FontWeight.w700
                            ),

                          ),

                          )

                        ],
                      ),


                    ),

                  ],

                ),
              ),
              SizedBox(height: getHeight(18),),
              Padding(
                padding:  EdgeInsets.only(left: getWidth(20)),
                child: Row(
                  children: [
                    Text('Meilleures Offres Ramadan',
                    style: TextStyle(
                      fontWeight:FontWeight.w700,
                      fontSize: getHeight(18)

                    ),

                    ),
                    SizedBox(width: getWidth(45),),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductAllPage(),
                          ),
                        );
                      },
                      child: Text('Voir tous',
                      style: TextStyle(
                        color: Kprimary,
                        fontWeight: FontWeight.w700,
                        fontSize: getHeight(15)

                      ),

                      ),
                    )

                  ],
                ),
              ),
              SizedBox(height: getHeight(11),),
              Padding(
                padding:  EdgeInsets.only(left: getWidth(20)),
                child: SizedBox(
                  height: getHeight(157),

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: offers.length,
                    itemBuilder: (BuildContext context, int index) {


                      return



                        Padding(
                        padding:  EdgeInsets.only(right: getWidth(5),left: getWidth(5)),
                        child:


                        Container(
                          width: getWidth(107),
                          height: getHeight(157),
                          decoration:BoxDecoration(
                              color: const Color(0x38E1DEDE),
                              borderRadius: BorderRadius.circular(getHeight(18))
                          ),
                          child: isLoading ?
                          Padding(
                            padding:  EdgeInsets.only(top: getHeight(60),bottom: getHeight(60),left: getWidth(40),right: getWidth(40)),
                            child: SizedBox(
                              height: getHeight(20),
                              width: getWidth(20),
                              child: CircularProgressIndicator(strokeWidth: getWidth(5),
                              ),
                            ),
                          ):InkWell(
                               onTap:  (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductPage(id:offers[index].id),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                    child: SizedBox(
                                    height:getHeight(107),
                                    width:getWidth(106),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(getHeight(15)),
                                        child: Image.network('https:${offers[index].srcImage}',fit: BoxFit.fill,)))),
                                SizedBox(height: getHeight(7),),
                                Padding(
                                  padding:  EdgeInsets.only(left: getWidth(7)),
                                  child: Text(offers[index].title,
                                    overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getHeight(14),
                                    fontWeight: FontWeight.w700
                                  ),
                                  ),
                                ),
                                SizedBox(height: getHeight(6),),
                                Padding(
                                  padding:  EdgeInsets.only(left: getWidth(7)),
                                  child: Text('${offers[index].price.toStringAsFixed(2)}DA',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: getHeight(12),
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),

                        ),
                      );


                    },
                  ),
                ),
              ),
              SizedBox(height: getHeight(35),),
              Padding(
                padding:  EdgeInsets.only(left: getWidth(22)),
                child: Row(
                  children: [
                    Text("Offres spéciales",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getHeight(18),
                      fontWeight: FontWeight.w700
                    ),
                    ),

                    SizedBox(width: getWidth(138),),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductAllPage(),
                          ),
                        );
                      },
                      child: Text('Voir tous',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: getHeight(15),
                        color:Kprimary
                      ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: getHeight(11),),
              Padding(
                padding: EdgeInsets.only(left: getWidth(20)),
                child: SizedBox(
                  height: getHeight(157),

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: shop.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding:  EdgeInsets.only(right: getWidth(5),left: getWidth(5)),
                        child: Container(
                          width: getWidth(107),
                          height: getHeight(157),
                          decoration:BoxDecoration(
                              color: const Color(0x38E1DEDE),
                              borderRadius: BorderRadius.circular(getHeight(18))
                          ),
                          child: isLoading ?
                          Padding(
                            padding:  EdgeInsets.only(top: getHeight(60),bottom: getHeight(60),left: getWidth(40),right: getWidth(40)),
                            child: SizedBox(
                              height: getHeight(20),
                              width: getWidth(20),
                              child: CircularProgressIndicator(strokeWidth: getWidth(5),
                              ),
                            ),
                          ):InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductPage(id:shop[index].id),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(child: SizedBox(
                                    height:getHeight(107),
                                    width:getWidth(106),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(getHeight(15)),
                                        child: Image.network('https:${shop[index].srcImage}',
                                        fit: BoxFit.fill,
                                        )))),
                                SizedBox(height: getHeight(7),),
                                Padding(
                                  padding:  EdgeInsets.only(left: getWidth(7)),
                                  child: Text(shop[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: getHeight(14),
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                                SizedBox(height: getHeight(6),),
                                Padding(
                                  padding:  EdgeInsets.only(left: getWidth(7)),
                                  child: Text('${shop[index].price.toStringAsFixed(2)}DA',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: getHeight(12),
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),

                        ),
                      );


                    },
                  ),
                ),
              ),


              SizedBox(height: getHeight(35),),
              Padding(
                padding:  EdgeInsets.only(left: getWidth(22)),
                child: Row(
                  children: [
                    Text("Nouvelle arrivées",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: getHeight(18),
                          fontWeight: FontWeight.w700
                      ),
                    ),

                    SizedBox(width: getWidth(138),),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductAllPage(),
                          ),
                        );
                      },
                      child: Text('Voir tous',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: getHeight(15),
                            color:Kprimary
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: getHeight(11),),
              Padding(
                padding:  EdgeInsets.only(left: getWidth(20)),
                child: SizedBox(
                  height: getHeight(157),

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding:  EdgeInsets.only(right: getWidth(5),left: getWidth(5)),
                        child: Container(
                          width: getWidth(107),
                          height: getHeight(157),
                          decoration:BoxDecoration(
                              color: const Color(0x38E1DEDE),
                              borderRadius: BorderRadius.circular(getHeight(18))
                          ),
                          child:
                          isLoading ?
                          Padding(
                            padding:  EdgeInsets.only(top: getHeight(60),bottom: getHeight(60),left: getWidth(40),right: getWidth(40)),
                            child: SizedBox(
                              height: getHeight(20),
                              width: getWidth(20),
                              child: CircularProgressIndicator(strokeWidth: getWidth(5),
                              ),
                            ),
                          ):InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductPage(id:products[index].id),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(child: SizedBox(
                                    height:getHeight(107),
                                    width:getWidth(106),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(getHeight(15)),
                                        child: Image.network('https:${products[index].srcImage}',fit: BoxFit.fill,)))),
                                SizedBox(height: getHeight(7),),
                                Padding(
                                  padding:  EdgeInsets.only(left: getWidth(7)),
                                  child: Text(products[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: getHeight(14),
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                                SizedBox(height: getHeight(6),),
                                Padding(
                                  padding:  EdgeInsets.only(left: getWidth(7)),
                                  child: Text('${products[index].price.toStringAsFixed(2)}DA',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: getHeight(12),
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),

                        ),
                      );


                    },
                  ),
                ),
              ),




            ],
          ),
        ),
      ),

    ),);
  }
}
