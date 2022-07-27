import '../screens/product_details/product.dart';

class User{
  var email,pwd,name,phone,addr,grade,coupon;
  List<Product2> wishList = [];
  User(this.email,this.pwd,this.name,this.phone,this.addr,this.grade,this.coupon);
}
