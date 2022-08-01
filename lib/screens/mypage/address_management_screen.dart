import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/add_address_screen.dart';

class addressManage extends StatelessWidget {
  const addressManage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '배송지 관리',
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
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 2,
              color: Color(0xffc0c0c0),
            ),
            manage_address("HOME", "경기도 강남구 강남대로 100길 10, 1층", "문 앞에 두세요",
                "010-0000-0000"),
            manage_address("동방", "경기도 수원시 영통구 광교산로 154-42 2층 210호", "문 앞에 두세요",
                "010-0000-0000"),
            make_addButton(context),
          ],
        ),
      ),
    );
  }
}

Container manage_address(
    String _adrName, String _address, String _message, String _phoneNum) {
  return Container(
    child: Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
          child: Column(
            children: [
              make_title(_adrName),
              make_content(_address),
              make_content(_message),
              make_content(_phoneNum),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: make_editButton(),
                  ),
                  Expanded(
                    flex: 1,
                    child: make_deleteButton(),
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

Container make_title(String _title) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8),
    alignment: Alignment.centerLeft,
    child: Text(
      _title,
      style: TextStyle(
        color: Color(0xffffa511),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
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

Container make_editButton() {
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
      onPressed: () {},
    ),
  );
}

Container make_deleteButton() {
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
      onPressed: () {},
    ),
  );
}

Container make_addButton(BuildContext context) {
  return Container(
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
  );
}
