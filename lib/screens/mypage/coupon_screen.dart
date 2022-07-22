import 'package:baljachwi_project/screens/mypage/notice_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Coupon{
  var title;
  var startD,endD;
  var content;
  var discount;
  Coupon(_title,_startD,_endD,_content,_discount){
    this.title = _title;
    this.startD = _startD;
    this.endD = _endD;
    this.content = _content;
    this.discount = _discount;
  }
}
CollectionReference<Map<String,dynamic>> collectionReference = FirebaseFirestore.instance.collection('coupon');
class MyPage_Coupon extends StatefulWidget {
  @override
  _coupon createState() => _coupon();
}
class _coupon extends State<MyPage_Coupon>{
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Coupon',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          color: Colors.black,
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 2,
              color: const Color(0xffc0c0c0),
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      '쿠폰 등록',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      '상품권 및 쿠폰 번호를 입력하세요.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffa6a6a6),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 50,
                          child: TextField(
                            controller: _textEditingController,
                            style: const TextStyle(
                              color: Color(0xffd9d9d9),
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              labelText: 'YYYY-MMMMMM',
                            ),
                          ),
                          margin: const EdgeInsets.only(right: 10),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: ElevatedButton(
                            child: const Text(
                              '받기',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                              primary: const Color(0xffffa511),
                              fixedSize: Size(80, 50),
                            ),
                            onPressed: () {
                              _textEditingController.clear();

                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      '•  쿠폰의 발급 기간 / 마일리지 적립 기간을 꼭 확인해주세요!',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffa6a6a6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xfff2f2f2),
              padding: const EdgeInsets.all(25),
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 5, bottom: 10),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      '쿠폰 내역',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: _getNotice(),
                      builder: (BuildContext context, AsyncSnapshot snapshot){
                        if (snapshot.hasError) {
                          return const Text("Something went wrong");
                        }
                        if (!snapshot.hasData) {
                          return const Text("불러오는 중..");
                        }
                        if (snapshot.connectionState == ConnectionState.done) {
                          List<Container> mainContainer = [];
                          for(Coupon doc in snapshot.data) {
                            mainContainer.add(make_coupon(doc.startD.toString()+'~'+doc.endD.toString(), doc.title,doc.content));
                          }
                          return Container(child: Column(children: mainContainer.toList()));
                        }
                        return const Text("불러오는 중..");
                      }
                  ),
                  //make_coupon('2022.6.1~2022.8.1', '만나서 반가워요! 10% 쿠폰', '10% 할인'),
                  //make_coupon('2022.5.1~2022.8.1', '생수 LOVER를 위한 당신', '삼다수 20% 할인'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Coupon>> _getNotice() async{
  QuerySnapshot<Map<String,dynamic>> querySnapshot = await collectionReference.get();
  List<Coupon> coupons = [];
  for(var doc in querySnapshot.docs){
    Coupon tmp = Coupon(
        doc['title'],
        DateFormat("yyyy-MM-dd").format(doc['startDate'].toDate()).toString(),
        DateFormat("yyyy-MM-dd").format(doc['endDate'].toDate()),
        doc['content'],
        doc['discount']
    );
    coupons.add(tmp);
  }
  print(coupons.length);
  return coupons;
}
Container make_coupon(String _deadline,String _title,String _content){
  return Container(
    color: Colors.white,
    margin: const EdgeInsets.only(top: 10, bottom: 10),
    padding: const EdgeInsets.all(15),
    child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            _deadline,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xffa6a6a6),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 25, bottom: 5),
          alignment: Alignment.centerLeft,
          child: Text(
            _title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            _content,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        )
      ],
    ),
  );
}
/*
1. 쿠폰 유효성 검사 후 등록
2. 연동
3. 쿠폰 등록 textfield border color, width
*/
Future<bool> registration_coupon(String coupon_num) async {
  var querySnapshot = await collectionReference.doc(coupon_num).get();
  //if querySnapshot.hasDa
  return false;
}