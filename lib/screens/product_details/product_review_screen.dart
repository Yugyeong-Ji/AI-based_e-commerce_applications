import 'package:baljachwi_project/screens/product_details/product.dart';
import 'package:baljachwi_project/screens/product_details/product_review_detail_screen.dart';
import 'package:baljachwi_project/screens/product_details/review.dart';
import 'package:baljachwi_project/screens/product_details/star_bar_chart.dart';
import 'package:baljachwi_project/screens/product_details/utils.dart';
import 'package:baljachwi_project/widgets/LikeHateButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/accordion.dart';
import '../../widgets/dao.dart';
import '../../widgets/flutter_rating_bar/lib/flutter_rating_bar.dart';

class productReview extends StatefulWidget {
  final Product2 product;
  final User user;

  productReview({Key? key, required this.product, required this.user})
      : super(key: key);

  @override
  _productReview createState() => _productReview(product, user);
}

class _productReview extends State<productReview> {
  final Product2 product; // 상품정보
  final User user; // 유저 정보
  List<Review> reviews = []; // 리뷰 리스트
  _productReview(this.product, this.user);

  List starInform = [];

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                reviewStats(),
                SizedBox(
                  height: 20.0,
                ),
                loadReviews(),
                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void init() {
    this.reviews = getReviews(this.product);
    starInform = getStarInform(this.product);
  }

  Widget loadReviews() {
    final children = <Widget>[];
    for (int i = 0; i < reviews.length; i++) {
      children.add(contentsBox(reviews[i]));
      if (i != reviews.length - 1) // 마지막 게시글 밑에는 구분선 생략
        children.add(thinDividingLine(context, 19.0, 14.0));
    }
    return Column(
      children: children,
    );
  }

  Widget reviewStats() {
    return Column(
      children: [
        starRating(),
        starRatingDetail(),
        viewImagesOnly(),
      ],
    );
  }

  Widget starRatingDetail() {
    return Accordion(
      useAnotherTitle: true,
      title_at_showContent:
          Text('접기', style: TextStyle(color: Color(0xffDE900F))),
      title: Text('자세히 보기', style: TextStyle(color: Color(0xffDE900F))),
      content: AspectRatio(
        aspectRatio: 1.7,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          color: Colors.white,
          child: starBarChart(reviews: this.reviews),
        ),
      ),
    );
  }

  var commaFormat = NumberFormat('###,###,###,###');

  Widget starRating() {
    return Container(
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: (MediaQuery.of(context).size.width) * 0.70,
            child: starRatingBar(50, starInform[0]),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: (MediaQuery.of(context).size.width) * 0.20,
            child: Text(
              commaFormat.format(starInform[1]),
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget viewImagesOnly() {
    return Container(
      height: 100,
      width: (MediaQuery.of(context).size.width) * 0.90,
      color: Colors.black12,
      child: Text('이미지만 보기'),
    );
  }

  InkWell contentsBox(Review data) {
    String nameFormat = data.user.name[0] + '*' + data.user.name[2];
    return InkWell(
      hoverColor: Colors.white,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => productReviewDetail(
                product: this.product, user: this.user, review: data),
          ),
        );
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: (MediaQuery.of(context).size.width) * 0.70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nameFormat,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.left),
                  SizedBox(height: 3.0),
                  Row(
                    children: <Widget>[
                      starRatingBar(15, data.star),
                      SizedBox(width: 10),
                      Text(data.date,
                          style: TextStyle(fontSize: 16.5, color: Colors.black),
                          textAlign: TextAlign.left)
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(data.product.name,
                      style: TextStyle(fontSize: 15, color: Color(0xff1288e5)),
                      textAlign: TextAlign.left),
                  SizedBox(height: 8.0),
                  Text(data.title,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left),
                  Text(data.contents,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      textAlign: TextAlign.left),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: (MediaQuery.of(context).size.width) * 0.20,
              child: LikeHateButton(
                pressedColor: Color(0xff1288e5),
                initColor: Colors.black26,
                iconSize: 15,
                iconDensity: 10,
                  review: data),
            ),
          ],
        ),
      ),
    );
  }
}
