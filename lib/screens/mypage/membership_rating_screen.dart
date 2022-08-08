import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';

class Membership {
  var grade;
  var criteria;
  var benefit;
}

class membershipRating extends StatefulWidget {
  final String _grade;
  const membershipRating(this._grade);

  @override
  State<membershipRating> createState() => _membershipRatingState();
}

class _membershipRatingState extends State<membershipRating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(context, '회원 등급'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FutureBuilder(
                future: _getMembership(widget._grade),
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
                    List<Membership> nList = snapshot.data;

                    List<Container> mainContainer = [];
                    for (Membership doc in nList) {
                      mainContainer.add(make_membership(
                          context, doc.grade, doc.criteria, doc.benefit));
                    }
                    return Container(
                        child: Column(children: mainContainer.toList()));
                  }
                  return const Text("불러오는 중..");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<Membership>> _getMembership(String _grade) async {
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection('membership');
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await collectionReference.where('grade', isEqualTo: _grade).get();
  List<Membership> membership = [];
  for (var doc in querySnapshot.docs) {
    Membership tmp = new Membership();
    tmp.grade = doc['grade'];
    tmp.criteria = doc['criteria'];
    tmp.benefit = doc['benefit'];
    membership.add(tmp);
  }
  return membership;
}

Container make_membership(
    BuildContext context, String grade, String criteria, String benefit) {
  return Container(
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.all(20),
          child: Image.asset('assets/images/membershipGrade/${grade}.png'),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: Text(
                  grade,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffa511),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: Text(
                  criteria,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xffa6a6a6),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: Text(
                  '혜택',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff7f7f7f),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xfff2f2f2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(benefit, style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 15),
          height: 1,
          color: Color(0xffd9d9d9),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 5),
                child: Text(
                  '•  총 혜택 금액은 12개월간 동일 등급을 유지할 경우 받게 되는 적립.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffa6a6a6),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 5),
                child: Text(
                  '•  등급별 할인 혜택은 변경될 수 있습니다',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffa6a6a6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
