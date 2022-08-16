import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../../widgets/product_item.dart';
import '../../widgets/product.dart';
import 'package:google_fonts/google_fonts.dart'; //폰트들은 임의로 설정했음.나중에 변경할 예정

final List<String> imgList = [
  'assets/images/자취추천광고1.png',
  'assets/images/자취추천광고2.png',
  'assets/images/자취추천광고3.png',
  'assets/images/자취추천광고4.png'
];


class Home_Main extends StatefulWidget {
  @override
  _Main createState() => _Main();
}

class _Main extends State<Home_Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(0),
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                    children: [
                      Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 300,
                                child: Swiper(
                                    control: SwiperControl(),
                                    pagination: SwiperPagination(),
                                    itemCount: imgList.length,
                                    itemBuilder: (BuildContext context, int index){
                                      return Image.asset(imgList[index]);
                                    }
                                ),
                              ),
                              SizedBox(height: 25),
                              Padding(
                                padding: EdgeInsets.only(left: 16, bottom: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("고객님을 위한 추천 상품",
                                        style: GoogleFonts.nanumGothic(
                                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text("See All",
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productList.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: SizedBox(
                                      width: 150,
                                      child: ProductItem(product: productList[index]),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 25),
                              Padding(
                                padding: EdgeInsets.only(left: 16, bottom: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("New Arrival",
                                        style: GoogleFonts.nanumGothic(
                                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text("See All",
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productList.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: SizedBox(
                                      width: 150,
                                      child: ProductItem(product: productList[index]),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    ]
                ),
              )
            ]
        )
    );
  }
}


