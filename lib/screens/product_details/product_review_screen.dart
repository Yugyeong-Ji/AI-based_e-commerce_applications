import 'package:baljachwi_project/screens/product_details/product_review_detail_screen.dart';
import 'package:baljachwi_project/screens/product_details/view_only_images_screen.dart';
import 'package:baljachwi_project/widgets/review.dart';
import 'package:baljachwi_project/widgets/star_bar_chart.dart';
import 'package:baljachwi_project/screens/product_details/utils.dart';
import 'package:baljachwi_project/widgets/likeHateButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/accordion.dart';
import '../../widgets/product.dart';
import '../../widgets/user.dart';

class productReview extends StatefulWidget {
  final Product product;
  final User user;

  productReview({Key? key, required this.product, required this.user})
      : super(key: key);

  @override
  _productReview createState() => _productReview(product, user);
}

class _productReview extends State<productReview> {
  final Product product; // 상품정보
  final User user; // 유저 정보
  List<Review> reviews = []; // 리뷰 리스트
  _productReview(this.product, this.user);

  List starInform = [];

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 15.0),
                    reviewStats(),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 15.0),
                    reviewHeader(),
                    smallGridview(context, user, reviews),
                    thinDividingLine(context, 15, 20),
                    loadReviews(),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ],
      ),
    );
  }

  void init() {
    this.reviews = getReviews(this.product);
    starInform = getStarInform(this.product);
  }

  Widget reviewHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '고객리뷰',
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1.8),
        ),
        thinDividingLine(context, 10, 15)
      ],
    );
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
        starRatingDetail()
      ],
    );
  }

  Widget starRatingDetail() {
    return Container(
      width: (MediaQuery.of(context).size.width),
      child: Accordion(
        useAnotherTitle: true,
        title_at_showContent:
            Text('접기', style: TextStyle(color: Color(0xffDE900F))),
        title: Text('자세히 보기', style: TextStyle(color: Color(0xffDE900F))),
        content: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.7,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                color: Colors.white,
                child: starBarChart(reviews: this.reviews),
              ),
            ),
            thinDividingLine(context, 8, 0),
          ],
        ),
      ),
    );
  }

  var commaFormat = NumberFormat('###,###,###,###');

  Widget starRating() {
    return Container(
      height: 80,
      width: (MediaQuery.of(context).size.width) * 0.90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: (MediaQuery.of(context).size.width) * 0.70,
                child: starRatingBar(50, starInform[0]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 3),
                child: Text(
                  '별점평균',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.8),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: Container(
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
              ),
              Text(
                '참여인원',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.8),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget reviewImage(Review data) {
    String url = data.image[0];
    return Padding(
      padding: EdgeInsets.only(right: 13, top: 3),
      child: Container(
        height: (MediaQuery.of(context).size.width) * 0.2,
        width: (MediaQuery.of(context).size.width) * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover),
        ),
      ),
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
            builder: (context) =>
                productReviewDetail(review: data, starInform: this.starInform, user: this.user),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (data.image.isNotEmpty) reviewImage(data),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.title,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left),
                          Text(data.contents,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                              textAlign: TextAlign.left),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: (MediaQuery.of(context).size.width) * 0.20,
              child: LikeHateButton(
                  pressedColor: Color(0xff1288e5),
                  initColor: Colors.black26,
                  iconSize: 17,
                  iconDensity: 5,
                  review: data),
            ),
          ],
        ),
      ),
    );
  }
}
