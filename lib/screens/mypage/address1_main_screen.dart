import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/address2_add_screen.dart';
import 'package:baljachwi_project/screens/mypage/address2_edit_screen.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';
import 'package:baljachwi_project/screens/mypage/class.dart';

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
                future: getAddress(),
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
                      mainContainer.add(manageAddress(
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

Container manageAddress(BuildContext context, bool isDefault, String name,
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
              makeContent(address),
              makeContent(message),
              makeContent(phone.length == 11
                  ? phone.substring(0, 3) +
                      '-' +
                      phone.substring(3, 7) +
                      '-' +
                      phone.substring(7, 11)
                  : phone),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: makeEditButton(
                        context, isDefault, name, address, message, phone),
                  ),
                  Expanded(
                    flex: 1,
                    child: makeDeleteButton(context, name),
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

Container makeContent(String _content) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5),
    alignment: Alignment.centerLeft,
    child: Text(
      _content,
      style: TextStyle(fontSize: 16),
    ),
  );
}

Container makeEditButton(BuildContext context, bool isDefault, String name,
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

Container makeDeleteButton(BuildContext context, String name) {
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
