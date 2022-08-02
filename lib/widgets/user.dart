import '../../widgets/product.dart';

class User{
  var email,pwd,name,phone,addr,grade,coupon;
  List<Product> wishList = [];
  User(this.email,this.pwd,this.name,this.phone,this.addr,this.grade,this.coupon);
}
