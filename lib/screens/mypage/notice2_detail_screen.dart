import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';

class noticeDetail extends StatefulWidget {
  final String _title;
  final String _date;
  final String _content;
  const noticeDetail(this._title, this._date, this._content);

  @override
  State<noticeDetail> createState() => _noticeDetailState();
}

class _noticeDetailState extends State<noticeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: makeAppBar(context, '공지 사항'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  widget._title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                alignment: Alignment.centerRight,
                child: Text(
                  widget._date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xffa6a6a6),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget._content,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
