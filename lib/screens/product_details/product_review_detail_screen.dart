import 'package:baljachwi_project/screens/product_details/report_review_dialog.dart';
import 'package:baljachwi_project/widgets/review.dart';
import 'package:baljachwi_project/screens/product_details/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/likeHateButton.dart';
import '../../widgets/user.dart';
import '../../widgets/product.dart';

class productReviewDetail extends StatefulWidget {
  final Review review;
  final User user;

  productReviewDetail(
      {Key? key,
      required this.review,
      required this.user})
      : super(key: key);

  @override
  _productReviewDetail createState() =>
      _productReviewDetail(review, user);
}

class _productReviewDetail extends State<productReviewDetail> {
  final Review review; // 리뷰
  final User user;

  _productReviewDetail(this.review, this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '상품 리뷰',
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
              if (this.review.image.isNotEmpty) reviewImage(this.review),
              pageOfMiddle(),
              pageOfBottom(),
            ],
          ),
        ],
      ),
    );
  }

  Widget pageOfTop() {
    String nameFormat =
        this.review.user.name[0] + '*' + this.review.user.name[2];
    Product product = this.review.product;
    return Container(
      width: (MediaQuery.of(context).size.width) * 0.90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          Text(nameFormat,
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.left),
          SizedBox(height: 3.0),
          Row(
            children: <Widget>[
              starRatingBar(15, this.review.star),
              SizedBox(width: 10),
              Text(this.review.date,
                  style: TextStyle(fontSize: 16.5, color: Colors.black),
                  textAlign: TextAlign.left)
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            this.review.product.name,
            style: TextStyle(fontSize: 16.5, color: Color(0xff1288e5)),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }

  Widget pageOfMiddle() {
    return Container(
      width: (MediaQuery.of(context).size.width) * 0.90,
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            review.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 3),
          Text(
            review.contents,
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget pageOfBottom() {
    return Container(
      width: (MediaQuery.of(context).size.width) * 0.90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: LikeHateButton(
                pressedColor: Color(0xff1288e5),
                initColor: Colors.black26,
                iconSize: 25,
                iconDensity: 30,
                review: this.review),
          ),
          thinDividingLine(context, 15, 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  showReportDialog(context, user, review);
                },
                icon: Icon(
                  Icons.report_problem_outlined,
                  color: Colors.black54,
                ),
              ),
              Text(
                "신고하기",
                style: TextStyle(fontSize: 16.5, color: Colors.black54),
                textAlign: TextAlign.left,
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
      padding: EdgeInsets.only(top: 5, bottom: 18),
      child: Container(
        height: (MediaQuery.of(context).size.width) * 0.90,
        width: (MediaQuery.of(context).size.width) * 0.90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover),
        ),
      ),
    );
  }
}