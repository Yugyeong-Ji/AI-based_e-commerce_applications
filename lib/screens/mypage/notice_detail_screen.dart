import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:baljachwi_project/screens/mypage/notice_detail_screen.dart';

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
      appBar: AppBar(
        title: const Text(
          '공지사항',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          color: Colors.black,
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 2, color: const Color(0xffc0c0c0)),
            Container(
              constraints: BoxConstraints(minHeight: 600),
              color: Colors.white,
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
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 1, color: const Color(0xffd9d9d9))
          ],
        ),
      ),
    );
  }
}
