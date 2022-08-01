import 'package:baljachwi_project/screens/product_details/review.dart';
import 'package:baljachwi_project/screens/product_details/utils.dart';
import 'package:flutter/material.dart';

import '../../widgets/user.dart';

void showReportDialog(BuildContext context, User user, Review review) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext ctx) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(const Radius.circular(10.0)),
        ),
        titlePadding: const EdgeInsets.only(right: 10, top: 3),
        contentPadding: const EdgeInsets.all(0),
        backgroundColor: Colors.white,
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
                  color: Colors.black,
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
          height: 280,
          child: Column(
            children: [
              Text(
                '신고 사유를 선택해주세요.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              thinDividingLine(context, 25, 10),
              loadToggles(context)
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button(context, 0.38, Colors.white, Colors.black87, '취소', 23, () {
                Navigator.pop(context);
              }),
              SizedBox(width : 15),
              button(context, 0.38, null, null, '신고', 23, () {
                Navigator.pop(context);
              }),
            ],
          ),
          SizedBox(height : 10),
        ],
      );
    },
  );
}

final children = <Widget>[];
List<String> reasonOfReport = ['신고사유1', '신고사유2', '신고사유3', '신고사유5'];

Widget loadToggles(BuildContext context) {
  final children = <Widget>[];
  for (int i = 0; i < reasonOfReport.length; i++) {
    children.add(toggleForm(reasonOfReport[i], reasonOfReport, null));
  }
  return Padding(
    padding: EdgeInsets.only(left: 10),
    child: Column(
      children: children,
    ),
  );
}

Widget toggleForm(
    String value, List<String> groupValue, Function()? onChanged) {
  return ListTile(
    title: Text(
      value,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    ),
    leading: Radio<dynamic>(
      value: value,
      groupValue: groupValue,
      onChanged: (value) {
        onChanged!();
      },
    ),
  );
}
