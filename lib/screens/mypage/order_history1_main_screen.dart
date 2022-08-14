import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';
import 'package:baljachwi_project/screens/mypage/class.dart';

class orderHistory extends StatefulWidget {
  @override
  State<orderHistory> createState() => _orderHistoryState();
}

class _orderHistoryState extends State<orderHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          minWidth: MediaQuery.of(context).size.width),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: makeAppBar(context, '주문 내역'),
        body: SingleChildScrollView(
          child: Container(
            child: FutureBuilder(
                future: getOrder(),
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
                      mainContainer.add(makeOrderList(
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
