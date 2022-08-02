import 'product.dart';
import 'user.dart';

class Review {
  final Product product;
  final User user;
  final String title;
  final String contents;
  final String date;
  final List<String> image = [];
  int like = 0;
  int hate = 0;
  double star;

  Review(
      this.product,
      this.user,
      this.title,
      this.contents,
      this.date,
      this.star);
}
