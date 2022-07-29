import 'package:baljachwi_project/screens/product_details/product.dart';
import 'package:baljachwi_project/screens/product_details/product_review_detail_screen.dart';
import 'package:baljachwi_project/screens/product_details/review.dart';
import 'package:flutter/material.dart';

import '../../widgets/dao.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.0,
            ),
            loadReviews(),
            SizedBox(
              height: 80.0,
            ),
          ],
        ),
      ]),
    );
  }

  Widget loadReviews() {
    getReviews();
    final children = <Widget>[];
    for (int i = 0; i < reviews.length; i++) {
      children.add(contentsBox(reviews[i]));
      if (i != reviews.length - 1) // 마지막 게시글 밑에는 구분선 생략
        children.add(thinDividingLine(context));
    }
    return Column(
      children: children,
    );
  }

  InkWell contentsBox(Review data) {
    String title = data.title;
    String userName = data.user.name;
    String date = data.date;

    return InkWell(
        hoverColor: Colors.white,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => productReviewDetail(product: this.product, user: this.user, review: data),
            ),
          );
        },
        child: Container(
          width: (MediaQuery.of(context).size.width) - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  Text(title,
                      style: TextStyle(fontSize: 23, color: Colors.black),
                      textAlign: TextAlign.left),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: <Widget>[
                  Text(userName + " | " + date,
                      style: TextStyle(fontSize: 16.5, color: Colors.black45),
                      textAlign: TextAlign.left)
                ],
              ),
            ],
          ),
        ));
  }

  // 데이터베이스에서 문의글을 가져오는 함수
  void getReviews() {
    List<Review> testReviews = [];
    // ** 임시로 하드코딩 ** ---> 추후 수정
    // 1. 제품 정보를 받아 일치하는지 검사
    // 2. 일치하는 데이터만 받아오기
    // 3. 문의글 리스트 생성 후 null 검사를 통과하면 반환

    for (int i = 1; i <= 3; i++) {
      Review testReview = new Review(
          this.product,
          new User('','',"reviewTest" + i.toString(),'','','',''),
          '리뷰'+ i.toString(),
          '테스트 리뷰입니다.',
          '2022.04.10'
      );
      testReviews.add(testReview);
    }
    reviews = testReviews;
  }
}

Widget thinDividingLine(context) {
  return Container(
      width: (MediaQuery
          .of(context)
          .size
          .width) - 50,
      child: Column(
        children: [
          SizedBox(
            height: 19.0,
          ),
          Container(
            height: 1.5,
            color: Colors.black12,
          ),
          SizedBox(
            height: 14.0,
          ),
        ],
      ));
}