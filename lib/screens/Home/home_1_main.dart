import 'package:flutter/material.dart';
import '../../widgets/product_item.dart';
import 'home_banner.dart';
import '../../widgets/product.dart';
import 'home_recommend_review.dart';
import 'package:google_fonts/google_fonts.dart'; //폰트들은 임의로 설정했음.나중에 변경할 예정

class Home_Main extends StatefulWidget {
  @override
  _Main createState() => _Main();
}

class _Main extends State<Home_Main> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 335,
          child: HomeBannerItem(),
        ),
        SizedBox(height: 25),
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 16),
          child: Text("고객님을 위한 추천 상품",
              style: GoogleFonts.nanumGothic(
                  fontSize: 18.0, fontWeight: FontWeight.bold)),
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
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text("자취에 진심인 후기 모음집",
              style: GoogleFonts.nanumGothic(
                  fontSize: 18.0, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 15),
        Container(
          height: 360,
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 40),
            scrollDirection: Axis.horizontal,
            // 1
            itemBuilder: (context, index) => SizedBox(
              width: 320,
              child: RecommendReview(
                item: productList[index],
              ),
            ),
            itemCount: productList.length,
          ),
        )
      ],
    );
  }
}
