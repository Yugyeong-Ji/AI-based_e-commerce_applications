import 'package:baljachwi_project/screens/product_details/photo_gird_view.dart';
import 'package:baljachwi_project/screens/product_details/product_review_detail_screen.dart';
import 'package:baljachwi_project/screens/product_details/utils.dart';
import 'package:flutter/material.dart';
import '../../widgets/review.dart';
import '../../widgets/user.dart';

class photoDetail extends StatelessWidget {
  final PhotoItem item;
  final User user;
  photoDetail({Key? key, required this.item, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          '이미지 상세',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          color: Colors.white,
          iconSize: 50,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          autorInform(context),
          SizedBox(height: 25),
          photoView(context),
          SizedBox(height: 25),
          contentPreview(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text('전체보기', style: TextStyle(fontSize: 16.5, color: Colors.blue)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => productReviewDetail(review: this.item.review, user: this.user)
                    ),
                  );
                },
              ),
              SizedBox(width: (MediaQuery.of(context).size.width) * 0.05),
            ],
          )
        ],
      ),
    );
  }

  Widget autorInform(BuildContext context) {
    Review data = item.review;
    String nameFormat = data.user.name[0] + '*' + data.user.name[2];
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: (MediaQuery.of(context).size.width) * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nameFormat,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    textAlign: TextAlign.left),
                SizedBox(height: 3.0),
                Row(
                  children: <Widget>[
                    starRatingBar(15, data.star),
                    SizedBox(width: 10),
                    Text(data.date,
                        style: TextStyle(fontSize: 16.5, color: Colors.white),
                        textAlign: TextAlign.left)
                  ],
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget photoView(BuildContext context){
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      width: (MediaQuery.of(context).size.width),
      height: (MediaQuery.of(context).size.width), //정사각형 블록 모양
      child: Image(
        image: AssetImage(item.image),
      ),
    );
  }

  Widget contentPreview(BuildContext context) {
    Review data = item.review;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: (MediaQuery.of(context).size.width) * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.product.name,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
                SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.title,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left),
                        Text(data.contents,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                            textAlign: TextAlign.left),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
