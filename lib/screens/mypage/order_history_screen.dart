import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/order_history_detail_screen.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';
import 'package:baljachwi_project/screens/mypage/class.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        backgroundColor: Colors.grey[200],
        appBar: makeAppBar(context, '주문 내역'),
        body: SingleChildScrollView(
          child: Container(
            child: FutureBuilder(
                future: _getOrder(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  }
                  if (!snapshot.hasData) {
                    return const Text("불러오는 중..");
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    List<Order> qList = snapshot.data;

                    List<Container> mainContainer = [];
                    for (Order doc in qList) {
                      mainContainer.add(make_orderList(
                          context,
                          doc.orderNumber,
                          '[' + doc.company + '] ' + doc.product,
                          doc.date,
                          doc.payment,
                          doc.price,
                          doc.num,
                          doc.state));
                    }
                    return Container(
                        child: Column(children: mainContainer.toList()));
                  }
                  return const Text("불러오는 중..");
                }),
          ),
        ),
      ),
    );
  }
}

Future<List<Order>> _getOrder() async {
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection('orderHistory');
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await collectionReference.get();
  List<Order> mOrder = [];
  for (var doc in querySnapshot.docs) {
    Order tmp = new Order();
    tmp.orderNumber = doc['orderNumber'];
    tmp.company = doc['company'];
    tmp.product = doc['product'];
    tmp.date = DateFormat("yyyy-MM-dd").format(doc['date'].toDate());
    tmp.payment = doc['payment'];
    tmp.price = doc['price'];
    tmp.num = doc['num'];
    tmp.state = doc['state'];
    mOrder.add(tmp);
  }
  return mOrder;
}
