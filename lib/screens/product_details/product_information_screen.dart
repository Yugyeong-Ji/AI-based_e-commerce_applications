import 'package:baljachwi_project/screens/product_details/utils.dart';
import 'package:flutter/material.dart';

import '../../widgets/product.dart';
import '../../widgets/user.dart';

class productInformation extends StatefulWidget {
  final Product product;
  final User user;

  productInformation({Key? key, required this.product, required this.user})
      : super(key: key);

  @override
  _productInformation createState() => _productInformation(product, user);
}

class _productInformation extends State<productInformation> {
  final Product product;
  final User user;

  _productInformation(this.product, this.user);

  List<String> labelList = [];
  List<String> valueList = [];

  @override
  Widget build(BuildContext context) {
    loadData();
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                informHeader(),
                loadInformation(),
                SizedBox(
                  height: 80.0,
                ),
              ],
            ),
          ]),
    );
  }

  void loadData() {
    if(labelList.isNotEmpty) // 데이터 무한생성 방지
      return;
    Map<String, String>? data = product.information;
    if (data != null) {
      for (String label in data.keys) labelList.add(label);
      for (String value in data.values) valueList.add(value);
    }
  }

  Widget informHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '상품정보',
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
        thinDividingLine(context, 10, 15)
      ],
    );
  }

  Widget loadInformation() {
    final children = <Widget>[];
    for (int i = 0; i < labelList.length; i++) {
      children.add(contentsBox(i));
      if (i != labelList.length - 1) // 마지막 게시글 밑에는 생략
        children.add(SizedBox(height: 12));
    }
    return Column(
      children: children,
    );
  }

  Widget contentsBox(int i) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Text(labelList[i],
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Text(valueList[i],
                style: TextStyle(fontSize: 15, color: Colors.black),
                textAlign: TextAlign.left),
          ),
        ],
      ),
    );
  }
}
