import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';

class NMOrder {
  var orderNumber;
  var name;
  var phoneNumber;
  var address;
  var product;
  var orderTime;
  var payment;
  var price;
  var num;
  var state;
}

class nonmemberOrder extends StatefulWidget {
  const nonmemberOrder({Key? key}) : super(key: key);

  @override
  State<nonmemberOrder> createState() => _nonmemberOrderState();
}

class _nonmemberOrderState extends State<nonmemberOrder> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(context, '비회원 주문 내역'),
      body: Container(
        constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height *
                MediaQuery.of(context).devicePixelRatio),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 2,
              color: Color(0xffc0c0c0),
            ),
            GestureDetector(
              onVerticalDragUpdate: (DragUpdateDetails details) {},
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(35.0),
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
                              controller: _textController,
                              onSubmitted: _handlesubmitted,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Color(0xffd9d9d9),
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Color(0xffffa511),
                                    width: 2,
                                  ),
                                ),
                                hintText: '주문 번호를 입력해주세요.',
                                hintStyle: TextStyle(
                                  color: Color(0xffd9d9d9),
                                ),
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
                              onPressed: () => _handlesubmitted,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 2,
              color: Color(0xffc0c0c0),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.grey[200],
                  child: Column(
                    children: <Widget>[
                      FutureBuilder(
                          future: _getNMOrder(_textController.text),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasError) {
                              return const Text("Something went wrong");
                            }
                            if (!snapshot.hasData) {
                              return const Text("불러오는 중..");
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              List<NMOrder> qList = snapshot.data;

                              List<Container> mainContainer = [];
                              for (NMOrder doc in qList) {
                                mainContainer.add(make_orderList(
                                    context,
                                    doc.orderNumber,
                                    doc.product,
                                    doc.orderTime,
                                    doc.payment,
                                    doc.price,
                                    doc.num,
                                    doc.state));
                              }
                              return Container(
                                  child:
                                      Column(children: mainContainer.toList()));
                            }
                            return const Text("불러오는 중..");
                          }),
                      Container(
                        height: 10,
                        color: Colors.grey[200],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _handlesubmitted(String text) {
  _getNMOrder(text);
}

Future<List<NMOrder>> _getNMOrder(var orderNumber) async {
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection('nonmemberOrder');
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await collectionReference
      .where('orderNumber', isEqualTo: orderNumber)
      .get();
  List<NMOrder> nmOrder = [];
  for (var doc in querySnapshot.docs) {
    NMOrder tmp = new NMOrder();
    tmp.orderNumber = doc['orderNumber'];
    tmp.name = doc['name'];
    tmp.phoneNumber = doc['phoneNumber'];
    tmp.address = doc['address'];
    tmp.product = doc['product'];
    tmp.orderTime = DateFormat("yyyy-MM-dd").format(doc['orderTime'].toDate());
    tmp.payment = doc['payment'];
    tmp.price = doc['price'];
    tmp.num = doc['num'];
    tmp.state = doc['state'];
    nmOrder.add(tmp);
  }
  return nmOrder;
}
