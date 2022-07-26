import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/product_details/product_description_screen.dart';
import 'package:baljachwi_project/screens/product_details/product_details_screen.dart';
import 'package:baljachwi_project/screens/product_details/product_information_screen.dart';
import 'package:baljachwi_project/screens/product_details/product_inquiry_screen.dart';
import 'package:baljachwi_project/screens/product_details/product_review_screen.dart';
import 'package:baljachwi_project/screens/product_details/product.dart';
import 'package:baljachwi_project/screens/product_details/cart_Button.dart';
import 'package:baljachwi_project/screens/product_details/add_to_wishlist.dart';

import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';

import '../../widgets/dao.dart';

class productDetails extends StatefulWidget {
  final Product2 product;
  final User user;
  productDetails({Key? key, required this.product, required this.user}) : super(key: key);
  @override
  _productDetails createState() => _productDetails(product, user);
}

List<Widget> list = [
  // 상단 탭바 이름
  Tab(child: Text("상품설명", style: TextStyle(fontSize: 20, color: Colors.black26))),
  Tab(child: Text("상세정보", style: TextStyle(fontSize: 20, color: Colors.black26))),
  Tab(child: Text("리뷰", style: TextStyle(fontSize: 20, color: Colors.black26))),
  Tab(child: Text("문의", style: TextStyle(fontSize: 20, color: Colors.black26)))
];

class _productDetails extends State<productDetails> with TickerProviderStateMixin {
  final Product2 product;
  final User user;
  _productDetails(this.product, this.user);

  int _selectedIndex = 0;
  late TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    TabController controller = TabController(length: list.length, vsync: this);

    controller.addListener(() {
      setState(() {
        _selectedIndex = controller.index;
      });
      print("Selected Index: " + controller.index.toString());
    });
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 오버플로우 방지
      appBar: AppBar(
        /*title: Text(
          '제품 상세',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
        ),*/
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          // 뒤로가기 버튼
          icon: Icon(Icons.navigate_before),
          color: Colors.black,
          iconSize: 50,
          onPressed: () {
            Navigator.pop(context);
          }, // 페이지 연결
        ),
        actions: <Widget>[
          IconButton(
            // 위치 설정 버튼
            icon: Icon(Icons.room),
            iconSize: 35,
            color: Color(0xffffa511),
            onPressed: () {
              // 아이콘 버튼 실행
              print('Button is clicked');
            },
          ),
          IconButton(
            // 장바구니 버튼
            icon: Icon(Icons.shopping_cart),
            iconSize: 35,
            color: Color(0xffffa511),
            onPressed: () {
              // 아이콘 버튼 실행
              print('Shopping cart button is clicked');
            },
          ),
        ],
        bottom: TabBar(
          onTap: (index) {
            // Should not used it as it only called when tab options are clicked,
            // not when user swapped
          },
          controller: _controller,
          tabs: list,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Center(child: productDescription(product: this.product)),
          Center(child: productInformation()),
          Center(child: productReview()),
          Center(child: productInquiry(product: this.product, user: this.user))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            bottomMenu(),
          ],
        ),
      ),
    );
  }
}
// bottomMenu : 위시리스트 담기, 장바구니 담기
Widget bottomMenu() {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: cartButton()
  );
}
