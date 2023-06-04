import 'package:famili_shop_app/Const.dart';
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
  List<int> counters = List.generate(10, (index) => 1);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
          body: SizedBox(
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
                        padding:
                        EdgeInsets.only(left: getWidth(54), top: getHeight(28)),
                        child: Text(
                          'Panier',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: getHeight(16),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    height: getHeight(640),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              Container(
                                height: getHeight(107),
                              ),
                              Positioned(
                                top: getHeight(17),
                                left: getWidth(93),
                                child: Text(
                                  'Eau de parfum Homme',
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
                                child: Image.asset(
                                    "assets/illustrations/Rectangle 71.png"),
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
                                  "3 articles seulement",
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
                                  "12,100DA",
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
                  child: InkWell(
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
                  ),

              ],
            ),
          ),
        ));
  }
}
