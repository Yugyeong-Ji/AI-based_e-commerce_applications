import 'package:baljachwi_project/screens/product_details/product_review_dialog.dart';
import 'package:baljachwi_project/screens/product_details/review.dart';
import 'package:baljachwi_project/screens/product_details/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/LikeHateButton.dart';
import '../../widgets/user.dart';
import '../../widgets/product.dart';

class productReviewDetail extends StatefulWidget {
  final Review review;
  final User user;
  List starInform;

  productReviewDetail(
      {Key? key, required this.review, required this.starInform, required this.user})
      : super(key: key);

  @override
  _productReviewDetail createState() =>
      _productReviewDetail(review, starInform, user);
}

class _productReviewDetail extends State<productReviewDetail> {
  final Review review; // 리뷰
  final List starInform;
  final User user;

  _productReviewDetail(this.review, this.starInform, this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '리뷰 상세',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          color: Colors.black,
          iconSize: 50,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              pageOfTop(),
              pageOfMiddle(),
              pageOfBottom(),
            ],
          ),
        ],
      ),
    );
  }

  Widget pageOfTop() {
    Product product = this.review.product;
    return Container(
      width: (MediaQuery.of(context).size.width) * 0.90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          Text(
            "[" + (product.manufacturer as String) + "] " + product.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          thinDividingLine(context, 10, 10),
          if (this.review.image.isNotEmpty) reviewImage(this.review),
          Text(
            review.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 5),
          Text(
            review.contents,
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget pageOfMiddle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: (MediaQuery.of(context).size.width) * 0.705,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              starRatingBar(25.0, starInform[0]),
              Padding(
                  padding: EdgeInsets.only(top: 2, left: 3),
                  child: Text(
                    review.date + " 작성",
                    style: TextStyle(fontSize: 16.5, color: Colors.black54),
                    textAlign: TextAlign.left,
                  ),
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
              iconSize: 20,
              iconDensity: 5,
              review: this.review),
        ),
      ],
    );
  }

  Widget pageOfBottom() {
    return Container(
      width: (MediaQuery.of(context).size.width) * 0.90,
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            tooltip: '신고',
            onPressed: () {
              showReportDialog(context, this.user, this.review);
            },
            icon: Icon(Icons.report_problem_outlined, color: Colors.black54,),
          ),
          Text(
            "신고",
            style: TextStyle(fontSize: 16.5, color: Colors.black54),
            textAlign: TextAlign.left,
          ),
        ],
      )
    );
  }

  Widget reviewImage(Review data) {
    String url = data.image[0];
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 18),
      child: Container(
        height: (MediaQuery.of(context).size.width) * 0.90,
        width: (MediaQuery.of(context).size.width) * 0.90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover),
        ),
    ),);
  }
}
