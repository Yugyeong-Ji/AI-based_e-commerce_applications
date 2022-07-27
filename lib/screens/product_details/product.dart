import 'dart:collection';

class Product2 {
  final String manufacturer; // 제조사 - 예: 하림
  final String name;        // 제품명
  final String distributor; // 유통사 - 예: CJ 대한통운
  final String seller;      // 판매자 - 예: 주식회사 푸드킹
  final int price;          // 가격
  final int discount;        // 할인율
  Map<String, List> option; // 상품 옵션 - 예: <색상, [블랙, 차콜, 화이트]>
  final String detailsImagePath;  // 상세이미지 경로
  final List<String> imagePath; // 제품 이미지 리스트
  Product2(this.manufacturer, this.name, this.distributor, this.seller,
      this.price, this.discount, this.option, this.detailsImagePath, this.imagePath); // 생성자
}
