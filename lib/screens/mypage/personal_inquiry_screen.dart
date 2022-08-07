import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/frequently_asked_q&a_screen.dart';
import 'package:baljachwi_project/screens/mypage/write_personal_inquiry_screen.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';
import 'package:baljachwi_project/screens/mypage/class.dart';
import 'package:intl/intl.dart';

class personalInquiry extends StatefulWidget {
  @override
  State<personalInquiry> createState() => _personalInquiryState();
}

class _personalInquiryState extends State<personalInquiry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: makeAppBar(context, '1:1 문의'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 18),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '상담시간',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(18, 8, 0, 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '평일(월-금) 10:00 ~ 17:00',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffa6a6a6),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: ElevatedButton(
                            child: Text(
                              '자주하는 질문 보기',
                              style: TextStyle(
                                color: Color(0xffffa511),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Color(0xffffa511)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 0,
                              primary: Colors.white,
                              fixedSize: Size(80, 50),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => frequentQuestion(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: ElevatedButton(
                            child: Text(
                              '문의하기',
                              style: TextStyle(
                                fontSize: 15,
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      writePersonalInquiry('userID'),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(height: 1, color: Color(0xffd9d9d9)),
            Container(
              constraints: BoxConstraints(minHeight: 600),
              child: FutureBuilder(
                  future: _getPersonal(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Something went wrong");
                    }
                    if (!snapshot.hasData) {
                      return const Text("불러오는 중..");
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<personalInq> iList = snapshot.data;
                      List<Container> mainContainer = [];
                      for (personalInq doc in iList) {
                        mainContainer.add(make_inquiryHistory(
                            doc.category, doc.title, doc.content));
                      }
                      return Container(
                          child: Column(children: mainContainer.toList()));
                    }
                    return const Text("불러오는 중..");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class personalInq {
  var type;
  var category;
  var title;
  var content;
  var writer;
  var date;
  var isReply;
  var reply;
}

Future<List<personalInq>> _getPersonal() async {
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection('personalInquiry');
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await collectionReference.where('writer', isEqualTo: 'userID').get();
  List<personalInq> Inq = [];
  for (var doc in querySnapshot.docs) {
    personalInq tmp = personalInq();
    tmp.type = doc['type'];
    tmp.category = doc['category'];
    tmp.title = doc['title'];
    tmp.content = doc['content'];
    tmp.writer = doc['writer'];
    tmp.date = doc['date'];
    tmp.isReply = doc['isReply'];
    Inq.add(tmp);
  }
  return Inq;
}

Container make_inquiryHistory(
    String _category, String _title, String _content) {
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    color: Colors.white,
    width: double.infinity,
    child: Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            _category + ' 문의',
            style: TextStyle(
                color: Color(0xffa6a6a6),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            _title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            _content,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    ),
  );
}
