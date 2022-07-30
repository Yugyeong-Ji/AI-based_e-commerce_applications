import 'package:baljachwi_project/screens/product_details/product.dart';
import '../../widgets/dao.dart';

class Review {
  Product2 product;
  User user;
  String title;
  String contents;
  String date;
  List<String> image = [];
  int like = 0;
  int hate = 0;
  double star;

  Review(this.product, this.user, this.title, this.contents, this.date, this.star);
}