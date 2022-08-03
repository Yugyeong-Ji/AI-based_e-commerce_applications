import 'dart:math';

import 'package:baljachwi_project/widgets/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/product.dart';
import '../../widgets/user.dart';
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
List<Review> getReviews(Product product) {
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
    testReview.image.add("images/chicken2.jpg");
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
    testReview.image.add("images/chicken3.jpg");
    testReview.like = Random().nextInt(50);
    testReview.hate = Random().nextInt(10);
    testReviews.add(testReview);
  }
  return testReviews;
}

List getStarInform(Product product) {
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

Widget button(BuildContext context, double width,
    Color? color, Color? textColor, String script,
    double fontSize, Function()? onPressed){
  return MaterialButton(
    height: 70,
    minWidth: (MediaQuery.of(context).size.width) * width,
    color: color == null ? Color(0xffffa511) : color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    onPressed: () {
      onPressed!();
      //Navigator.pop(context);
    },
    child: Text(
      script,
      style: TextStyle(
          color: textColor == null ? Colors.white : textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold),
    ),
  );
}

void showCompleteDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext ctx) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(const Radius.circular(10.0)),
        ),
        buttonPadding: const EdgeInsets.only(bottom: 18, left: 18, right: 18),
        contentPadding: EdgeInsets.only(top: 20),
        backgroundColor: Colors.white,
        alignment: Alignment.center,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          content,
          style: TextStyle(color: Color(0x73000000), fontSize: 14),
          textAlign: TextAlign.center,
        ),

        actions: [
          button(context, 0.9, null, null, '확인', 25, (){Navigator.pop(context);}),
        ],
      );
    },
  );
}

void showTextSizeInvalidDialog(BuildContext context, int minLength) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext ctx) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(const Radius.circular(10.0)),
        ),
        titlePadding: const EdgeInsets.only(right: 10, top: 3, bottom: 3),
        contentPadding: const EdgeInsets.all(0),
        backgroundColor: Color(0xffffa511),
        alignment: Alignment.center,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                visualDensity: VisualDensity.compact,
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        content: Container(
          width: (MediaQuery.of(context).size.width),
          height: 100,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(10.0),
              bottomRight: const Radius.circular(10.0),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 32),
              Text(
                '제목과 내용은 최소 ' + minLength.toString() + '자 이상이어야 합니다.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}