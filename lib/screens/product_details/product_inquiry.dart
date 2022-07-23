class ProductInquiry {
  String title;
  String contents;
  String userName;
  String date;
  bool isResolved = false; // flase: 답변 대기, true: 답변 완료

  ProductInquiry(this.title, this.contents, this.userName, this.date, this.isResolved);
}