import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';
import 'package:baljachwi_project/screens/mypage/class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

bool isDefault = false;

class addAddress extends StatefulWidget {
  @override
  State<addAddress> createState() => _addAddressState();
}

class _addAddressState extends State<addAddress> {
  final TextEditingController nC = TextEditingController();
  final TextEditingController aC = TextEditingController();
  final TextEditingController mC = TextEditingController();
  final TextEditingController pC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: makeAppBar(context, '배송지 추가'),
      body: SingleChildScrollView(
        child: GestureDetector(
          onVerticalDragUpdate: (DragUpdateDetails details) {},
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 7, child: makeTitle('주소지 별명')),
                        Expanded(
                          flex: 2,
                          child: Text('기본 배송지', style: TextStyle(fontSize: 15)),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Checkbox(
                              activeColor: Color(0xffffa511),
                              value: isDefault,
                              onChanged: (value) {
                                setState(() {
                                  isDefault = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 5),
                      child: TextField(
                        controller: nC,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffd9d9d9)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffd9d9d9)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: '별명을 입력해주세요',
                          hintStyle: TextStyle(
                            color: Color(0xffd9d9d9),
                          ),
                        ),
                      ),
                    ),
                    makeTextbox('주소', '주소를 입력해주세요', aC),
                    makeTextbox('휴대폰', '휴대폰 번호를 입력해주세요', pC),
                    makeTextbox('배달 상세 메세지', '상세 메세지를 입력해주세요', mC),
                    Container(
                      width: double.infinity,
                      height: 45,
                      margin: const EdgeInsets.only(top: 20),
                      color: Colors.white,
                      child: TextButton(
                        child: Text('저장',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xffffa511)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                        ),
                        onPressed: () {
                          if (vaildCheck(nC.text == "" ||
                              aC.text == "" ||
                              mC.text == "" ||
                              pC.text == "")) {
                            createNewADRS(context);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createNewADRS(BuildContext context) {
    FirebaseFirestore.instance.collection('address').doc(nC.text).set({
      "isDefault": isDefault,
      "name": nC.text,
      "address": aC.text,
      "message": mC.text,
      "phone": pC.text
    }).then((value) => {makeDialog2(context, '주소가 추가되었습니다.')});
  }
}
