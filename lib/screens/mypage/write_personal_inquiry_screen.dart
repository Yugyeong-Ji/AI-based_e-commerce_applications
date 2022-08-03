import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';

class writePersonalInquiry extends StatefulWidget {
  final String userID;

  const writePersonalInquiry(this.userID);

  @override
  State<writePersonalInquiry> createState() => _writePersonalInquiryState();
}

class _writePersonalInquiryState extends State<writePersonalInquiry> {
  final _valueList = ['배송', '주문 취소', '배송지 변경', '반품/교환', '기타 문의'];
  String? _selectedValue;
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(context, '1:1 문의 작성'),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 2,
            color: const Color(0xffc0c0c0),
          ),
          Container(
            color: const Color(0xfff2f2f2),
            padding: const EdgeInsets.all(25),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(25),
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
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
                      hint: const Text(' 문의 유형을 선택해주세요'),
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
                      style: const TextStyle(
                        color: Color(0xffa6a6a6),
                        fontSize: 16,
                      ),
                      isExpanded: true,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
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
                      controller: _titleController,
                      style: const TextStyle(color: Color(0xffa6a6a6)),
                      decoration:
                          const InputDecoration(hintText: ' 제목을 입력해주세요'),
                    ),
                  ),
                  Container(
                    height: 200,
                    margin: const EdgeInsets.only(top: 35),
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0xffa6a6a6),
                      ),
                    ),
                    child: TextField(
                      controller: _contentController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: const TextStyle(color: Color(0xffa6a6a6)),
                      decoration: const InputDecoration.collapsed(
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
            color: const Color(0xfff2f2f2),
            child: ElevatedButton(
              child: const Text(
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
                print('onPressed');
                if (vaildCheck()) {
                  print('valid check');
                  createNewInquiry();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  bool vaildCheck() {
    if (_selectedValue == "" ||
        _titleController.text == "" ||
        _titleController.text == "") {
      return false;
    }
    return true;
  }

  void createNewInquiry() {
    Inquiry newInquiry = Inquiry(0, _selectedValue, _titleController.text,
        _titleController.text, widget.userID, DateTime.now(), false);
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection('inquiry').add(newInquiry.toFirestore()).then((value) => {
          print('문의가 접수되었습니다!')
          //Scaffold.of(context).showSnackBar(const SnackBar(content:Text('문의가 접수되었습니다!')))
        });
    //
  }
}

class Inquiry {
  var type;
  var category;
  var title;
  var content;
  var writer;
  var date;
  var isReply;
  var reply;
  Inquiry(this.type, this.category, this.title, this.content, this.writer,
      this.date, this.isReply);
  Map<String, dynamic> toFirestore() {
    return {
      if (type != null) "type": type,
      if (category != null) "category": category,
      if (title != null) "country": title,
      if (content != null) "capital": content,
      if (writer != null) "population": writer,
      if (date != null) "regions": date,
      if (isReply != null) "isReply": isReply,
      "reply": reply,
    };
  }
}
