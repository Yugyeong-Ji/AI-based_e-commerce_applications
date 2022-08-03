import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/write_review_screen.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';

class review extends StatelessWidget {
  const review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: makeAppBar(context, '리뷰'),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(height: 2, color: Color(0xffd9d9d9)),
            TabBar(
              indicatorColor: Color(0xffffa511),
              labelColor: Color(0xffffa511),
              unselectedLabelColor: Color(0xffa6a6a6),
              unselectedLabelStyle: TextStyle(
                decoration: TextDecoration.none,
              ),
              tabs: [
                make_tap('리뷰 작성'),
                make_tap('내 리뷰'),
              ],
            ),
            Container(height: 2, color: Color(0xffd9d9d9)),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    color: Color(0xfff2f2f2),
                    child: Column(
                      children: [
                        make_reviewableProducts('삼다수', '생수 2L 3개입'),
                        make_reviewableProducts('삼다수', '생수 2L 3개입'),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        make_myReview('삼다수', '생수 2L 3개입', '생각보다 맛없음..'),
                      ],
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

Container make_reviewableProducts(String _company, String _productName) {
  return Container(
    child: Column(
      children: [
        Container(
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
              make_writeButton(),
            ],
          ),
        ),
        Container(height: 2, color: Color(0xffd9d9d9)),
      ],
    ),
  );
}

Container make_myReview(String _company, String _productName, String _content) {
  return Container(
    child: Column(
      children: [
        Container(
          child: Column(
            children: [
              Container(height: 10, color: Color(0xfff2f2f2)),
              Container(height: 2, color: Color(0xffd9d9d9)),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
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
              Container(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 10, bottom: 10),
                child: Row(
                  children: [
                    make_star(),
                    make_star(),
                    make_star(),
                  ],
                ),
              ),
              make_contentText(_content),
              Container(height: 5),
              make_contentText(' 더보기 >'),
              Container(height: 15),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: make_editButton(),
                  ),
                  Expanded(
                    flex: 1,
                    child: make_deleteButton(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(height: 2, color: Color(0xffd9d9d9)),
      ],
    ),
  );
}

Container make_star() {
  return Container(
    child: Icon(
      Icons.star,
      color: Color(0xffffa511),
      size: 20,
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
    margin: const EdgeInsets.only(left: 10),
    child: Text(
      _name,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Container make_contentText(String _name) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.only(left: 10),
    child: Text(
      _name,
      style: TextStyle(fontSize: 14),
    ),
  );
}

Container make_writeButton() {
  return Container(
    width: double.infinity,
    height: 45,
    margin: const EdgeInsets.only(top: 20),
    color: Colors.white,
    child: TextButton(
      child: Text('리뷰 쓰기',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xffffa511)),
        side: MaterialStateProperty.all(
          const BorderSide(
            width: 2,
            color: Color(0xffc0c0c0),
          ),
        ),
      ),
      onPressed: () {
        // writeReview();
      },
    ),
  );
}

Container make_editButton() {
  return Container(
    margin: const EdgeInsets.all(2),
    child: TextButton(
      child: Text('수정',
          style: TextStyle(
            color: Color(0xffa6a6a6),
          )),
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          const BorderSide(
            width: 2,
            color: Color(
              0xffa6a6a6,
            ),
          ),
        ),
      ),
      onPressed: () {},
    ),
  );
}

Container make_deleteButton() {
  return Container(
    margin: const EdgeInsets.all(2),
    child: TextButton(
      child: Text('삭제',
          style: TextStyle(
            color: Color(0xffa6a6a6),
          )),
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          const BorderSide(
            width: 2,
            color: Color(0xffa6a6a6),
          ),
        ),
      ),
      onPressed: () {},
    ),
  );
}
