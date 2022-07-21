import 'package:flutter/material.dart';

class informationUse extends StatelessWidget {
  const informationUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '이용 안내',
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 2,
              color: Color(0xffc0c0c0),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(17),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5, bottom: 10),
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '회원 / 혜택',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 100, // 나중에 제거
                    color: Color(0xfff2f2f2),
                    margin: const EdgeInsets.only(left: 5, bottom: 10),
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: Color(0xffd9d9d9),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(17),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5, bottom: 10),
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '주문 / 결제',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 200, // 나중에 제거
                    color: Color(0xfff2f2f2),
                    margin: const EdgeInsets.only(left: 5, bottom: 10),
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: Color(0xffd9d9d9),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(17),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5, bottom: 10),
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '배송 / 함께 배송',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 300, // 나중에 제거
                    color: Color(0xfff2f2f2),
                    margin: const EdgeInsets.only(left: 5, bottom: 10),
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: Color(0xffd9d9d9),
            ),
          ],
        ),
      ),
    );
  }
}

/*
1. 텍스트 컨테이너 크기 제거
2. 내용 추가
*/