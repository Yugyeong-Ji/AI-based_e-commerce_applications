import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; //폰트들은 임의로 설정했음.나중에 변경할 예정

class HomeBanner {
  final String bannerImage;
  final String bannerTitle;
  final String bannerContent;

  HomeBanner(
      {required this.bannerTitle,
      required this.bannerContent,
      required this.bannerImage});
}

List<HomeBanner> homeBannerList = [
  HomeBanner(
    bannerImage: "assets/images/home_banner2.jpg",
    bannerTitle: "회원가입하면",
    bannerContent: "할인 쿠폰이 \n와르르 쏟아진다!",
  ),
  HomeBanner(
    bannerImage: "assets/images/home_banner0.jpg",
    bannerTitle: "자취의 필수템들",
    bannerContent: "발자취에서 함께해요",
  ),
  HomeBanner(
    bannerImage: "assets/images/home_banner1.jpg",
    bannerTitle: "바쁜 자취인들을 위한",
    bannerContent: "간편한 아침 식사",
  ),
  HomeBanner(
    bannerImage: "assets/images/home_banner3.jpg",
    bannerTitle: "발자취는",
    bannerContent: "신선하고 프레쉬한 상품만 취급합니다",
  ),
  HomeBanner(
    bannerImage: "assets/images/home_banner4.jpg",
    bannerTitle: "들어오는 길은 있어도",
    bannerContent: "나가는 길은 없는 발자취",
  ),
  HomeBanner(
    bannerImage: "assets/images/home_banner5.jpg",
    bannerTitle: "내 손 안에 백화점",
    bannerContent: "발자취만 있다면 \n혼자서도 잘 살아요",
  ),
];

class HomeBannerItem extends StatefulWidget {
  @override
  _HomeBannerItemState createState() => _HomeBannerItemState();
}

class _HomeBannerItemState extends State<HomeBannerItem> {
  final List<HomeBanner> list = homeBannerList;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(list[index].bannerImage),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  child: BoxBorderText(
                    title: list[index].bannerTitle,
                    subTitle: list[index].bannerContent,
                  ),
                ),
              ],
            );
          },
          onPageChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
        ),
        Positioned(
            bottom: 16,
            right: 16,
            child: NumberIndicator(
              currentPage: currentPage + 1,
              length: list.length,
            ))
      ],
    );
  }
}

class BoxBorderText extends StatelessWidget {
  const BoxBorderText({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(this.title,
              style:
                  GoogleFonts.nanumGothic(fontSize: 28, color: Colors.white)),
          SizedBox(
            height: 5,
          ),
          Text(
            subTitle,
            style: GoogleFonts.nanumGothic(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class NumberIndicator extends StatelessWidget {
  const NumberIndicator({
    Key? key,
    required this.length,
    required this.currentPage,
    this.width = 48,
    this.height = 25,
  }) : super(key: key);

  final int currentPage;
  final int length;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12)),
      child: Center(
          child: Text(
        "$currentPage / $length",
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
