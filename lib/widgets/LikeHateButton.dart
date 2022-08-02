
//import 'dart:html';

import 'package:baljachwi_project/screens/product_details/review.dart';
import 'package:flutter/material.dart';

class LikeHateButton extends StatefulWidget {
  final Review review;
  final double iconSize;
  final double iconDensity;
  final Color initColor;
  final Color pressedColor;
  const LikeHateButton(
      {Key? key, required this.iconSize, required this.iconDensity, required this.initColor,
        required this.pressedColor, required this.review,})
      : super(key: key);

  @override
  _LikeHateButton createState() =>
      _LikeHateButton(iconSize, iconDensity, initColor, pressedColor, review);
}

class _LikeHateButton extends State<LikeHateButton> {
  final Review review;
  final double iconSize;
  final double iconDensity;
  final Color initColor;
  final Color pressedColor;
  _LikeHateButton(this.iconSize, this.iconDensity, this.initColor, this.pressedColor, this.review);

  bool isLike = false;
  bool isHate = false;
  int like = 0;
  int hate = 0;
  int total = 0;

  @override
  Widget build(BuildContext context) {
    init();
    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              likeButton(),
              Text(like.toString())
            ],
          ),
          SizedBox(width: iconDensity),
          Column(
            children: [
              hateButton(),
              Text(hate.toString())
            ],
          ),
        ],
      ),
    );
  }

  Widget likeButton() {
    return IconButton(
      icon: Icon(Icons.thumb_up, size: iconSize, color: isLike? pressedColor : initColor),
      onPressed: () {
        setState(() {
          if(isHate == false && isLike == false) {
            like++;
            isLike = true;
          }
          else if(isHate == true && isLike == false) {
            like++;
            hate--;
            isLike = true;
            isHate = false;
          }
          else if(isHate == false && isLike == true) {
            like--;
            isLike = false;
          }
          update();
        });
      },
    );
  }


  Widget hateButton() {
    return IconButton(
      icon: Icon(Icons.thumb_down, size: iconSize, color: isHate? pressedColor : initColor),
      onPressed: () {
        setState(() {
          if(isHate == false && isLike == false) {
            hate++;
            isHate = true;
          }
          else if(isHate == false && isLike == true) {
            hate++;
            like--;
            isHate = true;
            isLike = false;
          }
          else if(isHate == true && isLike == false) {
            hate--;
            isHate = false;
          }
          update();
        });
      },
    );
  }

  void init() {
    like = review.like;
    hate = review.hate;
  }

  void update() {
    review.like = like;
    review.hate = hate;
  }

  int getTotal() {
    return like-hate;
  }
}
