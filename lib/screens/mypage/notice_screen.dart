import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:baljachwi_project/screens/mypage/notice_detail_screen.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';

class Notice {
  var title;
  var date;
  var content;
}

class MyPage_Notice extends StatefulWidget {
  @override
  _Notice createState() => _Notice();
}

class _Notice extends State<MyPage_Notice> {
  CollectionReference noticeCol =
      FirebaseFirestore.instance.collection('notice');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(context, '공지 사항'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(height: 2, color: const Color(0xffc0c0c0)),
            FutureBuilder(
                future: _getNotice(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  }
                  if (!snapshot.hasData) {
                    return const Text("불러오는 중..");
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    //return ListView(
                    //children: snapshot.data,
                    //);
                    List<Notice> nList = snapshot.data;

                    List<Container> mainContainer = [];
                    for (Notice doc in nList) {
                      mainContainer.add(make_notice(context, doc.title,
                          doc.date.toString(), doc.content));
                    }
                    return Container(
                        child: Column(children: mainContainer.toList()));
                  }
                  return const Text("불러오는 중..");
                })
          ],
        ),
      ),
    );
  }
}

Future<List<Notice>> _getNotice() async {
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection('notice');
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await collectionReference.get();
  List<Notice> notices = [];
  for (var doc in querySnapshot.docs) {
    Notice tmp = new Notice();
    tmp.title = doc['title'];
    tmp.date = DateFormat("yyyy-MM-dd").format(doc['date'].toDate());
    tmp.content = doc['content'];
    notices.add(tmp);
  }
  return notices;
}

// make new notice - method
Container make_notice(
    BuildContext context, String _title, String _date, String _content) {
  return Container(
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => noticeDetail(_title, _date, _content),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 30),
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _date,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xffa6a6a6),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    '[공지] ' + _title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: const Color(0xffd9d9d9),
          )
        ],
      ),
    ),
  );
}
