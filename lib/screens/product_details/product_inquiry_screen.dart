import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/product_details/product_inquiry_write_screen.dart';
import 'package:baljachwi_project/screens/product_details/product.dart';
import 'package:baljachwi_project/screens/product_details/product_inquiry.dart';
import 'package:baljachwi_project/screens/product_details/product_inquiry_detail_screen.dart';

import '../../widgets/dao.dart';

class productInquiry extends StatefulWidget {
  final Product2 product;
  final User user;
  productInquiry({Key? key, required this.product, required this.user}) : super(key: key);

  @override
  _productInquiry createState() => _productInquiry(product, user);
}

class _productInquiry extends State<productInquiry> {
  final Product2 product; // 상품정보
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
    getInquiries();
    final children = <Widget>[];
    for (int i = 0; i < inquiries.length; i++) {
      children.add(contentsBox(inquiries[i]));
      if (i != inquiries.length - 1) // 마지막 게시글 밑에는 구분선 생략
        children.add(thinDividingLine(context));
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

  // 데이터베이스에서 문의글을 가져오는 함수
  void getInquiries() {
    List<ProductInquiry> testInquires = [];
    // ** 임시로 하드코딩 ** ---> 추후 수정
    // 1. 제품 정보를 받아 일치하는지 검사
    // 2. 일치하는 데이터만 받아오기
    // 3. 문의글 리스트 생성 후 null 검사를 통과하면 반환

    for (int i = 1; i <= 3; i++) {
      ProductInquiry testInquire = new ProductInquiry(
          this.product,
          "비밀글 테스트 " + i.toString(),
          "환불해주세요;;",
          new User('','',"privateTest" + i.toString(),'','','',''),
          "2022.04.23",
          false,
          true);
      testInquires.add(testInquire);
    }
    for (int i = 1; i <= 3; i++) {
      ProductInquiry testInquire = new ProductInquiry(
          this.product,
          "답변대기 테스트 " + i.toString(),
          "환불해주세요;;",
          new User('','',"watingTest" + i.toString(),'','','',''),
          "2022.04.23",
          false,
          false);
      testInquires.add(testInquire);
    }
    for (int i = 1; i <= 3; i++) {
      ProductInquiry testInquire = new ProductInquiry(
          this.product,
          "답변완료 테스트 " + i.toString(),
          "환불해주세요;;",
          new User('','',"answerTest" + i.toString(),'','','',''),
          "2022.04.23",
          true,
          false);
      testInquire.answer = "고객님 죄송하지만 환불은 어렵습니다..^^";
      testInquires.add(testInquire);
    }

    inquiries = testInquires;
  }
}

Widget thinDividingLine(context) {
  return Container(
      width: (MediaQuery.of(context).size.width) - 50,
      child: Column(
        children: [
          SizedBox(
            height: 19.0,
          ),
          Container(
            height: 1.5,
            color: Colors.black12,
          ),
          SizedBox(
            height: 14.0,
          ),
        ],
      ));
}