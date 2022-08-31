import 'package:baljachwi_project/screens/product_details/photo_detail.dart';
import 'package:flutter/material.dart';

import '../../widgets/review.dart';
import '../../widgets/user.dart';

class photoGridView extends StatefulWidget {
  final User user;
  List<Review> reviews;

  photoGridView({Key? key, required this.user, required this.reviews})
      : super(key: key);

  @override
  _photoGridView createState() => _photoGridView(user, reviews);
}

class _photoGridView extends State<photoGridView> {
  final User user; // 유저 정보
  List<Review> reviews; // 리뷰 리스트
  List<PhotoItem> _item = [];

  _photoGridView(this.user, this.reviews);

  @override
  Widget build(BuildContext context) {
    _item = loadImageReviews(this.reviews);

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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0, // 사진 사이 공백 사이즈
          mainAxisSpacing: 0,
          crossAxisCount: 3, // 한 줄에 최대 세 개의 사진이 배치
        ),
        itemCount: _item.length,
        itemBuilder: (context, index) {
          // 각각의 사진들을 위젯으로 반환하는 메소드
          return new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => photoDetail(item: _item[index], user: this.user),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(_item[index].image),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PhotoItem {
  final String image;
  final Review review;

  PhotoItem(this.image, this.review);
}

// 이미지가 포함된 리뷰만 가져오기
List<PhotoItem> loadImageReviews(List<Review> reviews) {
  List<PhotoItem> _item = [];

  for (Review review in reviews) {
    if (review.image != null) {
      for (int i = 0; i < review.image.length; i++) {
        _item.add(new PhotoItem(review.image[i], review));
      }
    }
  }
  return _item;
}