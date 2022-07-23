import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/order_history_detail_screen.dart';
import 'package:intl/intl.dart';

var f = NumberFormat('###,###,###,###');

class orderHistory extends StatefulWidget {
  @override
  State<orderHistory> createState() => _orderHistoryState();
}

class _orderHistoryState extends State<orderHistory> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '주문 내역',
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
                  alignment: Alignment.center,
                  child: Text(
                    '주문 내역',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  alignment: Alignment.center,
                  child: Text(
                    '자주 사는 상품',
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
                  Container(
                    color: Color(0xfff2f2f2),
                    child: Column(
                      children: [
                        make_orderList(12224, '[삼다수] 생수 500ml 30개입',
                            '2022.02.10 16:32:10', '신용카드', 10920, '배송중'),
                        make_orderList(14, '[삼다수] 생수 500ml 30개입',
                            '2022.02.10 16:32:10', '신용카드', 10920, '취소'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                        child: Text('자주 사는 상품'),
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

Container make_orderList(var _orderNum, String _product, String _time,
    String _payment, var _price, String _state) {
  return Container(
    width: double.infinity,
    alignment: Alignment.centerLeft,
    child: Column(
      children: <Widget>[
        Container(
          height: 20,
          color: Color(0xfff2f2f2),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(35, 5, 35, 20),
          child: Column(
            children: [
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
                        _orderNum.toString(),
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
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => orderHistoryDetail(),
                          //   ),
                          // );
                        },
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
                        _product,
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
                        _time,
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
                        _payment,
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
                        f.format(_price).toString() + '원',
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
                        _state,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/*
1. 연동
2. 연동 후 주문번호 조회해서 불러오기(위에서부터 최근~오래된 주문)
3. mate 뜨도록
4. 자주 사는 상품
5. overflow?
6. detail 연결
*/