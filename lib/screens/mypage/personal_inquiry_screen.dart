import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/frequently_asked_q&a_screen.dart';
import 'package:baljachwi_project/screens/mypage/write_personal_inquiry_screen.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';

class personalInquiry extends StatelessWidget {
  const personalInquiry({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(context, '1:1 문의'),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 2,
            color: Color(0xffc0c0c0),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            alignment: Alignment.topLeft,
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 18),
                  alignment: Alignment.topLeft,
                  child: Text(
                    '상담시간',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(18, 8, 0, 15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '평일(월-금) 10:00 ~ 17:00',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffa6a6a6),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: ElevatedButton(
                          child: Text(
                            '자주하는 질문 보기',
                            style: TextStyle(
                              color: Color(0xffffa511),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(color: Color(0xffffa511)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0,
                            primary: Colors.white,
                            fixedSize: Size(80, 50),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => frequentQuestion(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: ElevatedButton(
                          child: Text(
                            '문의하기',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0,
                            primary: Color(0xffffa511),
                            fixedSize: Size(80, 50),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    writePersonalInquiry('userID'),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Color(0xffd9d9d9),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.white,
                child: Text(
                  '문의 내역이 없습니다',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
