import 'package:baljachwi_project/widgets/user.dart';
import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/membership_rating_screen.dart';
import 'package:baljachwi_project/screens/mypage/coupon_screen.dart';
import 'package:baljachwi_project/screens/mypage/order_history_screen.dart';
import 'package:baljachwi_project/screens/mypage/address_management_screen.dart';
import 'package:baljachwi_project/screens/mypage/review_screen.dart';
import 'package:baljachwi_project/screens/mypage/gift_history_screen.dart';
import 'package:baljachwi_project/screens/mypage/edit_member_info_screen.dart';
import 'package:baljachwi_project/screens/mypage/invite_friend_screen.dart';
import 'package:baljachwi_project/screens/mypage/personal_inquiry_screen.dart';
import 'package:baljachwi_project/screens/mypage/product_inquiry_screen.dart';
import 'package:baljachwi_project/screens/mypage/notice_screen.dart';
import 'package:baljachwi_project/screens/mypage/introduce_screen.dart';
import 'package:baljachwi_project/screens/mypage/information_use_screen.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';
import 'package:baljachwi_project/widgets/user.dart';

List<String> grades = ['BRONZE', 'SILVER', 'GOLD', 'MASTER'];

class mypage extends StatelessWidget {
  final User myInfo;
  const mypage(this.myInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Image.asset('assets/logo/logo.png'), // 나중에 장바구니 로고로 변경
            onPressed: null,
          )
        ],
        backgroundColor: const Color(0xffffa511),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: const Color(0xffffa511),
              height: 140,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              child: Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {}, // 사진 변경 기능
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.all(5),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset('assets/logo/logo.png'),
                    ),
                  ),
                  Text(
                    myInfo.name + '님',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.all(5),
                              child: const Text(
                                '회원 등급',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffa6a6a6),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.all(5),
                              child: Text(
                                grades[myInfo.grade],
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffa511),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(left: 40, right: 40),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0,
                            primary: const Color(0xfff2f2f2),
                            fixedSize: const Size(100, 45),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    membershipRating(grades[myInfo.grade]),
                              ),
                            );
                          },
                          child: const Text(
                            '할인혜택 보기',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffa6a6a6),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Color(0xffd9d9d9), width: 1),
                            right:
                                BorderSide(color: Color(0xffd9d9d9), width: 1),
                            bottom:
                                BorderSide(color: Color(0xffd9d9d9), width: 1),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyPage_Coupon(myInfo),
                              ),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.all(5),
                                child: const Text(
                                  '사용 가능 쿠폰',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xffa6a6a6),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.all(5),
                                child: Text(
                                  myInfo.coupon.length.toString(),
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffffa511),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Color(0xffd9d9d9),
                              width: 1,
                            ),
                            bottom: BorderSide(
                              color: Color(0xffd9d9d9),
                              width: 1,
                            ),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => nonmemberOrder(),
                            //   ),
                            // );
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.all(5),
                                child: const Text(
                                  '함께 배송 mate',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xffa6a6a6),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.all(5),
                                child: const Text(
                                  '3',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffffa511),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(height: 30),
            Container(
              margin: const EdgeInsets.all(25),
              child: Column(
                children: <Widget>[
                  makeCol(0, '나의 쇼핑'),
                  makeList(context, orderHistory(), '주문 내역'),
                  makeList(context, addressManage(), '배송지 관리'),
                  makeList(context, review(), '리뷰'),
                  makeList(context, giftHistory(), '선물 내역'),
                  makeCol(30, '계정 설정'),
                  makeList(context, EditMemberInfo(myInfo), '회원 정보 수정'),
                  makeList(context, inviteFriend(), '친구 초대'),
                  makeList(context, EditMemberInfo(myInfo), '로그아웃'),
                  makeCol(30, '고객 센터'),
                  makeList(context, personalInquiry(), '1:1 문의'),
                  makeList(context, productInquiry(), '상품 문의'),
                  makeCol(30, '발자취'),
                  makeList(context, MyPage_Notice(), '공지사항'),
                  makeList(context, informationUse(), '이용 안내'),
                  makeList(context, introduce(), '회사 소개')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
