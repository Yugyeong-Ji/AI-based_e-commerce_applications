import 'package:flutter/material.dart';

class frequentQuestions extends StatelessWidget {
  const frequentQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '자주하는 질문',
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 2,
              color: Color(0xffd9d9d9),
            ),
            TabBar(
              indicatorColor: Colors.transparent,
              labelColor: Color(0xffffa511),
              labelStyle: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: Color(0xffffa511),
              ),
              unselectedLabelColor: Color(0xffa6a6a6),
              unselectedLabelStyle: TextStyle(
                decoration: TextDecoration.none,
              ),
              tabs: [
                Container(
                  height: 65,
                  alignment: Alignment.center,
                  child: Text(
                    'Best',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  height: 65,
                  alignment: Alignment.center,
                  child: Text(
                    '주문결제',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  height: 65,
                  alignment: Alignment.center,
                  child: Text(
                    '배송',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  height: 65,
                  alignment: Alignment.center,
                  child: Text(
                    '취소/환불',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 2,
              color: Color(0xffd9d9d9),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.topLeft,
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      '주문 결제',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffa6a6a6)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: ExpansionTile(
                                      title: Text(
                                        '주문을 확인하고 싶어요.',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 20, 17),
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            children: [
                                              Text(
                                                'MY PAGE > 나의 쇼핑정보 > 주문 내역 을 선택하시면 확인 가능합니다.',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffffa511),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Color(0xffd9d9d9),
                        ),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.topLeft,
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      '배송',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffa6a6a6)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: ExpansionTile(
                                      title: Text(
                                        '배송기간을 얼마나 걸리나요?',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 20, 17),
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            children: [
                                              Text(
                                                '그러게요.. 나중에 내용 추가해드릴게용',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffffa511),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Color(0xffd9d9d9),
                        ),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.topLeft,
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      '취소/환불',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffa6a6a6)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: ExpansionTile(
                                      title: Text(
                                        '주문 최소를 하고 싶어요.',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 20, 17),
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            children: [
                                              Text(
                                                '나중에 내용 추가~~',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffffa511),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Color(0xffd9d9d9),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.topLeft,
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              title: Text(
                                '주문을 확인하고 싶어요.',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 17),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'MY PAGE > 나의 쇼핑정보 > 주문 내역 을 선택하시면 확인 가능합니다.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffffa511),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Color(0xffd9d9d9),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.topLeft,
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              title: Text(
                                '배송기간은 얼마나 걸리나요?',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 17),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '그러게요.. 나중에 내용 추가해드릴게용',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffffa511),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Color(0xffd9d9d9),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.topLeft,
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              title: Text(
                                '주문 취소를 하고 싶어요.',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 17),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '나중에 내용 추가~~',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffffa511),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Color(0xffd9d9d9),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
1. 'Best' Tab으로 불러오는 기능
2. ExpansionTile arrow 지우기
3. ExpansionTile 색상 바꾸기
*/
