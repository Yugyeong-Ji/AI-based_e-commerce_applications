import 'package:baljachwi_project/screens/product_details/product_inquiry_dialog.dart';
import 'package:baljachwi_project/screens/product_details/utils.dart';
import 'package:flutter/material.dart';

import '../../widgets/report.dart';
import '../../widgets/review.dart';
import '../../widgets/user.dart';

List<String> reasonOfReport = [
  '스팸홍보/도배글입니다.',
  '음란물입니다.',
  '불법정보를 포함하고 있습니다.',
  '청소년에게 유해한 내용입니다.',
  '욕설/생명경시/혐오/차별적 표현입니다.'
];

String dialogTitle = '게시글 신고가 접수되었습니다.';
String dialogContent = '유해게시물 근절에 협조해주셔서 감사합니다.\n'
    '신고된 게시물은 확인 후 기준에 맞게 조치될 예정입니다.\n ';

Future<dynamic> showReportDialog(
    BuildContext context, User user, Review review) async {
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      Reason? _reason = Reason.promotional;
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
        content: StatefulBuilder(
          builder: (__, StateSetter setState) {
            return Container(
              height: 320,
              child: Column(
                children: [
                  Text(
                    '신고 사유를 선택해주세요',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  thinDividingLine(context, 25, 10),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(reasonOfReport[0]),
                          leading: Radio<Reason>(
                            activeColor: Color(0xffffa511),
                            value: Reason.promotional, // 광고성
                            groupValue: _reason,
                            onChanged: (Reason? value) {
                              setState(() => _reason = value);
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(reasonOfReport[1]),
                          leading: Radio<Reason>(
                            activeColor: Color(0xffffa511),
                            value: Reason.obscene, // 음란물
                            groupValue: _reason,
                            onChanged: (Reason? value) {
                              setState(() => _reason = value);
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(reasonOfReport[2]),
                          leading: Radio<Reason>(
                            activeColor: Color(0xffffa511),
                            value: Reason.illegal, // 불법정보
                            groupValue: _reason,
                            onChanged: (Reason? value) {
                              setState(() => _reason = value);
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(reasonOfReport[3]),
                          leading: Radio<Reason>(
                            activeColor: Color(0xffffa511),
                            value: Reason.harmfulToTeenager, // 청소년 유해
                            groupValue: _reason,
                            onChanged: (Reason? value) {
                              setState(() => _reason = value);
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(reasonOfReport[4]),
                          leading: Radio<Reason>(
                            activeColor: Color(0xffffa511),
                            value: Reason.hateSpeech, // 욕설, 혐오, 차별적 표현
                            groupValue: _reason,
                            onChanged: (Reason? value) {
                              setState(() => _reason = value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button(context, 0.38, Colors.white, Colors.black87, '취소', 23, () {
                Navigator.pop(context);
              }),
              SizedBox(width: 15),
              button(context, 0.38, null, null, '신고', 23, () {
                Report test = new Report(user, review, (_reason as Reason), DateTime.now());
                print('\n신고대상: '+test.review.title);
                print('\n신고사유: '+test.reason.toString());
                print('\n신고일자: '+test.reportDate.toString());
                Navigator.pop(context);
                showCompleteDialog(context, dialogTitle, dialogContent);
              }),
            ],
          ),
          SizedBox(height: 10),
        ],
      );
    },
  );
}
