import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';
import 'package:baljachwi_project/screens/mypage/class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class editAddress extends StatefulWidget {
  var isDefault;
  var name;
  var address;
  var message;
  var phone;
  editAddress(
      this.isDefault, this.name, this.address, this.message, this.phone);
  @override
  State<editAddress> createState() => _editAddressState();
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class _editAddressState extends State<editAddress> {
  final TextEditingController nC = TextEditingController();
  final TextEditingController aC = TextEditingController();
  final TextEditingController mC = TextEditingController();
  final TextEditingController pC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: makeAppBar(context, '배송지 수정'),
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
                              value: widget.isDefault,
                              onChanged: (value) {
                                setState(() {
                                  widget.isDefault = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 5),
                      padding: const EdgeInsets.only(left: 12),
                      alignment: Alignment.centerLeft,
                      child: Text(widget.name, style: TextStyle(fontSize: 16)),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    makeTextbox('주소', widget.address, aC),
                    makeTextbox('휴대폰', widget.phone, pC),
                    makeTextbox('배달 상세 메세지', widget.message, mC),
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
                          editdata(context);
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

  void editdata(BuildContext content) {
    FirebaseFirestore.instance.collection("address").doc(widget.name).update({
      "isDefault": widget.isDefault,
      if (aC.text != '') "address": aC.text,
      if (mC.text != '') "message": mC.text,
      if (pC.text != '') "phone": pC.text
    }).then((value) => {makeDialog2(context, '주소가 수정되었습니다.')});
  }
}
