import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';
import 'package:baljachwi_project/screens/mypage/class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var star = 0;

class writeReview extends StatefulWidget {
  var company;
  var product;
  var orderNumber;
  writeReview(this.company, this.product, this.orderNumber);

  @override
  State<writeReview> createState() => _writeReviewState();
}

class _writeReviewState extends State<writeReview> {
  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: makeAppBar(context, '리뷰 쓰기'),
      body: SingleChildScrollView(
        child: GestureDetector(
          onVerticalDragUpdate: (DragUpdateDetails details) {},
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: <Widget>[
              makeProduct(widget.company, widget.product),
              Container(
                height: 2,
                color: Color(0xffc0c0c0),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      alignment: Alignment.center,
                      child: Text(
                        '상품은 어떠셨나요?',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 70,
                            decoration: BoxDecoration(
                              color: Color(0xfff2f2f2),
                              border: Border.all(
                                width: 1,
                                color: Color(0xffd9d9d9),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xffffa511),
                              border: Border.all(
                                width: 1,
                                color: Color(0xffd9d9d9),
                              ),
                            ),
                            child: Text(
                              '+',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 50),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Detector(0),
                            Detector(1),
                            Detector(2),
                            Detector(3),
                            Detector(4),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color(0xffd9d9d9),
                        ),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: contentController,
                        style: const TextStyle(color: Color(0xffa6a6a6)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '최소 15자 이상 작성해 주세요.',
                          hintStyle: TextStyle(color: Color(0xffa6a6a6)),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 45,
                      margin: const EdgeInsets.only(top: 20),
                      color: Colors.white,
                      child: TextButton(
                        child: Text('저장',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xffffa511)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                        ),
                        onPressed: () {
                          if (vaildCheck(contentController.text == "")) {
                            createReview();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createReview() {
    FirebaseFirestore.instance
        .collection('review')
        .doc(widget.orderNumber.toString())
        .set({
      "orderNumber": widget.orderNumber,
      "stars": star,
      "content": contentController.text,
      "company": widget.company,
      "product": widget.product,
    }).then((value) => {makeDialog2(context, '리뷰가 추가되었습니다.')});
  }

  Widget Detector(var i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          updateColor(i);
        });
      },
      child: s(c[i]),
    );
  }
}

const c1 = Color(0xffffa511);
const c2 = Color(0xffd9d9d9);

List<Color> c = [c2, c2, c2, c2, c2];

Widget s(Color c) {
  return Icon(
    Icons.star,
    color: c,
    size: 30,
  );
}

updateColor(var n) {
  for (var i = 0; i < n + 1; i++) {
    c[i] = c1;
  }
  for (var j = n + 1; j < 5; j++) {
    c[j] = c2;
  }
  star = n;
}

Container makeProduct(String _company, String _productName) {
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        _company,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffa6a6a6),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 10, bottom: 5),
                      child: Text(
                        _productName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xfff2f2f2),
                  border: Border.all(
                    width: 1,
                    color: Color(0xffd9d9d9),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
