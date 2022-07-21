import 'package:flutter/material.dart';

class introduce extends StatelessWidget {
  const introduce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '회사 소개',
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
        backgroundColor: Color(0xffffa511),
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Color(0xffffa511),
            height: 280,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 150,
                    height: 150,
                    child: Image.asset('assets/logo/logo.png'), // 이미지 변경
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '발자취',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '이런저런 의미입니다',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 2,
            color: Color(0xffc0c0c0),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    '설립 취지',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffffa511),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  height: 1,
                  color: Color(0xffd9d9d9),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    '이런저런 의미입니다',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    '목표',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffffa511),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  height: 1,
                  color: Color(0xffd9d9d9),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    '이런저런 의미입니다',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


/*
1. 로고 변경
2. 내용 추가
*/