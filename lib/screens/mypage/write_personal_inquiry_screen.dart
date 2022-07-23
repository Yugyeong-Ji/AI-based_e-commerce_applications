import 'package:flutter/material.dart';

class writePersonalInquiry extends StatefulWidget {
  const writePersonalInquiry({Key? key}) : super(key: key);

  @override
  State<writePersonalInquiry> createState() => _writePersonalInquiryState();
}

class _writePersonalInquiryState extends State<writePersonalInquiry> {
  final _valueList = ['배송', '주문 취소', '배송지 변경', '반품/교환', '기타 문의']; // 예시
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '1:1 문의 작성',
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
            color: Color(0xffc0c0c0),
          ),
          Container(
            color: Color(0xfff2f2f2),
            padding: const EdgeInsets.all(25),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(25),
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '문의 유형',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: 310,
                    margin: const EdgeInsets.only(top: 5, bottom: 20),
                    child: DropdownButton(
                      hint: Text(' 문의 유형을 선택해주세요'),
                      value: _selectedValue,
                      items: _valueList
                          .map(
                            (value) => DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        ),
                      )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value as String;
                        });
                      },
                      style: TextStyle(
                        color: Color(0xffa6a6a6),
                        fontSize: 16,
                      ),
                      isExpanded: true,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '작성란',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.only(top: 5),
                    child: TextField(
                      style: TextStyle(color: Color(0xffa6a6a6)),
                      decoration: InputDecoration(hintText: ' 제목을 입력해주세요'),
                    ),
                  ),
                  Container(
                    height: 200,
                    margin: const EdgeInsets.only(top: 35),
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color(0xffa6a6a6),
                      ),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: TextStyle(color: Color(0xffa6a6a6)),
                      decoration: InputDecoration.collapsed(
                          hintText: ' 문의하실 내용을 입력해주세요'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 30, right: 30),
            color: Color(0xfff2f2f2),
            child: ElevatedButton(
              child: Text(
                '등록',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
                primary: Color(0xffffa511),
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>(),
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}