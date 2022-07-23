import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';

class cartButton extends StatefulWidget {
  cartButton({Key? key}) : super(key: key);
  @override
  _cartButton createState() => _cartButton();
}

class _cartButton extends State<cartButton> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AlertController.onTabListener(
            (Map<String, dynamic>? payload, TypeAlert type) {
          print("$payload - $type");
        });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      height: 90,
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
      minWidth: (MediaQuery.of(context).size.width) - 35,
      color: Color(0xffffa511),
      onPressed: success,
      child: Text(
        '구매하기',
        style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  void success() {
    Map<String, dynamic> payload = new Map<String, dynamic>();
    payload["data"] = "content";
    AlertController.show(
        "장바구니 추가", "장바구니에 상품이 담겼습니다.", TypeAlert.success, payload);
  }
}