import 'package:baljachwi_project/widgets/review.dart';
import 'package:baljachwi_project/widgets/user.dart';
// 리뷰 신고 클래스
class Report{
  User user; // 현재 로그인된 유저
  Review review; // 신고할 리뷰
  Reason reason; // 신고 사유
  DateTime reportDate; // 신고 일자

  Report(this.user, this.review, this.reason, this.reportDate);
}

enum Reason{ //신고 사유
  promotional, // 광고성
  obscene,  // 음란물
  illegal,  // 불법정보
  harmfulToTeenager, // 청소년 유해
  hateSpeech // 욕설, 혐오, 차별적 표현
}