import 'package:flutter/material.dart';
import '../../widgets/product.dart';
import '../../widgets/product_item.dart';

class RecommendReview extends StatelessWidget {
  final Product item;

  const RecommendReview({
    Key? key,
    required this.item,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 1
    return Card(
      elevation: 1,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 2
          Expanded(
            child: ProductItem(
              product: item,
              lineChange: true,
              textContainerHeight: 50,
            ),
          ),
          // 3
          Container(
            height: 80,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0xFFF5F5F5)),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  "집에 떨어져서 갑자기 발자취에서 구매하게 된건데 너무 만족해요."
                  "다들 베이킹 소다는 이걸로 쓰세요",
                  textAlign: TextAlign.center,
                  // 4
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
