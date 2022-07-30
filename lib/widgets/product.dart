class Product {
  final String? manufacturer; // 제조사 - 예: 하림
  final String? name; // 제품명
  final String? distributor; // 유통사 - 예: CJ 대한통운
  final String? seller; // 판매자 - 예: 주식회사 푸드킹
  final int? price; // 가격
  final int? discountRate; // 할인율
  final String? image; // 제품 이미지
  final String? detailsImagePath; // 상세이미지 경로
  final List<String>? imagePath; // 제품 이미지 리스트
  final bool? regularDelivery; //정기배송상품
  var uploadDate; // 날짜(신상품순정렬용)
  Product(
      {this.manufacturer,
      this.name,
      this.distributor,
      this.seller,
      this.price,
      this.discountRate,
      this.image,
      this.detailsImagePath,
      this.imagePath,
      this.regularDelivery,
      this.uploadDate}); // 생성자
}

List<Product> productList = [
  // 샘플 데이터
  Product(
    image: "assets/images/베이킹소다.jpg",
    name: "베이킹소다",
    price: 10260,
    discountRate: 10,
  ),
  Product(
    image: "assets/images/액상세제.jpg",
    name: "액츠 퍼펙트 실내건조 일반용 액상세제",
    price: 28530,
    discountRate: 5,
  ),
  Product(
    image: "assets/images/물티슈.jpg",
    name: "코멧 저자극 시그니처 아기 물티슈 엠보싱 캡형, 100매, 10팩",
    price: 23900,
    discountRate: 54,
  ),
  Product(
    image: "assets/images/유산균.jpg",
    name: "종근당건강 락토핏 생유산균 골드, 160g, 3개",
    price: 6200,
    discountRate: 10,
  ),
  Product(
    image: "assets/images/롤화장지.jpg",
    name: "코멧 순백 3겹 라벤더 바닐라 롤 화장지",
    price: 13600,
    discountRate: 17,
  ),
  Product(
    image: "assets/images/닭가슴살.jpg",
    name: "하림 IFF 닭가슴살(냉동), 2kg, 1개",
    price: 16900,
    discountRate: 9,
  ),
  Product(
    image: "assets/images/대추방울토마토.jpg",
    name: "충남세도 GAP 인증 대추방울토마토, 1kg, 1박스",
    price: 11800,
    discountRate: 15,
  ),
  Product(
    image: "assets/images/반숙란.jpg",
    name: "곰곰 반숙란 (냉장), 50g, 20구",
    price: 11600,
    discountRate: 5,
  ),
  Product(
    image: "assets/images/후라이팬.jpg",
    name: "락앤락 쿡플러스 하드앤라이트 프라이팬, 28cm, 1개",
    price: 38500,
    discountRate: 48,
  ),
];
