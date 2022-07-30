import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; //폰트들은 임의로 설정했음.나중에 변경할 예정
import 'product.dart';
import 'package:intl/intl.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final bool? lineChange;
  final double? textContainerHeight;

  const ProductItem(
      {Key? key,
      required this.product,
      this.lineChange = false,
      this.textContainerHeight = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Image.network(
              product.image ?? "assets/images/home_banner0.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: textContainerHeight,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: "${product.name} ${lineChange == true ? "\n" : ""}",
                    style: GoogleFonts.nanumGothic(fontSize: 16.0)),
                TextSpan(
                    text: "${product.discountRate}",
                    style: GoogleFonts.nanumGothic(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.red)),
                TextSpan(
                    text: discountPrice(
                        product.price ?? 0, product.discountRate ?? 0),
                    style: GoogleFonts.nanumGothic(
                        fontWeight: FontWeight.bold, fontSize: 16.0)),
                TextSpan(
                  text: "${product.price.toString().numberFormat()}원",
                  style: GoogleFonts.nanumGothic(
                    fontSize: 14.0,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ]),
            ),
          ),
        )
      ],
    );
  }

  String discountPrice(int price, int discountRate) {
    double doubleDiscountRate = ((100 - discountRate) / 100);
    int discountPrice = (price * doubleDiscountRate).toInt();
    return "${discountPrice.toString().numberFormat()}원";
  }
}

extension StringExtension on String {
  String numberFormat() {
    final formatter = NumberFormat("#,###");
    return formatter.format(int.parse(this));
  }
}
