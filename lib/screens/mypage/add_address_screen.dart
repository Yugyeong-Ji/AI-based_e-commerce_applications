import 'package:flutter/material.dart';

bool isDefalutAddree = false;
int _val = -1;

class addAddress extends StatefulWidget {
  const addAddress({Key? key}) : super(key: key);

  @override
  State<addAddress> createState() => _addAddressState();
}

class _addAddressState extends State<addAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '배송지 추가',
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
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      make_title('주소'),
                      Container(
                        width: 170,
                        child: RadioListTile(
                          title: Text('기본 배송지'),
                          activeColor: Color(0xffffa511),
                          value: 1,
                          groupValue: _val,
                          onChanged: (isDefalutAddree) {
                            setState(() {
                              _val = isDefalutAddree as int;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ],
                  ),
                  make_textfield("우편번호 찾기"),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: make_textfield("상세 주소"),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  ),
                  make_title('받으실 분'),
                  make_textfield('이름을 입력해주세요'),
                  make_title('휴대폰'),
                  make_textfield('휴대폰 번호를 입력해주세요'),
                  make_saveButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container make_title(String _title) {
  return Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 0, 3),
    alignment: Alignment.centerLeft,
    child: Text(
      _title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Container make_textfield(String _text) {
  return Container(
    height: 50,
    margin: const EdgeInsets.only(bottom: 5),
    child: TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffd9d9d9)),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: _text,
        labelStyle: TextStyle(
          color: Color(0xffd9d9d9),
        ),
      ),
    ),
  );
}

Container make_saveButton() {
  return Container(
    width: double.infinity,
    height: 45,
    margin: const EdgeInsets.only(top: 40),
    color: Colors.white,
    child: TextButton(
      child: Text('저장',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xffffa511)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        side: MaterialStateProperty.all(
          const BorderSide(
            width: 2,
            color: Color(0xffc0c0c0),
          ),
        ),
      ),
      onPressed: () {},
    ),
  );
}
