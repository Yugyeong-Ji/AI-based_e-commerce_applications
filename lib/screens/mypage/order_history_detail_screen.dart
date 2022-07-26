import 'package:flutter/material.dart';

class orderHistoryDetail extends StatelessWidget {
  const orderHistoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '주문 내역 상세',
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 2,
              color: Color(0xffc0c0c0),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "주문 번호",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text(
                            "12224",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: ElevatedButton(
                            child: Text(
                              'mate',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 0,
                              primary: Color(0xffffa511),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Color(0xffc0c0c0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            color: Color(0xfff2f2f2),
                            height: 80,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(bottom: 12),
                                  child: Text(
                                    "[삼다수] 생수 500ml 30개입",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "10,920원",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "2개",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "배송중",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
              height: 10,
              color: Color(0xfff2f2f2),
            ),
            Container(
              height: 2,
              color: Color(0xffc0c0c0),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: ExpansionTile(
                title: Text(
                  '결제 정보',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Text(
                                  '결제 일시',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 240,
                                child: Text(
                                  '2022.02.10 16:32:10',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Text(
                                  '결제 방법',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 240,
                                child: Text(
                                  '신용카드',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Text(
                                  '결제 금액',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 240,
                                child: Text(
                                  '10,920원',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
              height: 10,
              color: Color(0xfff2f2f2),
            ),
            Container(
              height: 2,
              color: Color(0xffc0c0c0),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: ExpansionTile(
                title: Text(
                  '주문 정보',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                  ),
                ],
              ),
            ),
            Container(
              height: 2,
              color: Color(0xffc0c0c0),
            ),
            Container(
              height: 10,
              color: Color(0xfff2f2f2),
            ),
            Container(
              height: 2,
              color: Color(0xffc0c0c0),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: ExpansionTile(
                title: Text(
                  '배송 정보',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                  ),
                ],
              ),
            ),
            Container(
              height: 2,
              color: Color(0xffc0c0c0),
            ),
            Container(
              height: 10,
              color: Color(0xfff2f2f2),
            ),
            Container(
              height: 2,
              color: Color(0xffc0c0c0),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              child: Text(
                "주문 직접 취소는 '입금확인' 상태일 때만 가능합니다.",
                style: TextStyle(
                  color: Color(0xffa6a6a6),
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 15, right: 15),
              width: 500,
              child: ElevatedButton(
                child: Text(
                  '주문 취소',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xffd9d9d9),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.white,
                  side: BorderSide(
                    width: 2,
                    color: Color(0xffd9d9d9),
                  ),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) =>(),
                  //   ),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
