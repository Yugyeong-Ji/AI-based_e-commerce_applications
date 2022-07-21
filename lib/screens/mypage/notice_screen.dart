import 'package:flutter/material.dart';

class notice extends StatelessWidget {
  const notice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '공지사항',
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 2,
              color: Color(0xffc0c0c0),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 30),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '2022-03-18',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffa6a6a6),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '[공지] 개인정보 처리방침 변경 사전 안내',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 30),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '2022-02-20',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffa6a6a6),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '[공지] 삼다수 스토어 영업 종료',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 30),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '2022-02-18',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffa6a6a6),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '[공지] 개인정보 처리방침 변경 사전 안내',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 30),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '2022-01-28',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffa6a6a6),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '[공지] 개인정보 처리방침 변경 사전 안내',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 30),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '2022-01-01',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffa6a6a6),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '[공지] 개인정보 처리방침 변경 사전 안내',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 30),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '2021-12-18',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffa6a6a6),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '[공지] 개인정보 처리방침 변경 사전 안내',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 30),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '2021-12-08',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffa6a6a6),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '[공지] 개인정보 처리방침 변경 사전 안내',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 30),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '2021-11-20',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffa6a6a6),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '[공지] 개인정보 처리방침 변경 사전 안내',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
