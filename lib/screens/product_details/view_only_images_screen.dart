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

  List<String> imageList = [];

  @override
  Widget build(BuildContext context) {
    imageList = loadImages(reviews, reviews.length); // 리뷰 리스트에서 이미지 파일만 추출
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
      body: imageGridview(imageList, 3, 3),
    );
  }
}

List<String> loadImages(List<Review> reviews, int count){
  List<String> imageList = [];
  int cnt = 0;
  while(cnt < count) {
    for (Review review in reviews) {
      if (review.image != null) {
        for (int i = 0; i < review.image.length; i++) {
          imageList.add(review.image[i]);
          cnt++;
        }
      }
    }
  }
  return imageList;
}
int maxSize = 4;
Widget smallGridview(BuildContext context, User user, List<Review> reviews) {
  List<String> imageList = loadImages(reviews, maxSize);
  int imageListSize = imageList.length;
  return Container(
    height: (MediaQuery.of(context).size.width) * 0.22,
    width: (MediaQuery.of(context).size.width) * 0.90,
    color: Colors.black12,
    child: Stack(
        alignment: Alignment.center,
        textDirection: TextDirection.rtl,
        fit: StackFit.loose,
        clipBehavior: Clip.hardEdge,
        children: <Widget>[
          imageGridview(imageList, 4, 1),
          if(imageListSize > maxSize)
            Positioned(
              top: 0,
              left: (MediaQuery.of(context).size.width) * 0.6762,
              height: (MediaQuery.of(context).size.width) * 0.22,
              width: (MediaQuery.of(context).size.width) * 0.2238,
              child: MaterialButton(
                height: 150,
                minWidth: 150,
                color: Colors.black87.withOpacity(0.4),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            viewOnlyImages(user: user, reviews: reviews)),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      (imageListSize - maxSize).toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "더보기",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
        ]
    ),
  );
}

Widget imageGridview(List<String> imageList, int numOfItems, double padding) {
  return GridView.builder(
    itemCount: imageList!.length, //item 개수
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: numOfItems, //1 개의 행에 보여줄 item 개수
      childAspectRatio: 1 / 1, //item 의 가로 1, 세로 2 의 비율
      mainAxisSpacing: padding, //수평 Padding
      crossAxisSpacing: padding, //수직 Padding
    ),
    itemBuilder: (BuildContext context, int index) {
      //item 의 반목문 항목 형성
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imageList!.elementAt(index)),
              fit: BoxFit.cover
          ),
        ),
      );
    },
  );
}