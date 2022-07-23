import 'package:flutter/material.dart';

class productInquiryCompletion extends StatefulWidget {
  const productInquiryCompletion({Key? key}) : super(key: key);

  @override
  State<productInquiryCompletion> createState() => _productInquiryCompletion();
}

class _productInquiryCompletion extends State<productInquiryCompletion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text("상품 문의 등록 완료 페이지",
            style: TextStyle(fontSize: 20, color: Colors.black26)));
  }
}
