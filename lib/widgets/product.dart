class Product {
  final String? image;
  final String? title;
  final int? price;
  final int? discountRate;

  Product({this.image, this.title, this.price, this.discountRate});
}

List<Product> productList = [
  Product(
    image: "assets/images/베이킹소다.jpg",
    title: "",
    price: 10260,
    discountRate: 10,
  ),
  Product(
    image: "assets/images/액상세제.jpg",
    title: "액츠 퍼펙트 실내건조 일반용 액상세제",
    price: 28530,
    discountRate: 5,
  ),
  Product(
    image: "assets/images/물티슈.jpg",
    title: "코멧 저자극 시그니처 아기 물티슈 엠보싱 캡형, 100매, 10팩",
    price: 23900,
    discountRate: 54,
  ),
  Product(
    image: "assets/images/유산균.jpg",
    title: "종근당건강 락토핏 생유산균 골드, 160g, 3개",
    price: 6200,
    discountRate: 10,
  ),
  Product(
    image: "assets/images/롤화장지.jpg",
    title: "코멧 순백 3겹 라벤더 바닐라 롤 화장지",
    price: 13600,
    discountRate: 17,
  ),
  Product(
    image: "assets/images/닭가슴살.jpg",
    title: "하림 IFF 닭가슴살(냉동), 2kg, 1개",
    price: 16900,
    discountRate: 9,
  ),
  Product(
    image: "assets/images/대추방울토마토.jpg",
    title: "충남세도 GAP 인증 대추방울토마토, 1kg, 1박스",
    price: 11800,
    discountRate: 15,
  ),
  Product(
    image: "assets/images/반숙란.jpg",
    title: "곰곰 반숙란 (냉장), 50g, 20구",
    price: 11600,
    discountRate: 5,
  ),
  Product(
    image: "assets/images/후라이팬.jpg",
    title: "락앤락 쿡플러스 하드앤라이트 프라이팬, 28cm, 1개",
    price: 38500,
    discountRate: 48,
  ),
];
