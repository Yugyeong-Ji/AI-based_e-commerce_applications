import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:baljachwi_project/screens/product_details/utils.dart';
import 'package:intl/intl.dart';

import '../../widgets/product.dart';

class productDescription extends StatefulWidget {
  final Product product;

  productDescription({Key? key, required this.product}) : super(key: key);

  @override
  _productDescription createState() => _productDescription(this.product);
}

class _productDescription extends State<productDescription> {
  final Product product;
  List starInform = [];
  _productDescription(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductContent(),
    );
  }

  Widget ProductContent() {
    return ListView(
      children: <Widget>[
        imageSlider(),
        pageOfTop(),
        SizedBox(height: 30),
        pageOfMiddle(),
        pageOfBottom(),
      ],
    );
  }

// pageOfTop : 상품 요약정보
  Widget pageOfTop() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          productSummary(),
        ],
      ),
    );
  }

// pageOfMiddle : 상품 상세정보
  Widget pageOfMiddle() {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Container(
          child: Image.asset(this.product.thumbnail as String),
        ),
      ],
    );
  }

// pageOfBottom: footer
  Widget pageOfBottom() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: <Widget>[
            Text(
              '고객센터 1544 - 1234',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
            Text(
              '평일 오전 9시 - 오후 6시 운영',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productSummary() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        starRating(),
        SizedBox(height: 5),
        Text(
          "[" + (this.product.manufacturer as String) + "] " + this.product.name, // 상품 이름
          style: TextStyle(
            fontSize: 23,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        priceInform(),
        thinDividingLine(context, 20.0, 20.0),
        Row(
          children: [
            Icon(Icons.fire_truck_outlined, color: Colors.black54),
            Text(
              '  ' + (this.product.distributor as String), // 유통사 정보
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ],
        ),
        thinDividingLine(context, 20.0, 20.0),
        Row(
          children: [
            Icon(Icons.storefront_outlined, color: Colors.black54),
            Text(
              '  ' + (this.product.seller as String), // 판매자 정보
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ],
        )
      ]),
    );
  }

  Widget priceInform() {
    var priceFormat = NumberFormat('###,###,###,###원');
    int sellingPrice =
        product.price - (product.price * product.discountRate * 0.001).toInt();

    if (product.discountRate == 0)
      return Text(
        priceFormat.format(this.product.price),
        style: TextStyle(
          fontSize: 27,
          color: Colors.red,
        ),
      );
    else
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                product.discountRate.toString() + '% ',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
              Text(
                priceFormat.format(this.product.price),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          Text(
            priceFormat.format(sellingPrice), // 판매가
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
  }

  Widget imageSlider() {
    List<String> imagePath = (this.product.image) as List<String>;

    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0, // 슬라이더 높이
        autoPlay: true, // 자동 슬라이딩 활성화
      ),
      items: imagePath.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width, // 기기 가로 사이즈 받기
              margin: EdgeInsets.symmetric(horizontal: 4.0), // 좌우 여백 설정
              child: ClipRRect(
                // 이미지 슬라이더 위젯
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(url, fit: BoxFit.cover),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget starRating() {
    var commaFormat = NumberFormat('###,###,###,###');
    starInform = getStarInform(this.product);
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          starRatingBar(22.0, starInform[0]),
          Text(
            ' ('+commaFormat.format(starInform[1])+')',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 17,
            ),
          ),
        ],
      )
    );
  }
}