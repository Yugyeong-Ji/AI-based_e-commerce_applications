import 'package:baljachwi_project/screens/product_details/product.dart';

class ProductInquiry {
  Product2 product;
  String title;
  String contents;
  String answer = '';
  String userName;
  String date;
  bool isResolved = false; // flase: 답변 대기, true: 답변 완료
  bool isPrivate;
  ProductInquiry(this.product, this.title, this.contents, this.userName, this.date, this.isResolved, this.isPrivate);
}