import 'package:baljachwi_project/screens/mypage/write_personal_inquiry_screen.dart';
import 'package:baljachwi_project/screens/product_details/product_inquiry.dart';
import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/product_details/product.dart';

import '../../widgets/dao.dart';
import '../mypage/product_inquiry_screen.dart';

class writeProductInquiry extends StatefulWidget {
  final Product2 product;
  final User user;

  writeProductInquiry({Key? key, required this.product, required this.user})
      : super(key: key);

  @override
  _writeProductInquiry createState() => _writeProductInquiry(product, user);
}

class _writeProductInquiry extends State<writeProductInquiry> {
  final titleEditController = TextEditingController();
  final contentsEditController = TextEditingController();
  final Product2 product; // 상품 정보 가져오기
  final User user; // 유저 정보 가져오기
  bool isPrivate = false;

  _writeProductInquiry(this.product, this.user);

  //** 테스트를 위한 임시 객체 **

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
                  SizedBox(height: 8),
                  privateButton(),
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
        "[" + this.product.manufacturer + "] " + this.product.name,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget writeTitle() {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 5),
      child: TextField(
        controller: titleEditController,
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
        controller: contentsEditController,
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

  Widget privateButton() {
    return Row(
      children: [
        Transform.scale(
          scale: 1.3,
          child: Checkbox(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            activeColor: Color(0xffa6a6a6),
            value: isPrivate,
            onChanged: (value) {
              setState(
                    () {
                  if (isPrivate)
                    isPrivate = false;
                  else
                    isPrivate = true;
                },
              );
            },
          ),
        ),
        Text(
          ' 비밀글로 문의하기',
          style: TextStyle(
            fontSize: 19,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget postButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: MaterialButton(
        height: 70,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        minWidth: (MediaQuery
            .of(context)
            .size
            .width),
        color: Color(0xffffa511),
        onPressed: () {
          isValid() ? showCompleteDialog(context) : showInvalidDialog(context);
        },
        child: Text(
          '등록',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void dispose() {
    // 글자수 조건을 만족하지 못하면 등록 버튼을 비활성화
    titleEditController.dispose();
    contentsEditController.dispose();
    super.dispose();
  }

  final int minLength = 4;

  bool isValid() {
    return (titleEditController.text.length >= minLength &&
        contentsEditController.text.length >= minLength);
  }

  void showInvalidDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(const Radius.circular(10.0)),
          ),
          titlePadding: const EdgeInsets.only(right: 10, top: 3, bottom: 3),
          contentPadding: const EdgeInsets.all(0),
          backgroundColor: Color(0xffffa511),
          alignment: Alignment.center,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  visualDensity: VisualDensity.compact,
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          content: Container(
            width: (MediaQuery
                .of(context)
                .size
                .width),
            height: 100,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(10.0),
                bottomRight: const Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                Text(
                  '제목과 내용은 최소 ' + minLength.toString() + '자 이상이어야 합니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showCompleteDialog(BuildContext context) {
    saveInquiry();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(const Radius.circular(10.0)),
          ),
          buttonPadding: const EdgeInsets.all(18),
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
            '문의하신 내역은' + "\n" + '마이페이지 > 고객센터 > 문의내역에서 확인하실 수 있습니다.',
            style: TextStyle(color: Color(0x73000000), fontSize: 14),
            textAlign: TextAlign.center,
          ),
          actions: [
            MaterialButton(
              height: 70,
              minWidth: (MediaQuery
                  .of(context)
                  .size
                  .width) - 35,
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

//ProductInquiry(this.product, this.title, this.contents,
// this.userName, this.date, this.isResolved, this.isPrivate);
  void saveInquiry() {
    ProductInquiry newInquiry = new ProductInquiry(
      this.product,
      this.titleEditController.text,
      this.contentsEditController.text,
      this.user,
      DateTime.now().toString(),
      false,
      this.isPrivate,
    );
    printInquiry(newInquiry);
  }

  void printInquiry(ProductInquiry inq) {
    print('\n유저이름: ' + inq.user.name);
    print('\n작성일: ' + inq.date.toString());
    print('\n비밀글 여부: ' + inq.isPrivate.toString());
    print('\n제목: ' + inq.title);
    print('\n내용: ' + inq.contents);
  }
}