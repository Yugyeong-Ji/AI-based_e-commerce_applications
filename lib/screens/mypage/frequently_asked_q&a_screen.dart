import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';

class QA {
  var category;
  var title;
  var content;
}

class frequentQuestion extends StatefulWidget {
  @override
  State<frequentQuestion> createState() => _frequentQuestionState();
}

class _frequentQuestionState extends State<frequentQuestion> {
  CollectionReference noticeCol = FirebaseFirestore.instance.collection('QA');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '자주하는 질문',
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
            TabBar(
              indicatorColor: Color(0xffffa511),
              labelColor: Color(0xffffa511),
              unselectedLabelColor: Color(0xffa6a6a6),
              unselectedLabelStyle: TextStyle(
                decoration: TextDecoration.none,
              ),
              tabs: [
                make_tap('Best'),
                make_tap('주문결제'),
                make_tap('배송'),
                make_tap('취소/환불')
              ],
            ),
            Container(
              height: 2,
              color: Color(0xffd9d9d9),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  make_screen1(),
                  make_screen2('주문결제'),
                  make_screen2('배송'),
                  make_screen2('취소/환불'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<QA>> _getQA() async {
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection('QA');
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await collectionReference.get();
  List<QA> qa = [];
  for (var doc in querySnapshot.docs) {
    QA tmp = new QA();
    tmp.category = doc['category'];
    tmp.title = doc['title'];
    tmp.content = doc['content'];
    qa.add(tmp);
  }
  return qa;
}

Future<List<QA>> _getQAcategory(String _category) async {
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection('QA');
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await collectionReference.where('category', isEqualTo: _category).get();
  List<QA> qa = [];
  for (var doc in querySnapshot.docs) {
    QA tmp = new QA();
    tmp.category = doc['category'];
    tmp.title = doc['title'];
    tmp.content = doc['content'];
    qa.add(tmp);
  }
  return qa;
}

Widget make_screen1() {
  return SingleChildScrollView(
    child: Container(
      color: Colors.white,
      constraints: BoxConstraints(minHeight: 600),
      child: Column(
        children: [
          Container(
            child: FutureBuilder(
                future: _getQA(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  }
                  if (!snapshot.hasData) {
                    return const Text("불러오는 중..");
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    List<QA> qList = snapshot.data;

                    List<Container> mainContainer = [];
                    for (QA doc in qList) {
                      mainContainer.add(make_bestScreen(
                          context, doc.category, doc.title, doc.content));
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

Widget make_screen2(String _category) {
  return SingleChildScrollView(
    child: Container(
      color: Colors.white,
      constraints: BoxConstraints(minHeight: 600),
      child: Column(
        children: [
          Container(
            child: FutureBuilder(
                future: _getQAcategory(_category),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  }
                  if (!snapshot.hasData) {
                    return const Text("불러오는 중..");
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    List<QA> qList = snapshot.data;

                    List<Container> mainContainer = [];
                    for (QA doc in qList) {
                      mainContainer
                          .add(make_etcScreen(context, doc.title, doc.content));
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

Container make_bestScreen(
    BuildContext context, String _title1, String _title2, String _content) {
  return Container(
    child: Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topLeft,
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      _title1,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffa6a6a6)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: make_tabTile(_title2, _content),
                ),
              ],
            ),
          ),
        ),
        Container(height: 1, color: Color(0xffd9d9d9)),
      ],
    ),
  );
}

Container make_etcScreen(BuildContext context, String _title, String _content) {
  return Container(
    constraints: BoxConstraints(minHeight: 500),
    child: Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topLeft,
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: make_tabTile(_title, _content),
          ),
        ),
        Container(
          height: 1,
          color: Color(0xffd9d9d9),
        ),
      ],
    ),
  );
}

Container make_tabTile(String _title, String _content) {
  return Container(
    child: ExpansionTile(
      title: Text(
        _title,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 17),
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Text(
                _content,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffffa511),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
