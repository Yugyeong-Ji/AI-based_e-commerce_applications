import 'dart:async';

import 'package:baljachwi_project/screens/product_details/product.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';
import '../../widgets/dao.dart';

class bottomMenu extends StatefulWidget {
  final User user;
  final Product2 product;

  bottomMenu({Key? key, required this.user, required this.product})
      : super(key: key);

  @override
  _bottomMenu createState() => _bottomMenu(this.user, this.product);
}

class _bottomMenu extends State<bottomMenu> {
  final User user;
  final Product2 product;

  _bottomMenu(this.user, this.product);

  final List<String> items = [
    '옵션1',
    '옵션2',
    '옵션3',
  ];
  String selectedValue = '옵션1';

  // bottomMenu : 위시리스트 담기, 장바구니 담기
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          favoriteButton(),
          SizedBox(width: 15),
          buyButton(),
        ],
      ),
    );
  }

  bool isFavorite = false;
  double buttonSize = 47.0;

  Widget favoriteButton() {
    return Container(
      height: 65,
      child: LikeButton(
        size: buttonSize,
        bubblesSize: 0.0,
        circleColor:
            const CircleColor(start: Colors.amber, end: Color(0xffFFE963)),
        likeBuilder: (isFavorite) {
          return Icon(
            Icons.favorite,
            color: isFavorite ? Color(0xffFA1D5E) : Colors.black26,
            size: buttonSize,
          );
        },
        onTap: onLikeButtonTapped,
      ),
    );
  }

  Widget buyButton() {
    return MaterialButton(
      height: 65,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      minWidth: (MediaQuery.of(context).size.width) - 100,
      color: Color(0xffffa511),
      onPressed: () {
        showModalBottomSheet<dynamic>(
          isScrollControlled: true,
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          builder: (BuildContext bc) {
            return modalBottonSheet(bc);
          },
        );
      },
      child: Text(
        '구매하기',
        style: TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget modalBottonSheet(BuildContext bc) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      color: Colors.transparent,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            selectOptionButton(),
            SizedBox(height: 20),
            purchaseInformation(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                addToCartButton(),
                SizedBox(width: 10),
                immediateBuyButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget selectOptionButton() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        icon: Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(Icons.keyboard_arrow_down_rounded),
        ),
        iconSize: 35.0,
        hint: Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            '옵션 선택',
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
        buttonHeight: 50,
        buttonWidth: (MediaQuery.of(context).size.width) * 0.95,
        itemHeight: 50,
      ),
    );
  }

  Widget purchaseInformation() {
    int totalPrice = this.product.price;
    var priceFormat = NumberFormat('###,###,###,###원');

    return Container(
      color: Colors.white,
      height: 60,
      width: (MediaQuery.of(context).size.width),
      child: Row(
        children: [
          Container(
            height: 60,
            width: (MediaQuery.of(context).size.width) * 0.4,
            child: Padding(
              padding: EdgeInsets.only(top: 15, left: 25),
              child: Text(
                selectedValue,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          quantityButton(),
          Container(
            height: 60,
            width: (MediaQuery.of(context).size.width) * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  priceFormat.format(totalPrice),
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(width: 5),
                IconButton(
                  onPressed: () {},
                  icon: Padding(
                      padding: EdgeInsets.only(right: 25),
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 20,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double maxValue = 20;

  Widget quantityButton() {
    return Container(
      height: 40,
      width: 100,
      child: SpinBox(
          incrementIcon:
              Icon(Icons.add_circle, color: Colors.black45, size: 16),
          decrementIcon:
              Icon(Icons.remove_circle, color: Colors.black45, size: 16),
          textStyle: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
          min: 1,
          max: maxValue,
          value: 1,
          spacing: 2),
    );
  }

  Widget addToCartButton() {
    return MaterialButton(
      height: 65,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      minWidth: (MediaQuery.of(context).size.width) * 0.48,
      color: Colors.white,
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        '장바구니 담기',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget immediateBuyButton() {
    return MaterialButton(
      height: 65,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      minWidth: (MediaQuery.of(context).size.width) * 0.48,
      color: Color(0xffffa511),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        '바로구매',
        style: TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Future<bool> onLikeButtonTapped(bool isFavorite) async {
    final bool success = await addToWishList();
    isContains(); // ** 위시리스트 테스트 **
    return success ? !isFavorite : isFavorite;
  }

  bool addToWishList() {
    if (this.user.wishList.contains(this.product)) {
      this.user.wishList.remove(this.product);
      return true;
    } else {
      this.user.wishList.add(this.product);
      showFavoriteDialog(context);
    }
    return true;
  }

  void showFavoriteDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(const Radius.circular(30.0)),
          ),
          backgroundColor: Colors.white,
          content: Container(
            alignment: Alignment.center,
            width: 150,
            height: 170,
            child: Column(
              children: [
                Image.asset('icon/favorite.png'),
                SizedBox(height: 10),
                Text(
                  '위시리스트에 추가되었어요.',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void isContains() {
    if (this.user.wishList.contains(this.product))
      print("위시리스트에 추가되었습니다.");
    else
      print("위시리스트에서 제거되었습니다.");
  }
}
