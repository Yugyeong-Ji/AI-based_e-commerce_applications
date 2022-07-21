import 'package:flutter/material.dart';

class giftHistory extends StatelessWidget {
  const giftHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '선물 내역',
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
            color: Color(0xffc0c0c0),
          ),
          // TabBar(
          //   indicatorColor: Colors.transparent,
          //   labelColor: Color(0xffffa511),
          //   unselectedLabelColor: Color(0xffa6a6a6),
          //   unselectedLabelStyle: TextStyle(
          //     decoration: TextDecoration.none,
          //   ),
          //   tabs: [
          //     Container(
          //       height: 65,
          //       alignment: Alignment.center,
          //       child: Text(
          //         'MY 선물함(1)',
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 17,
          //         ),
          //       ),
          //     ),
          //     Container(
          //       height: 65,
          //       alignment: Alignment.center,
          //       child: Text(
          //         '받은 선물(24)',
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 17,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // Container(
          //   height: 2,
          //   color: Color(0xffd9d9d9),
          // ),
          // TabBarView(
          //   children: [
          //     Container(
          //       child: Column(
          //         children: [
          //           Container(
          //             margin: const EdgeInsets.only(top: 10),
          //             height: 1,
          //             color: Color(0xffd9d9d9),
          //           ),
          //           Container(
          //             color: Colors.white,
          //             padding: const EdgeInsets.all(10),
          //             alignment: Alignment.topLeft,
          //             child: Text('1'),
          //           ),
          //           Container(
          //             height: 1,
          //             color: Color(0xffd9d9d9),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Container(
          //       child: Column(
          //         children: [
          //           Container(
          //             margin: const EdgeInsets.only(top: 10),
          //             height: 1,
          //             color: Color(0xffd9d9d9),
          //           ),
          //           Container(
          //             color: Colors.white,
          //             padding: const EdgeInsets.all(10),
          //             alignment: Alignment.topLeft,
          //             child: Text('2'),
          //           ),
          //           Container(
          //             height: 1,
          //             color: Color(0xffd9d9d9),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
      // ),
    );
  }
}

/*
화면 구현 진행 중
1. viewport hasBoundedHeight exceptions
*/