import 'dart:collection';

import 'package:baljachwi_project/screens/Mate/mate_home_screen.dart';
import 'package:baljachwi_project/screens/catalog_main_screen.dart'
    as prefix; // * Product 자료형 충돌로 인해 임시조치
import 'package:baljachwi_project/screens/after_login.dart';
import 'package:baljachwi_project/widgets/product.dart';
import 'package:baljachwi_project/widgets/user.dart';
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
import 'package:baljachwi_project/screens/Mate/mate_team_screen.dart';

// Navbar랑 Footbar 테스트 스크린 적용하기
import 'package:baljachwi_project/screens/bar_test_screen.dart';
import 'package:baljachwi_project/screens/mypage/mypage_screen.dart';
import 'package:baljachwi_project/screens/nonmember_home_screen.dart';
import 'package:baljachwi_project/screens/Login/login_main_screen.dart';

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

      // home: productDetails(product: testProduct, user: testUser),
      // home: catalogMain(),
      // home: HomeScreen(),
      // home: Home(),
      // catalogList(),
      // home: HomeScreen(),
      // home: mateHomeScreen(),
      // home: barTestScreen(),
      // home: nonmemberHome(),
      // home: BaseWidget(),
      //home: mateTeamScreen(),
      //home: LoginAppScreen(),
      home: LoginMainScreen(),
    );
  }
}

// *제품 상세페이지 테스트를 위한 임시 상품객체 --> 추후 삭제 *
Map<String, List> map = {
  '맛': ['오리지널', '핫양념치킨', '허니소이']
};
Product testProduct = new Product(
    manufacturer: "하림",
    name: "하림 닭가슴살 110g x 총 20팩 무료배송",
    distributor: "CJ 대한통운",
    seller: "주식회사 푸드킹",
    price: 40000,
    discountRate: 30,
    thumbnail: "images/productDetailsExample.jpg",
    image: [
      "assets/images/chicken1.jpg",
      "assets/images/chicken2.jpg",
      "assets/images/chicken3.jpg"
    ]);

// *제품 상세페이지 테스트를 위한 임시 유저객체 --> 추후 삭제 *
User testUser =
    new User('email', 'pwd', 'Testname', 'phone', 'addr', 'grade', 'coupon');
