import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/product_details/write_product_inquiry_screen.dart';
import 'package:baljachwi_project/screens/product_details/product.dart';
import 'package:baljachwi_project/screens/product_details/product_inquiry.dart';

class productInquiry extends StatefulWidget {
  final Product2 productInform;

  productInquiry({Key? key, required this.productInform}) : super(key: key);

  @override
  _productInquiry createState() => _productInquiry(productInform);
}

class _productInquiry extends State<productInquiry> {
  final List<ProductInquiry> inquiries = getInquiries(); // 문의글 가져오기
  Product2 productInform;

  _productInquiry(this.productInform);

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
                      writeProductInquiry(productInform: this.productInform)));
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
    final children = <Widget>[];
    for (int i = 0; i < inquiries.length; i++)
      children.add(contentsBox(inquiries[i]));

    return Column(
      children: children,
    );
  }

  Container contentsBox(ProductInquiry data) {
    String title = data.title;
    String isResolved = (data.isResolved ? "답변완료" : "답변대기");
    int c = (data.isResolved ? 0xff1288e5 : 0x8a000000);
    String userName = data.userName;
    String date = data.date;

    return Container(
      color: Colors.white,
      width: (MediaQuery.of(context).size.width) - 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 23, color: Colors.black),
              textAlign: TextAlign.left),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: <Widget>[
              Text(isResolved,
                  style: TextStyle(fontSize: 16.5, color: Color(c)),
                  textAlign: TextAlign.left),
              Text(" | " + userName + " | " + date,
                  style: TextStyle(fontSize: 16.5, color: Colors.black54),
                  textAlign: TextAlign.left)
            ],
          ),
          thinDividingLine(),
        ],
      ),
    );
  }
}

// 데이터베이스에서 문의글을 가져오는 함수
List<ProductInquiry> getInquiries() {
  List<ProductInquiry> testInquires = [];
  // ** 임시로 하드코딩 ** ---> 추후 수정
  // 1. 제품 정보를 받아 일치하는지 검사
  // 2. 일치하는 데이터만 받아오기
  // 3. 문의글 리스트 생성 후 null 검사를 통과하면 반환

  for (int i = 10; i >= 6; i--) {
    ProductInquiry testInquire = new ProductInquiry("테스트 문의사항" + i.toString(),
        "환불해주세요ㅡㅡ;;", "user" + i.toString(), "2022.04.23", false);
    testInquires.add(testInquire);
  }
  for (int i = 5; i >= 1; i--) {
    ProductInquiry testInquire = new ProductInquiry("테스트 문의사항" + i.toString(),
        "환불해주세요ㅡㅡ;;", "user" + i.toString(), "2022.04.23", true);
    testInquires.add(testInquire);
  }

  return testInquires;
}

Widget thinDividingLine() {
  return Column(
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
  );
}
