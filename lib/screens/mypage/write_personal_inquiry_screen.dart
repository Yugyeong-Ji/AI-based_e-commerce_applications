import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';
import 'package:baljachwi_project/screens/mypage/class.dart';

class writePersonalInquiry extends StatefulWidget {
  final String userID;
  const writePersonalInquiry(this.userID);

  @override
  State<writePersonalInquiry> createState() => _writePersonalInquiryState();
}

class _writePersonalInquiryState extends State<writePersonalInquiry> {
  final formKey = GlobalKey<FormState>();
  final _valueList = ['배송', '주문 취소', '배송지 변경', '반품/교환', '기타 문의'];
  String? _selectedValue;
  String? _title;
  String? _content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: makeAppBar(context, '1:1 문의 작성'),
      body: SingleChildScrollView(
        child: GestureDetector(
          onVerticalDragUpdate: (DragUpdateDetails details) {},
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: formKey,
            child: ListBody(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.all(25),
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: <Widget>[
                      make_inquiryText('문의 유형'),
                      Container(
                        width: 310,
                        margin: const EdgeInsets.only(bottom: 20),
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
                              color: Color(0xffa6a6a6), fontSize: 16),
                          isExpanded: true,
                        ),
                      ),
                      make_inquiryTextForm(
                        '작성란',
                        TextFormField(
                          decoration: inquiryFieldDeco('제목을 입력해주세요'),
                          onSaved: (val) {
                            setState(() {
                              _title = val;
                            });
                          },
                        ),
                      ),
                      Container(
                        height: 200,
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0xffa6a6a6)),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration.collapsed(
                            hintText: ' 문의하실 내용을 입력해주세요',
                            hintStyle: TextStyle(color: Color(0xffa6a6a6)),
                          ),
                          onSaved: (val) {
                            setState(() {
                              _content = val;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(25, 0, 25, 30),
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
                      formKey.currentState?.save();
                      if (vaildCheck()) {
                        createNewInquiry();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool vaildCheck() {
    if (_selectedValue == "" || _title == "" || _content == "") {
      return false;
    }
    return true;
  }

  void createNewInquiry() {
    personalInq newInquiry = personalInq(0, _selectedValue, _title, _content,
        widget.userID, DateTime.now(), false);
    FirebaseFirestore db = FirebaseFirestore.instance;
    db
        .collection('personalInquiry')
        .add(newInquiry.toFirestore())
        .then((value) => {_showDialog(context, '문의가 접수되었습니다.')});
    //
  }
}

void _showDialog(BuildContext context, String text) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pop(context);
      });
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        content: Container(
          alignment: Alignment.center,
          width: 200,
          height: 50,
          child: Text(text, style: TextStyle(fontSize: 18)),
        ),
      );
    },
  );
}
