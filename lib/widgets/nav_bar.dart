import 'package:flutter/material.dart';
import 'package:baljachwi_project/widgets/refrigerator.dart';
class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return AppBar(
      backgroundColor: const Color(0xffffa511),
      toolbarHeight: 70,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      leading: Image.asset("assets/logo/logo.png"),
      title: Text('발자취',style: TextStyle(fontSize: 16)),
      actions: [
        IconButton(
          padding: EdgeInsets.only(right: 20),
          icon: Icon(Icons.ad_units_outlined, color: Colors.white),
          onPressed: () {
            print('go 냉장고');
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Refrigerator()));
          } // 나중에 연결할 때 사용
        ),
        IconButton(
          padding: EdgeInsets.only(right: 20),
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: () {}, // 나중에 연결할 때 사용
        ),
        IconButton(
          padding: EdgeInsets.only(right: 20),
          icon: Icon(Icons.pin_drop, color: Colors.white),
          onPressed: () {}, // 나중에 연결할 때 사용
        ),
        IconButton(
          padding: EdgeInsets.only(right: 20),
          icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
          onPressed: () {}, // 나중에 연결할 때 사용
        ),
      ],
    );
  }
}