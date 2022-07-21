import 'package:flutter/material.dart';

class coupon extends StatelessWidget {
  const coupon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Coupon',
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
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '쿠폰 등록',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '상품권 및 쿠폰 번호를 입력하세요.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffa6a6a6),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 50,
                          child: TextField(
                            style: TextStyle(
                              color: Color(0xffd9d9d9),
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              labelText: 'YYYY-MMMMMM',
                            ),
                          ),
                          margin: const EdgeInsets.only(right: 10),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: ElevatedButton(
                            child: Text(
                              '받기',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                              primary: Color(0xffffa511),
                              fixedSize: Size(80, 50),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '•  쿠폰의 발급 기간 / 마일리지 적립 기간을 꼭 확인해주세요!',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffa6a6a6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xfff2f2f2),
              padding: const EdgeInsets.all(25),
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 5, bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '쿠폰 내역',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '10일 남음',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffa6a6a6),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25, bottom: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '만나서 반가워요! 10% 쿠폰',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '10% 할인',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '2022.6.1~2022.8.1',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 10,
                    color: Color(
                      0xfff2f2f2,
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '31일 남음',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffa6a6a6),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25, bottom: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '생수 LOVER를 위한 당신',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '삼다수 20% 할인',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '2022.5.1~2022.8.1',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 10,
                    color: Color(
                      0xfff2f2f2,
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '31일 남음',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffa6a6a6),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25, bottom: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '생수 LOVER를 위한 당신',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '삼다수 20% 할인',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '2022.5.1~2022.8.1',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
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

/*
1. 쿠폰 유효성 검사 후 등록
2. 연동
3. 쿠폰 등록 textfield border color, width
*/