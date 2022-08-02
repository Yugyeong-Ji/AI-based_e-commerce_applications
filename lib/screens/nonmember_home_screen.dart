import 'package:baljachwi_project/screens/mypage/ui.dart';
import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/nonmember_order_screen.dart';

class nonmemberHome extends StatelessWidget {
  const nonmemberHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          color: Colors.black,
          iconSize: 30,
          onPressed: () {}, // 페이지 연결
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/logo/logo.png'), // 나중에 장바구니 로고로 변경
            onPressed: null,
          )
        ],
        backgroundColor: Color(0xffffa511),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 40, top: 40),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '회원이시면\n로그인 해주세요!',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  width: 400,
                  height: 50,
                  margin: const EdgeInsets.all(30),
                  child: TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: BorderSide(
                          color: Colors.black,
                          width: 2,
                        )),
                    child: Text(
                      '로그인 / 회원가입',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            color: Color(0xffffa511),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                makeCol(0, '나의 쇼핑'),
                makeList(context, nonmemberOrder(), '비회원 주문 내역'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
