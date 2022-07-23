import 'package:baljachwi_project/screens/Mate/mate_home_screen.dart';
import 'package:baljachwi_project/screens/catalog_list_screen.dart';
import 'package:baljachwi_project/screens/after_login.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
// HOME
import 'package:baljachwi_project/screens/Home/home_screen.dart';
// firebase core 플러그인 및 생성한 구서파일 가져오기
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//
import 'package:baljachwi_project/screens/product_details/product_details_screen.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';

import 'package:baljachwi_project/screens/Mate/mate_home_screen.dart';

// Navbar랑 Footbar 테스트 스크린 적용하기
import 'package:baljachwi_project/screens/bar_test_screen.dart';
import 'package:baljachwi_project/screens/mypage/mypage_screen.dart';

void main() async {
  // => firebase 사용하기 위한 필수 코드
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,

      // 제품 상세페이지 드롭다운 메뉴를 위한 builer *지우지 마시오*
      builder: (context, child) => Stack(
        children: [child!, DropdownAlert()],
      ),

      home: catalogList(),
      //home: HomeScreen(),
      //home: mateHomeScreen(),
      //home: barTestScreen(),
      //home: mypage(),
    );
  }
}