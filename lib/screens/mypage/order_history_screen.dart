import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/order_history_detail_screen.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';
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
              color: Colors.grey[200],
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
