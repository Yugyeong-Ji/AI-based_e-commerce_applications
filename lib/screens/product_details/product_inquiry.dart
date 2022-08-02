import '../../widgets/user.dart';
import '../../widgets/product.dart';

class ProductInquiry {
  Product product;
  String title;
  String contents;
  String answer = '';
  User user;
  String date;
  bool isResolved = false; // flase: 답변 대기, true: 답변 완료
  bool isPrivate;
  ProductInquiry(this.product, this.title, this.contents, this.user, this.date, this.isResolved, this.isPrivate);
}