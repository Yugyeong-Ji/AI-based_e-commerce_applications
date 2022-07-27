import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/write_review_screen.dart';

class review extends StatelessWidget {
  const review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '리뷰',
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            make_line(),
            TabBar(
              indicatorColor: Color(0xffffa511),
              labelColor: Color(0xffffa511),
              unselectedLabelColor: Color(0xffa6a6a6),
              unselectedLabelStyle: TextStyle(
                decoration: TextDecoration.none,
              ),
              tabs: [
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    'NEW(2)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    '내 리뷰(23)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            make_box(),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    color: Color(0xfff2f2f2),
                    child: Column(
                      children: [
                        make_reviewableProducts('삼다수', '생수 2L 3개입'),
                        make_line(),
                        make_reviewableProducts('삼다수', '생수 2L 3개입'),
                        make_line(),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        make_myReview('삼다수', '생수 2L 3개입', '생각보다 맛없음..'),
                        make_box(),
                        make_myReview('삼다수', '생수 2L 3개입', '생각보다 맛없음..'),
                        make_line(),
                        Expanded(
                          child: Container(color: Color(0xfff2f2f2)),
                        ),
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

Container make_line() {
  return Container(
    height: 2,
    color: Color(0xffd9d9d9),
  );
}

Container make_box() {
  return Container(
    child: Column(
      children: [
        make_line(),
        Container(
          height: 10,
          color: Color(0xfff2f2f2),
        ),
        make_line(),
      ],
    ),
  );
}

Container make_reviewableProducts(String _company, String _productName) {
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
        make_writeButton()
      ],
    ),
  );
}

Container make_myReview(String _company, String _productName, String _content) {
  return Container(
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
