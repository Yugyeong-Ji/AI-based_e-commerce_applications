import 'package:flutter/material.dart';

class membershipRating extends StatelessWidget {
  const membershipRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '회원 등급',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
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
        scrollDirection: Axis.vertical,
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 2,
                color: Color(0xffc0c0c0),
              ),
              Container(
                height: 250,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        'SILVER',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffffa511),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        '전월 실적 20만원 이상',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xffa6a6a6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        '혜택',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff7f7f7f),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xfff2f2f2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8, bottom: 15),
                height: 1,
                color: Color(0xffd9d9d9),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        '•  총 혜택 금액은 12개월간 동일 등급을 유지할 경우 받게 되는 적립.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffa6a6a6),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        '•  등급별 할인 혜택은 변경될 수 있습니다',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffa6a6a6),
                        ),
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
}

/*
1. 이미지 추가
2. 정보 연동 - 등급 이미지, 조건, 혜택
*/