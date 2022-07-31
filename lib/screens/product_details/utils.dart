import 'dart:math';

import 'package:baljachwi_project/screens/product_details/product.dart';
import 'package:baljachwi_project/screens/product_details/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/dao.dart';
import '../../widgets/flutter_rating_bar/lib/flutter_rating_bar.dart';

double getStarAvg(List<Review> reviews) {
  double starAvg = 0.0;
  double sum = 0;
  int total = reviews.length;
  for (int i = 0; i < reviews.length; i++) sum += reviews.elementAt(i).star;
  starAvg = (sum / total).round() as double;
  return starAvg;
}

List<double> getStarStats(List<Review> reviews) {
  var ratio = List<double>.filled(5, 0);
  int total = reviews.length;
  for (int i = 0; i < total; i++) {
    double score = reviews.elementAt(i).star;
    if (score >= 0 && score <= 1) ratio[4]++;
    if (score > 1 && score <= 2) ratio[3]++;
    if (score > 2 && score <= 3) ratio[2]++;
    if (score > 3 && score <= 4) ratio[1]++;
    if (score > 4 && score <= 5) ratio[0]++;
  }
  for (int i = 0; i < ratio.length; i++)
    ratio[i] = ratio[i] / total * 100; // 비율 구하기

  return ratio;
}

Widget thinDividingLine(context, double top, double bottom) {
  return Container(
      width: (MediaQuery.of(context).size.width) - 50,
      child: Column(
        children: [
          SizedBox(
            height: top,
          ),
          Container(
            height: 1.5,
            color: Colors.black12,
          ),
          SizedBox(
            height: bottom,
          ),
        ],
      ));
}

// 데이터베이스에서 문의글을 가져오는 함수
List<Review> getReviews(Product2 product) {
  List<Review> testReviews = [];
  // ** 임시로 하드코딩 ** ---> 추후 수정
  // 1. 제품 정보를 받아 일치하는지 검사
  // 2. 일치하는 데이터만 받아오기
  // 3. 문의글 리스트 생성 후 null 검사를 통과하면 반환
  var name = ['정진주', '조희연', '지유경', '노승하', '김정효', '이서정', '황수현', '추유진'];
  for (int i = 0; i <= 3; i++) {
    Review testReview = new Review(
        product,
        new User('', '', name[i], '', '', '', ''),
        '리뷰' + i.toString(),
        '테스트 리뷰입니다.',
        '2022.04.10',
        3.0);
    testReview.like = Random().nextInt(50);
    testReview.hate = Random().nextInt(10);
    testReviews.add(testReview);
  }
  for (int i = 4; i <= 7; i++) {
    Review testReview = new Review(
        product,
        new User('', '', name[i], '', '', '', ''),
        '리뷰' + i.toString(),
        '테스트 리뷰입니다.',
        '2022.04.10',
        5);
    testReview.like = Random().nextInt(50);
    testReview.hate = Random().nextInt(10);
    testReviews.add(testReview);
  }
  return testReviews;
}

List getStarInform(Product2 product) {
  List<Review> reviews = getReviews(product);
  double starAvg = getStarAvg(reviews);
  int evaluators = reviews.length;

  return [starAvg, evaluators];
}

Widget starRatingBar(double size, double initRating) {
  return RatingBar.builder(
    initialRating: initRating,
    ignoreGestures: true,
    direction: Axis.horizontal,
    itemCount: 5,
    itemSize: size,
    itemBuilder: (context, _) => Icon(
      Icons.star_rounded,
      color: Colors.amber,
    ),
    onRatingUpdate: (rating) {},
  );
}