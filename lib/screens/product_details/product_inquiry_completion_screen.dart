import 'package:baljachwi_project/screens/product_details/product_inquiry.dart';
import 'package:flutter/material.dart';

class productInquiryCompletion extends StatefulWidget {
  final ProductInquiry data;
  const productInquiryCompletion({Key? key, required this.data}) : super(key: key);

  @override
  State<productInquiryCompletion> createState() => _productInquiryCompletion(data);
}

class _productInquiryCompletion extends State<productInquiryCompletion> {
  ProductInquiry data; // 게시글 데이터
  _productInquiryCompletion(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text("상품 문의 등록 완료 페이지",
            style: TextStyle(fontSize: 20, color: Colors.black26)));
  }
}
