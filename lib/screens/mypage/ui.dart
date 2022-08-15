import 'package:baljachwi_project/screens/mypage/personal_inquiry2_write_screen.dart';
import 'package:flutter/material.dart';
import 'order_history2_detail_screen.dart';

//AppBar
AppBar makeAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    leading: IconButton(
      icon: Icon(Icons.navigate_before),
      color: Colors.black,
      iconSize: 30,
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    backgroundColor: Colors.white,
    shape: Border(bottom: BorderSide(color: Color(0xffc0c0c0), width: 2)),
    elevation: 0,
  );
}

//mypage, nonmember_home
Column makeCol(double m, String title) {
  return Column(
    children: [
      Container(height: m),
      Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.all(5),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff7f7f7f),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 5, bottom: 10),
        height: 5,
        color: const Color(0xff7f7f7f),
      ),
    ],
  );
}

//mypage, nonmember_home
Container makeList(BuildContext context, Widget path, String title) {
  return Container(
    child: Column(
      children: [
        GestureDetector(
          onVerticalDragUpdate: (DragUpdateDetails details) {},
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => path,
              ),
            );
          },
          child: Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(5),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xffa6a6a6),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 8),
          height: 1,
          color: const Color(0xffd9d9d9),
        )
      ],
    ),
  );
}

// order_history, nonmember_order
Container makeOrderList(BuildContext context, var _orderNum, String _product,
    String _time, String _payment, var _price, var _num, String _state) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Color(0xffd9d9d9)),
      color: Colors.white,
    ),
    padding: const EdgeInsets.fromLTRB(30, 5, 30, 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: Text(
                  '주문 번호',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 20,
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: Text(
                  _orderNum.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: IconButton(
                  icon: Icon(
                    Icons.navigate_next,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => orderHistoryDetail(_orderNum,
                            _product, _time, _payment, _price, _num, _state),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 1,
          margin: const EdgeInsets.only(top: 5, bottom: 15),
          color: Color(0xffd9d9d9),
        ),
        makeOrderRow('상품명', _product),
        Container(height: 10),
        makeOrderRow('결제 금액', f.format(_price * _num).toString() + '원'),
        Container(height: 10),
        makeOrderRow('결제 일시', _time),
        Container(height: 10),
        makeOrderRow('주문 상태', _state),
      ],
    ),
  );
}

Row makeOrderRow(String title, String content) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Expanded(
        flex: 7,
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff7f7f7f)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      Expanded(
        flex: 23,
        child: Container(
          child: Text(
            content,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ],
  );
}

Widget makeTextField(String _hint, TextEditingController _controller) {
  return Container(
    height: 50,
    margin: const EdgeInsets.only(bottom: 7),
    child: TextField(
      controller: _controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Color(0xffd9d9d9), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Color(0xffd9d9d9), width: 2),
        ),
        hintText: _hint,
        hintStyle: TextStyle(color: Color(0xffa6a6a6)),
      ),
    ),
  );
}

Container makeTap(String _tap) {
  return Container(
    color: Colors.white,
    height: 50,
    alignment: Alignment.center,
    child: Text(
      _tap,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    ),
  );
}

Container makeInquiryText(String _text) {
  return Container(
    alignment: Alignment.topLeft,
    child: Text(
      _text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget makeInquiryTextForm(String _title, TextFormField _form) {
  return Column(
    children: [
      makeInquiryText(_title),
      Container(
        height: 40,
        margin: const EdgeInsets.only(top: 5, bottom: 20),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xffa6a6a6), width: 1),
          ),
        ),
        child: _form,
      ),
    ],
  );
}

InputDecoration inquiryFieldDeco(String _hint) {
  return InputDecoration(
    border: InputBorder.none,
    hintText: _hint,
    hintStyle: TextStyle(color: Color(0xffa6a6a6)),
  );
}

Container makeTitle(String _title) {
  // address(add, edit)
  return Container(
    margin: const EdgeInsets.fromLTRB(10, 10, 0, 3),
    alignment: Alignment.centerLeft,
    child: Text(
      _title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget makeTextbox(String _title, String _text, TextEditingController _c) {
  // address(add, edit)
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 0, 3),
        alignment: Alignment.centerLeft,
        child: Text(
          _title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 5),
        child: TextField(
          controller: _c,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffd9d9d9)),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffd9d9d9)),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: _text,
            hintStyle: TextStyle(
              color: Color(0xffd9d9d9),
            ),
          ),
        ),
      ),
    ],
  );
}

bool vaildCheck(bool B) {
  if (B) {
    return false;
  }
  return true;
}
