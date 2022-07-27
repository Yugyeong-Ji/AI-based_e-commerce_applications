import 'package:baljachwi_project/screens/product_details/product.dart';
import '../../widgets/dao.dart';

class Order {
  User user;
  Product2 product;
  Map<String, List> option;
  int quantity;
  Order( this.user, this.product, this.option, this.quantity);
}