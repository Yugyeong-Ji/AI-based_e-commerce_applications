import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/product_details/product.dart';

import '../mypage/product_inquiry_screen.dart';

class writeProductInquiry extends StatefulWidget {
  final Product2 productInform;

  writeProductInquiry({Key? key, required this.productInform})
      : super(key: key);

  @override
  _writeProductInquiry createState() => _writeProductInquiry(productInform);
}

class _writeProductInquiry extends State<writeProductInquiry> {
  // 문의글 가져오기
  final Product2 productInform;

  _writeProductInquiry(this.productInform);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '상품 문의',
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: 25),
          Container(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(25),
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  header(),
                  writeTitle(),
                  writeContents(),
                  postButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "[" + this.productInform.manufacturer + "] " + this.productInform.name,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void showCompleteDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          buttonPadding : const EdgeInsets.all(18),
          backgroundColor: Colors.white,
          alignment: Alignment.center,
          title: Text(
            '상품관련 문의가 접수되었습니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            '문의하신 내역은'+"\n"+
                '마이페이지 > 고객센터 > 문의내역에서 확인하실 수 있습니다.',
            style: TextStyle(color: Color(0x73000000), fontSize: 14),
            textAlign: TextAlign.center,
          ),
          actions: [
            MaterialButton(
              height: 70,
              minWidth: (MediaQuery.of(context).size.width) - 35,
              color: Color(0xffffa511),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                '확인',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
  Widget postButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: MaterialButton(
        height: 70,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        minWidth: (MediaQuery.of(context).size.width),
        color: Color(0xffffa511),
        onPressed: () {
          showCompleteDialog(context);
        },
        child: Text(
          '등록',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

Widget writeTitle() {
  return Container(
    height: 50,
    margin: const EdgeInsets.only(top: 5),
    child: TextField(
      style: TextStyle(color: Color(0xffa6a6a6), fontSize: 20),
      decoration: InputDecoration(hintText: ' 제목을 입력해주세요'),
    ),
  );
}

Widget writeContents() {
  return Container(
    height: 200,
    margin: const EdgeInsets.only(top: 50),
    padding: const EdgeInsets.all(7),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      border: Border.all(
        width: 1.2,
        color: Color(0xffa6a6a6),
      ),
    ),
    child: TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      style: TextStyle(color: Color(0xffa6a6a6), fontSize: 20),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(10),
        border: InputBorder.none,
        hintText: '내용을 입력해주세요',
      ),
    ),
  );
}

Widget thinDividingLine(context) {
  return Container(
      width: (MediaQuery.of(context).size.width) - 50,
      child: Column(
        children: [
          Container(
            height: 1.5,
            color: Colors.black12,
          ),
          SizedBox(
            height: 25.0,
          ),
        ],
      ));
}
