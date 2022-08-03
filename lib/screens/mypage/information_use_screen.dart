import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';

class useGuide {
  var membership;
  var order;
  var deliveryMate;
}

class informationUse extends StatelessWidget {
  const informationUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(context, '이용 안내'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 2,
              color: Color(0xffc0c0c0),
            ),
            FutureBuilder(
                future: _getUseGuide(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  }
                  if (!snapshot.hasData) {
                    return const Text("불러오는 중..");
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    List<useGuide> qList = snapshot.data;

                    List<Container> mainContainer = [];
                    for (useGuide doc in qList) {
                      mainContainer.add(makeUG(
                        doc.membership,
                        doc.order,
                        doc.deliveryMate,
                      ));
                    }
                    return Container(
                        child: Column(children: mainContainer.toList()));
                  }
                  return const Text("불러오는 중..");
                }),
          ],
        ),
      ),
    );
  }
}

Future<List<useGuide>> _getUseGuide() async {
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection('useGuide');
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await collectionReference.get();
  List<useGuide> UG = [];
  for (var doc in querySnapshot.docs) {
    useGuide tmp = new useGuide();
    tmp.membership = doc['membership'];
    tmp.order = doc['order'];
    tmp.deliveryMate = doc['deliveryMate'];
    UG.add(tmp);
  }
  return UG;
}

Container makeUG(String membership, String order, String deliveryMate) {
  return Container(
    child: Column(
      children: [
        makeBlock('회원 / 혜택', membership),
        makeBlock('주문 / 결제', order),
        makeBlock('배송 / 함께 배송', deliveryMate),
      ],
    ),
  );
}

Column makeBlock(String title, String content) {
  return Column(
    children: [
      Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5, bottom: 10),
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(minHeight: 150),
              color: Color(0xfff2f2f2),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text(
                content,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 1,
        color: Color(0xffd9d9d9),
      ),
    ],
  );
}
