import 'package:baljachwi_project/screens/mypage/review_screen.dart';
import 'package:flutter/material.dart';

class writeReview extends StatelessWidget {
  const writeReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '리뷰 쓰기',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          color: Colors.black,
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: 2,
              color: Color(0xffc0c0c0),
            ),
            make_product('삼다수', '생수 2L 3개입'),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                            style: TextStyle(color: Colors.white, fontSize: 24),
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
                    child: Row(
                      children: [
                        make_star(),
                        make_star(),
                        make_star(),
                        make_star(),
                        make_star(),
                      ],
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
                      style: const TextStyle(color: Color(0xffa6a6a6)),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: '최소 15자 이상 작성해 주세요.',
                        labelStyle: TextStyle(
                          color: Color(0xffa6a6a6),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Expanded make_star() {
  return Expanded(
      flex: 1,
      child: Icon(
        Icons.star,
        color: Color(0xffd9d9d9),
        size: 30,
      ));
}

Container make_product(String _company, String _productName) {
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
                    make_smallText(_company),
                    make_boldText(_productName),
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

Container make_smallText(String _name) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.only(left: 10),
    child: Text(
      _name,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Color(0xffa6a6a6),
      ),
    ),
  );
}

Container make_boldText(String _name) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.only(left: 10, bottom: 5),
    child: Text(
      _name,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
