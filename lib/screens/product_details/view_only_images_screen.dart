import 'package:flutter/material.dart';

import '../../widgets/review.dart';
import '../../widgets/user.dart';

class viewOnlyImages extends StatefulWidget {
  final User user;
  List<Review> reviews;

  viewOnlyImages({Key? key, required this.user, required this.reviews})
      : super(key: key);

  @override
  _viewOnlyImages createState() => _viewOnlyImages(user, reviews);
}

class _viewOnlyImages extends State<viewOnlyImages> {
  final User user; // 유저 정보
  List<Review> reviews; // 리뷰 리스트
  _viewOnlyImages(this.user, this.reviews);

  List starInform = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '상품 리뷰 갤러리',
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
    );
  }
}
