import 'package:baljachwi_project/screens/product_details/utils.dart';
import 'package:flutter/material.dart';

void showInvalidDialog(BuildContext context, int minLength) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext ctx) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(const Radius.circular(10.0)),
        ),
        titlePadding: const EdgeInsets.only(right: 10, top: 3, bottom: 3),
        contentPadding: const EdgeInsets.all(0),
        backgroundColor: Color(0xffffa511),
        alignment: Alignment.center,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                visualDensity: VisualDensity.compact,
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        content: Container(
          width: (MediaQuery.of(context).size.width),
          height: 100,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(10.0),
              bottomRight: const Radius.circular(10.0),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 32),
              Text(
                '제목과 내용은 최소 ' + minLength.toString() + '자 이상이어야 합니다.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showCompleteDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext ctx) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(const Radius.circular(10.0)),
        ),
        buttonPadding: const EdgeInsets.all(18),
        backgroundColor: Colors.white,
        alignment: Alignment.center,
        title: Text(
          '상품관련 문의가 접수되었습니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          '문의하신 내역은' + "\n" + '마이페이지 > 고객센터 > 문의내역에서 확인하실 수 있습니다.',
          style: TextStyle(color: Color(0x73000000), fontSize: 14),
          textAlign: TextAlign.center,
        ),
        actions: [
          button(context, 0.9, null, null, '확인', 25, (){Navigator.pop(context);}),
        ],
      );
    },
  );
}