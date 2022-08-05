import 'package:baljachwi_project/screens/product_details/utils.dart';
import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/product_details/product_inquiry_write_screen.dart';
import 'package:baljachwi_project/screens/product_details/product_inquiry.dart';
import 'package:baljachwi_project/screens/product_details/product_inquiry_detail_screen.dart';

import '../../widgets/user.dart';
import '../../widgets/product.dart';

class productInquiry extends StatefulWidget {
  final Product product;
  final User user;
  productInquiry({Key? key, required this.product, required this.user}) : super(key: key);

  @override
  _productInquiry createState() => _productInquiry(product, user);
}

class _productInquiry extends State<productInquiry> {
  final Product product; // 상품정보
  final User user; // 유저 정보
  List<ProductInquiry> inquiries = [];

  _productInquiry(this.product, this.user);

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
            loadInquiries(),
            SizedBox(
              height: 80.0,
            ),
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('button is clicked');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      writeProductInquiry(product: this.product, user: this.user)),
          );
        },
        tooltip: '+',
        label: Text('상품 문의 등록하기',
            style: TextStyle(fontSize: 17, color: Colors.white)),
        icon: Icon(Icons.add),
        backgroundColor: Color(0xff50514F),
      ),
    );
  }

  Widget loadInquiries() {
    inquiries = getInquiries(this.product);
    if(inquiries == null){
      print('inquiry list is empty');
    }
    final children = <Widget>[];
    for (int i = 0; i < inquiries.length; i++) {
      children.add(contentsBox(inquiries[i]));
      if (i != inquiries.length - 1) // 마지막 게시글 밑에는 구분선 생략
        children.add(thinDividingLine(context, 19.0, 14.0));
    }
    return Column(
      children: children,
    );
  }

  InkWell contentsBox(ProductInquiry data) {
    String title = (data.isPrivate ? "비밀글입니다. " : data.title);
    String isResolved = (data.isResolved ? "답변완료" : "답변대기");
    String userName = data.user.name;
    String date = data.date;
    int titleColor = (data.isPrivate ? 0x73000000 : 0xff000000);
    int statusColor = (data.isResolved ? 0xff1288e5 : 0x73000000);

    return InkWell(
        hoverColor: Colors.white,
        onTap: () {
          if (data.isPrivate == false) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => productInquiryDetail(data: data),
              ),
            );
          }
        },
        child: Container(
          width: (MediaQuery.of(context).size.width) - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  Text(title,
                      style: TextStyle(fontSize: 23, color: Color(titleColor)),
                      textAlign: TextAlign.left),
                  if (data.isPrivate)
                    Icon(Icons.lock_outline,
                        color: Color(titleColor), size: 24),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: <Widget>[
                  Text(isResolved,
                      style:
                          TextStyle(fontSize: 16.5, color: Color(statusColor)),
                      textAlign: TextAlign.left),
                  Text(" | " + userName + " | " + date,
                      style: TextStyle(fontSize: 16.5, color: Colors.black45),
                      textAlign: TextAlign.left)
                ],
              ),
            ],
          ),
        ));
  }
}