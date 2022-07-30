import 'package:baljachwi_project/screens/product_details/product_inquiry.dart';
import 'package:baljachwi_project/screens/product_details/utils.dart';
import 'package:flutter/material.dart';

class productInquiryDetail extends StatefulWidget {
  final ProductInquiry data;

  productInquiryDetail({Key? key, required this.data}) : super(key: key);

  @override
  _productInquiryDetail createState() => _productInquiryDetail(data);
}

class _productInquiryDetail extends State<productInquiryDetail> {
  ProductInquiry data; // 게시글 데이터
  _productInquiryDetail(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '상품 문의',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          color: Colors.black,
          iconSize: 50,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: 25),
          Container(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(25),
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  header(),
                  bigLineSpacing(),
                  title(),
                  smallLineSpacing(),
                  inquiryContents(),
                  thinDividingLine(context, 19.0, 14.0),
                  InquiryAnswer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "[" + data.product.manufacturer + "] " + data.product.name,
        style: TextStyle(
          fontSize: 17,
          color: Colors.black45,
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Q: " + data.title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget inquiryContents() {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.contents,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          bigLineSpacing(),
          Text(
            data.date,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black45,
            ),
          )
        ],
      ),
    );
  }

  Widget InquiryAnswer() {
    String answer = (data.isResolved ? data.answer : "아직 판매자의 답변을 기다리고 있어요");
    int answerColor = (data.isResolved ? 0xff000000 : 0x73000000);
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (data.isResolved)
                Text(
                  'A: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(answerColor),
                  ),
                ),
              Text(
                answer,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(answerColor),
                ),
              ),
            ],
          ),
          if (data.isResolved)
            Text(
              data.product.seller,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black45,
              ),
            ),
        ],
      ),
    );
  }
}

Widget bigLineSpacing() {
  return SizedBox(height: 8);
}

Widget smallLineSpacing() {
  return SizedBox(height: 3);
}
