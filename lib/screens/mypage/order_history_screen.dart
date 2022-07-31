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
    return Container(
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height *
              MediaQuery.of(context).devicePixelRatio,
          minWidth: MediaQuery.of(context).size.width *
              MediaQuery.of(context).devicePixelRatio),
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
            Container(
              child: Column(
                children: [
                  make_orderList(context, 12224, '[삼다수] 생수 500ml 30개입',
                      '2022.02.10 16:32:10', '신용카드', 10920, 2, '배송중'),
                  make_orderList(context, 14, '[삼다수] 생수 500ml 30개입',
                      '2022.02.10 16:32:10', '신용카드', 10920, 1, '취소'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container make_orderList(BuildContext context, var _orderNum, String _product,
    String _time, String _payment, var _price, var _num, String _state) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Column(
      children: <Widget>[
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => orderHistoryDetail(
                                  _orderNum,
                                  _product,
                                  _time,
                                  _payment,
                                  _price,
                                  _num,
                                  _state),
                            ),
                          );
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
              make_row('상품명', _product),
              Container(height: 10),
              // make_row('상품 가격', f.format(_price).toString() + '원'),
              // Container(height: 10),
              // make_row('상품 개수', _num.toString() + '개'),
              // Container(height: 10),
              make_row('결제 금액', f.format(_price * _num).toString() + '원'),
              Container(height: 10),
              make_row('결제 일시', _time),
              Container(height: 10),
              // make_row('결제 방법', _payment),
              // Container(height: 10),
              make_row('주문 상태', _state),
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

Row make_row(String title, String content) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Expanded(
        flex: 7,
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          child: Text(
            title,
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
            content,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  );
}
