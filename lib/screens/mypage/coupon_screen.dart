import 'package:baljachwi_project/widgets/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';

class Coupon {
  final String? title;
  var startD, endD;
  final String? content;
  final int? discount;
  Coupon(this.title, this.startD, this.endD, this.content, this.discount);

  Map<String, dynamic> toFirestore() {
    return {
      if (title != null) "title": title,
      if (startD != null) "startDate": startD,
      if (endD != null) "endDate": endD,
      if (content != null) "content": content,
      if (discount != null) "discount": discount
    };
  }
}

FirebaseFirestore db = FirebaseFirestore.instance;
CollectionReference<Map<String, dynamic>> collectionReference =
    db.collection('coupon');

class MyPage_Coupon extends StatefulWidget {
  User myInfo;
  MyPage_Coupon(this.myInfo);
  @override
  _couponPage createState() => _couponPage();
}

class _couponPage extends State<MyPage_Coupon> {
  final TextEditingController _textEditingController = TextEditingController();
  var couponFuture;
  @override
  void initState() {
    super.initState();
    couponFuture = _getMyCoupons(); // 보유한 쿠폰 내역 보기
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails details) {},
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: makeAppBar(context, 'My Coupon'),
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio),
            color: Colors.grey[200],
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                '쿠폰 등록',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                '상품권 및 쿠폰 번호를 입력하세요.',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xffa6a6a6)),
                              ),
                            ),
                            Container(
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: TextField(
                                        controller: _textEditingController,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Color(0xffffa511),
                                              width: 2,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                                color: Color(0xffffa511),
                                                width: 2),
                                          ),
                                          hintText: 'YYYY-MMMMMM',
                                          hintStyle: TextStyle(
                                              color: Color(0xffa6a6a6)),
                                        ),
                                      ),
                                      margin: const EdgeInsets.only(right: 10),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          elevation: 0,
                                          primary: const Color(0xffffa511),
                                          fixedSize: Size(double.infinity, 50),
                                        ),
                                        onPressed: () => _registerCoupon(
                                            _textEditingController.text),
                                        child: const Text(
                                          '받기',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                '•  쿠폰의 발급 기간 / 마일리지 적립 기간을 꼭 확인해주세요!',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xffa6a6a6)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ), // 1. 쿠폰 등록
                Container(
                  color: Colors.grey[200],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 10, bottom: 10),
                          alignment: Alignment.topLeft,
                          child: const Text('쿠폰 내역',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))), // 2. 쿠폰 내역
                      SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: FutureBuilder(
                              future: couponFuture,
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasError)
                                  return const Text("Something went wrong");
                                if (!snapshot.hasData)
                                  return const Text("불러오는 중..");
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  List<Container> mainContainer = [];
                                  for (Coupon doc in snapshot.data) {
                                    var deadline =
                                        "${DateFormat("yyyy-MM-dd").format(doc.startD.toDate())} ~ ${DateFormat("yyyy-MM-dd").format(doc.endD.toDate())}";
                                    mainContainer.add(make_coupon(
                                        deadline,
                                        doc.title.toString(),
                                        doc.content.toString()));
                                  }
                                  return Column(
                                      children: mainContainer.toList());
                                }
                                return const Text("불러오는 중..");
                              }))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 나의 쿠폰 내역을 가져오는 메소드
  Future<List<Coupon>> _getMyCoupons() async {
    List<Coupon> coupons = [];
    for (var coupon in widget.myInfo.coupon) {
      DocumentSnapshot doc = await collectionReference.doc(coupon).get();
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      coupons.add(Coupon(data['title'], data['startDate'], data['endDate'],
          data['content'], data['discount']));
    }
    return coupons;
  }

  // 쿠폰 등록하는 메소드
  // 1. 해당 쿠폰번호로 get()해서 문서 받기.
  // 2. 받아온 문서 있는지 확인
  // 2-1. 있으면 =>  => myInfo 다시 받아오기(or 옵저버로 걍 변화 감지하게?), => coupon 다시 불러오기
  // 2-2. 없으면 => Toast()
  void _registerCoupon(String couponID) async {
    _textEditingController.clear();
    if (couponID == null || couponID.length != 20) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('유효하지 않은 쿠폰입니다!')));

      return;
    }
    DocumentSnapshot doc = await collectionReference.doc(couponID).get();
    if (doc.exists) {
      print('exists');
      // 1. local 업데이트
      widget.myInfo.coupon.add(couponID);
      // 2. firebase에 업데이트부분 업데이트
      var result = await db
          .collection('user')
          .doc(widget.myInfo.email)
          .update({'coupon': widget.myInfo.coupon});
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('쿠폰등록이 완료되었습니다.')));
      couponFuture = _getMyCoupons();
      //=> 추후 보완 예정
    } else {
      print('NOP');
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('해당 쿠폰이 존재하지 않습니다. 다시 입력해주세요.')));
    }
  }
}

Container make_coupon(String _deadline, String _title, String _content) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15)),
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(20),
    child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            _deadline,
            style: const TextStyle(fontSize: 14, color: Color(0xffa6a6a6)),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12, bottom: 3),
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
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        )
      ],
    ),
  );
}

Future<bool> registration_coupon(String coupon_num) async {
  var querySnapshot = await collectionReference.doc(coupon_num).get();
  //if querySnapshot.hasDa
  return false;
}
