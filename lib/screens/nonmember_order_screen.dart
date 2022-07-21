import 'package:flutter/material.dart';

class nonmemberOrder extends StatelessWidget {
  const nonmemberOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '비회원 주문 내역',
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
          Container(
            height: 2,
            color: Color(0xffc0c0c0),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 5, bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '주문번호',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 7,
                      child: Container(
                        height: 50,
                        child: TextField(
                          style: TextStyle(
                            color: Color(0xffd9d9d9),
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Color(0xffa6a6a6),
                              ),
                            ),
                            labelText: '주문 번호를 입력해주세요.',
                          ),
                        ),
                        margin: const EdgeInsets.only(right: 10),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: ElevatedButton(
                          child: Text(
                            '조회',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
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
              ],
            ),
          ),
          Container(
            height: 2,
            color: Color(0xffc0c0c0),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Color(0xfff2f2f2),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(35, 20, 25, 20),
                child: Text(
                  '조회 결과',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Text(
                              '주문 번호',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 20,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Text(
                              '12224',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: 20,
                            child: IconButton(
                              icon: Icon(
                                Icons.navigate_next,
                                size: 30,
                              ),
                              onPressed: null, // 페이지 연결
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 2,
                      margin: const EdgeInsets.only(top: 5, bottom: 15),
                      color: Color(0xffd9d9d9),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Text(
                              '상품명',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff7f7f7f),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 23,
                          child: Container(
                            width: 240,
                            child: Text(
                              '[삼다수] 생수 500ml 30개입',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Text(
                              '결제 일시',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff7f7f7f),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 23,
                          child: Container(
                            width: 240,
                            child: Text(
                              '2022.02.10 16:32:10',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Text(
                              '결제 방법',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff7f7f7f),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 23,
                          child: Container(
                            width: 240,
                            child: Text(
                              '신용카드',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Text(
                              '결제 금액',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff7f7f7f),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 23,
                          child: Container(
                            width: 240,
                            child: Text(
                              '10,920원',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Text(
                              '주문 상태',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff7f7f7f),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 23,
                          child: Container(
                            width: 240,
                            child: Text(
                              '배송중',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(height: 15),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              color: Color(0xfff2f2f2),
            ),
          ),
        ],
      ),
    );
  }
}

/*
  1. 주문번호 조회
  2. 조회결과 불러오기
  3. 주문 상세 페이지 전환
  4. 주문번호 작성 시 오버플로
*/