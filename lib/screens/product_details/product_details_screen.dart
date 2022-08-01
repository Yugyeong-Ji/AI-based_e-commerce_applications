import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/product_details/product_description_screen.dart';
import 'package:baljachwi_project/screens/product_details/product_information_screen.dart';
import 'package:baljachwi_project/screens/product_details/product_inquiry_screen.dart';
import 'package:baljachwi_project/screens/product_details/product_review_screen.dart';
import 'package:baljachwi_project/screens/product_details/bottom_menu_screen.dart';
import '../../widgets/user.dart';
import '../../widgets/product.dart';

class productDetails extends StatefulWidget {
  final Product product;
  final User user;
  productDetails({Key? key, required this.product, required this.user}) : super(key: key);
  @override
  _productDetails createState() => _productDetails(product, user);
}

List<Widget> list = [
  // 상단 탭바 이름
  Text("상품설명", style: TextStyle(fontSize: 20)),
  Text("상세정보", style: TextStyle(fontSize: 20)),
  Text("리뷰", style: TextStyle(fontSize: 20)),
  Text("문의", style: TextStyle(fontSize: 20))
];

class _productDetails extends State<productDetails> with TickerProviderStateMixin {
  final Product product;
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
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Color(0xffffa511),
          unselectedLabelColor: Colors.black26,
          labelColor: Color(0xffffa511),
          labelPadding: EdgeInsets.only(top: 16, bottom: 10),
          indicatorWeight: 6.0,
          controller: _controller,
          tabs: list,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Center(child: productDescription(product: this.product)),
          Center(child: productInformation()),
          Center(child: productReview(product: this.product, user: this.user)),
          Center(child: productInquiry(product: this.product, user: this.user))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            bottomMenu(user: this.user, product: this.product),
          ],
        ),
      ),
    );
  }
}