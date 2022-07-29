import 'package:baljachwi_project/screens/product_details/product.dart';
import 'package:baljachwi_project/screens/product_details/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/dao.dart';

class productReviewDetail extends StatefulWidget {
  final Product2 product;
  final User user;
  final Review review;
  productReviewDetail({Key? key, required this.product, required this.user, required this.review})
      : super(key: key);

  @override
  _productReviewDetail createState() => _productReviewDetail(product, user, review);
}

class _productReviewDetail extends State<productReviewDetail> {
  final Product2 product; // 상품정보
  final User user; // 유저 정보
  final Review review; // 리뷰

  _productReviewDetail(this.product, this.user, this.review);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        '리뷰 상세보기 페이지'
      )
    );
  }
}