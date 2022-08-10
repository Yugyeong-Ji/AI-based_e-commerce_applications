import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/add_address_screen.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';
import 'package:baljachwi_project/screens/mypage/class.dart';
import 'package:baljachwi_project/screens/mypage/edit_address_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class addressManage extends StatefulWidget {
  @override
  State<addressManage> createState() => _addressManageState();
}

class _addressManageState extends State<addressManage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: makeAppBar(context, '배송지 관리'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: _getAddress(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  }
                  if (!snapshot.hasData) {
                    return const Text("불러오는 중..");
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    List<Address> qList = snapshot.data;

                    List<Container> mainContainer = [];
                    for (Address doc in qList) {
                      mainContainer.add(manage_address(
                        context,
                        doc.isDefault,
                        doc.name,
                        doc.address,
                        doc.message,
                        doc.phone,
                      ));
                    }
                    return Container(
                        child: Column(children: mainContainer.toList()));
                  }
                  return const Text("불러오는 중..");
                }),
            Container(
              width: double.infinity,
              height: 45,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              color: Colors.white,
              child: TextButton(
                child: Text('+ 배송지 추가',
                    style: TextStyle(
                      color: Color(0xffffa511),
                      fontWeight: FontWeight.bold,
                    )),
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    const BorderSide(
                      width: 1,
                      color: Color(0xffc0c0c0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => addAddress(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Address {
  var isDefault;
  var name;
  var address;
  var message;
  var phone;
}

Future<List<Address>> _getAddress() async {
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection('address');
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await collectionReference.get();
  List<Address> adrs = [];
  for (var doc in querySnapshot.docs) {
    Address tmp = new Address();
    tmp.isDefault = doc['isDefault'];
    tmp.name = doc['name'];
    tmp.address = doc['address'];
    tmp.message = doc['message'];
    tmp.phone = doc['phone'];
    adrs.add(tmp);
  }
  return adrs;
}

Container manage_address(BuildContext context, bool isDefault, String name,
    String address, String message, String phone) {
  return Container(
    child: Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  style: TextStyle(
                    color: Color(0xffffa511),
                    fontSize: 18,
                    fontWeight:
                        (isDefault ? FontWeight.bold : FontWeight.normal),
                  ),
                ),
              ),
              make_content(address),
              make_content(message),
              make_content(phone),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: make_editButton(
                        context, isDefault, name, address, message, phone),
                  ),
                  Expanded(
                    flex: 1,
                    child: make_deleteButton(context, name),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: Color(0xffc0c0c0),
        ),
      ],
    ),
  );
}

Container make_content(String _content) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5),
    alignment: Alignment.centerLeft,
    child: Text(
      _content,
      style: TextStyle(fontSize: 16),
    ),
  );
}

Container make_editButton(BuildContext context, bool isDefault, String name,
    String address, String message, String phone) {
  return Container(
    margin: const EdgeInsets.all(2),
    child: TextButton(
      child: Text('수정',
          style: TextStyle(
            color: Color(0xffa6a6a6),
          )),
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          const BorderSide(
            width: 2,
            color: Color(
              0xffa6a6a6,
            ),
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                editAddress(isDefault, name, address, message, phone),
          ),
        );
      },
    ),
  );
}

Container make_deleteButton(BuildContext context, String name) {
  return Container(
    margin: const EdgeInsets.all(2),
    child: TextButton(
      child: Text('삭제',
          style: TextStyle(
            color: Color(0xffa6a6a6),
          )),
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          const BorderSide(
            width: 2,
            color: Color(0xffa6a6a6),
          ),
        ),
      ),
      onPressed: () {
        deletedata(context, name);
      },
    ),
  );
}

void deletedata(BuildContext context, String name) {
  FirebaseFirestore.instance
      .collection("address")
      .doc(name)
      .delete()
      .then((value) => makeDialog(context, '주소지가 삭제되었습니다.'));
}
