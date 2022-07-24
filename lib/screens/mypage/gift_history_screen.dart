import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

var f = NumberFormat('###,###,###,###');

class giftHistory extends StatefulWidget {
  @override
  State<giftHistory> createState() => _giftHistory();
}

class _giftHistory extends State<giftHistory> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '선물 내역',
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
              color: Color(0xffd9d9d9),
            ),
            TabBar(
              indicatorColor: Color(0xffffa511),
              labelColor: Color(0xffffa511),
              unselectedLabelColor: Color(0xffa6a6a6),
              unselectedLabelStyle: TextStyle(
                decoration: TextDecoration.none,
              ),
              tabs: [
                Container(
                  height: 55,
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Text(
                    'MY 선물함(1)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Text(
                    '선물한 내역(24)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 2,
              color: Color(0xffd9d9d9),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  make_giftFrom('SSS', '삼다수', '생수 2L 3개입'),
                  Container(
                    child: Column(
                      children: [
                        make_giftTo('SSS', '삼다수', '생수 2L 3개입', 10000, 5),
                        make_giftTo('SSS', '삼다수', '생수 2L 3개입', 10000, 5),
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

Container make_giftFrom(String _by, String _company, String _product) {
  return Container(
    child: Column(
      children: [
        Container(
          height: 10,
          color: Color(0xfff2f2f2),
        ),
        Container(
          height: 2,
          color: Color(0xffd9d9d9),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.all(10),
                child: Text(
                  'By. ' + _by + ' 님',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color(0xffffa511),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
                          child: Text(
                            _company,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color(0xff7F7F7F),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            _product,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 120,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color(0xffd9d9d9),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                color: Color(0xfff2f2f2),
                child: ElevatedButton(
                  child: Text(
                    '선물 보내기',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Color(0xffffa511),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>(),
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 2,
          color: Color(0xffd9d9d9),
        ),
      ],
    ),
  );
}

Container make_giftTo(
    String _to, String _company, String _product, var _price, var _num) {
  var _sum = _price * _num;
  return Container(
    child: Column(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                height: 10,
                color: Color(0xfff2f2f2),
              ),
              Container(
                height: 2,
                color: Color(0xffd9d9d9),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.all(10),
                      child: Text(
                        'To. ' + _to + ' 님',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Color(0xffffa511),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.bottomLeft,
                                margin:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 5),
                                child: Text(
                                  _company,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Color(0xff7F7F7F),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Text(
                                  _product,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 120,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 1,
                      color: Colors.black,
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 40),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        f.format(_price).toString() + '원',
                        style: TextStyle(
                          color: Color(0xff7F7F7F),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 40),
                      alignment: Alignment.centerRight,
                      child: Text(
                        'X' + _num.toString() + '개',
                        style: TextStyle(
                          color: Color(0xff7F7F7F),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.black,
                      margin: const EdgeInsets.all(10),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 40),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '총 ' + f.format(_sum).toString() + '원',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 2,
          color: Color(0xffd9d9d9),
        ),
      ],
    ),
  );
}

/*
1. 파라미터 받게 구현했지만 DB 연동은 아직
2. 연동 후 tapbar의 숫자 수정되도록
3. overflow - 나중에 수정
*/