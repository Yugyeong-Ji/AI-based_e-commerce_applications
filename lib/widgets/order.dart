import 'user.dart';
import 'product.dart';

class Order {
  User user;
  Product product;
  Map<String, List> option;
  int quantity;
  Order( this.user, this.product, this.option, this.quantity);
}