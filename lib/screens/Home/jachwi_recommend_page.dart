import 'package:flutter/material.dart';
import '../../widgets/product_item.dart';
import 'home_banner.dart';
import '../../widgets/product.dart';
import 'package:google_fonts/google_fonts.dart'; //폰트들은 임의로 설정했음.나중에 변경할 예정

class JachwiReommendPage extends StatelessWidget {
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
      ],
    );
  }
}
