import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';
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
        backgroundColor: Colors.grey[200],
        appBar: makeAppBar(context, '선물 내역'),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: TabBar(
                indicatorColor: Color(0xffffa511),
                labelColor: Color(0xffffa511),
                unselectedLabelColor: Color(0xffa6a6a6),
                unselectedLabelStyle: TextStyle(
                  decoration: TextDecoration.none,
                ),
                tabs: [
                  makeTap('MY 선물함'),
                  makeTap('선물한 내역'),
                ],
              ),
            ),
            Container(height: 2, color: Color(0xffd9d9d9)),
            Expanded(
              child: TabBarView(
                children: [
                  makeMyGiftS(),
                  makeGiftHistoryS(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class myG {
  var by;
  var company;
  var product;
}

Future<List<myG>> getMyG() async {
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance
          .collection('/gift/nNQWAya8zJI9K336unYo/myGift');
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await collectionReference.get();
  List<myG> my = [];
  for (var doc in querySnapshot.docs) {
    myG tmp = myG();
    tmp.by = doc['by'];
    tmp.company = doc['company'];
    tmp.product = doc['product'];
    my.add(tmp);
  }
  return my;
}

Widget makeMyGiftS() {
  return SingleChildScrollView(
    child: Container(
      constraints: BoxConstraints(minHeight: 600),
      child: FutureBuilder(
          future: getMyG(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }
            if (!snapshot.hasData) {
              return const Text("불러오는 중..");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              List<myG> qList = snapshot.data;
              List<Container> mainContainer = [];
              for (myG doc in qList) {
                mainContainer
                    .add(makeMyGiftB(doc.by, doc.company, doc.product));
              }
              return Container(child: Column(children: mainContainer.toList()));
            }
            return const Text("불러오는 중..");
          }),
    ),
  );
}

Container makeMyGiftB(String _by, String _company, String _product) {
  return Container(
    child: Column(
      children: [
        Container(height: 7, color: Color(0xfff2f2f2)),
        Container(height: 2, color: Color(0xffd9d9d9)),
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
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
                  onPressed: () {},
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

class gHistory {
  var to;
  var company;
  var product;
  var price;
  var num;
}

Future<List<gHistory>> getGHistory() async {
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance
          .collection('/gift/nNQWAya8zJI9K336unYo/giftHistory');
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await collectionReference.get();
  List<gHistory> his = [];
  for (var doc in querySnapshot.docs) {
    gHistory tmp = gHistory();
    tmp.to = doc['to'];
    tmp.company = doc['company'];
    tmp.product = doc['product'];
    tmp.price = doc['price'];
    tmp.num = doc['num'];
    his.add(tmp);
  }
  return his;
}

Widget makeGiftHistoryS() {
  return SingleChildScrollView(
    child: Container(
      constraints: BoxConstraints(minHeight: 600),
      child: FutureBuilder(
          future: getGHistory(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }
            if (!snapshot.hasData) {
              return const Text("불러오는 중..");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              List<gHistory> qList = snapshot.data;
              List<Container> mainContainer = [];
              for (gHistory doc in qList) {
                mainContainer.add(makeGiftHistoryB(
                    doc.to, doc.company, doc.product, doc.price, doc.num));
              }
              return Container(child: Column(children: mainContainer.toList()));
            }
            return const Text("불러오는 중..");
          }),
    ),
  );
}

Container makeGiftHistoryB(
    String _to, String _company, String _product, var _price, var _num) {
  var _sum = _price * _num;
  return Container(
    child: Column(
      children: [
        Container(
          child: Column(
            children: [
              Container(height: 7, color: Color(0xfff2f2f2)),
              Container(height: 2, color: Color(0xffd9d9d9)),
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
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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
