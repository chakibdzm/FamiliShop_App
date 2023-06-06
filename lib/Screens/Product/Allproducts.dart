import 'dart:convert';

import 'package:famili_shop_app/Screens/Auth%20Screens/Api/ProductModel.dart';
import 'package:famili_shop_app/Size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;


import 'View.dart';


class ProductAllPage extends StatefulWidget {
  const ProductAllPage({Key? key}) : super(key: key);

  @override
  State<ProductAllPage> createState() => _ProductAllPageState();
}

class _ProductAllPageState extends State<ProductAllPage> {
  List<Product> products = [];

  Future<void> fetchProducts() async {

    final response = await http.get(Uri.parse('https://familishop.onrender.com/products/'));
    if (response.statusCode == 200) {

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
    SizeConfig().init(context);
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 3;
    return SafeArea(
        child: Scaffold(
      body: AnimationLimiter(
        child: GridView.count(
          physics:
              const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          childAspectRatio:0.65,

          padding: EdgeInsets.all(_w / 60),
          crossAxisCount: columnCount,
          children: List.generate(
            products.length,
            (int index) {


              return InkWell(
                onTap:  (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(id:products[index].id),
                    ),
                  );
                },
                child: AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  columnCount: columnCount,
                  child: ScaleAnimation(

                    duration: const Duration(milliseconds: 900),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: FadeInAnimation(
                      child: Container(

                        margin: EdgeInsets.only(
                            bottom: _w / 30, left: _w / 60, right: _w / 60),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 40,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: getHeight(150),
                              width: getHeight(150),
                              child:  ClipRRect(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(getHeight(18)),topLeft:Radius.circular(getHeight(18)) ),
                                  child: Image.network('https:${products[index].srcImage}',fit: BoxFit.fill,)),
                            ),

                            Padding(
                              padding:  EdgeInsets.only(left: getWidth(7)),
                              child: Text(products[index].title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getHeight(14),
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            SizedBox(height: getHeight(5),),
                            Padding(
                              padding:  EdgeInsets.only(left: getWidth(7)),
                              child: Text('${products[index].price.toStringAsFixed(2)}DA',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getHeight(14),
                                    fontWeight: FontWeight.w500
                                ),

                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}
