import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';

var f = NumberFormat('###,###,###,###');

class orderHistoryDetail extends StatefulWidget {
  final _orderNum;
  final String _product;
  final String _date;
  final String _payment;
  final _price;
  final _num;
  final String _state;
  orderHistoryDetail(
      var this._orderNum,
      String this._product,
      String this._date,
      String this._payment,
      var this._price,
      var this._num,
      String this._state);

  @override
  State<orderHistoryDetail> createState() => _orderHistoryDetailState();
}

class _orderHistoryDetailState extends State<orderHistoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(context, '주문 내역 상세'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            '주문 번호',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text(
                            widget._orderNum.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            // child: ElevatedButton(
                            //   child: Text(
                            //     'mate',
                            //     style: TextStyle(
                            //       fontSize: 16,
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //   ),
                            //   style: ElevatedButton.styleFrom(
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(30),
                            //     ),
                            //     elevation: 0,
                            //     primary: Color(0xffffa511),
                            //   ),
                            //   onPressed: () {},
                            // ),
                            ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xffc0c0c0)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            color: Color(0xfff2f2f2),
                            height: 80,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(bottom: 12),
                                  child: Text(widget._product,
                                      style: TextStyle(fontSize: 16)),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          f.format(widget._price).toString() +
                                              '원',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            widget._num.toString() + "개",
                                            style: TextStyle(fontSize: 15)),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(widget._state,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            make_blank(),
            make_expanTile(
                '주문 정보', Container(margin: const EdgeInsets.all(20))),
            make_blank(),
            make_expanTile(
                '결제 정보',
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      make_row('결제 일시', widget._date),
                      Container(height: 10),
                      make_row('결제 방법', widget._payment),
                      Container(height: 10),
                      make_row(
                          '결제 금액',
                          f.format(widget._price * widget._num).toString() +
                              '원'),
                    ],
                  ),
                )),
            make_blank(),
            make_expanTile(
                '배송 정보', Container(margin: const EdgeInsets.all(20))),
            make_blank(),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              child: Text(
                "주문 직접 취소는 '입금확인' 상태일 때만 가능합니다.",
                style: TextStyle(
                  color: Color(0xffa6a6a6),
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 15, right: 15),
              width: 500,
              child: ElevatedButton(
                child: Text(
                  '주문 취소',
                  style: TextStyle(fontSize: 18, color: Color(0xffd9d9d9)),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.white,
                  side: BorderSide(width: 2, color: Color(0xffd9d9d9)),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget make_blank() {
  return Column(
    children: [
      Container(height: 2, color: Color(0xffc0c0c0)),
      Container(height: 7, color: Color(0xfff2f2f2)),
      Container(height: 2, color: Color(0xffc0c0c0))
    ],
  );
}

Widget make_row(String text, String content) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Expanded(
        flex: 1,
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Container(
          width: 240,
          child: Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    ],
  );
}

Widget make_expanTile(String title, Container cont) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
    child: ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      children: [cont],
    ),
  );
}
