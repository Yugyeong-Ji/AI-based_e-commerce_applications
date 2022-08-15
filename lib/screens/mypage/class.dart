import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

var f = NumberFormat('###,###,###,###');

void makeDialog(BuildContext context, String text) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context);
      });
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        content: Container(
          alignment: Alignment.center,
          width: 200,
          height: 50,
          child: Text(text, style: TextStyle(fontSize: 18)),
        ),
      );
    },
  );
}

void makeDialog2(BuildContext context, String text) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context);
        Navigator.pop(context);
      });
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        content: Container(
          alignment: Alignment.center,
          width: 200,
          height: 50,
          child: Text(text, style: TextStyle(fontSize: 18)),
        ),
      );
    },
  );
}

// 회원 등급(할인 혜택) 페이지
class Membership {
  var grade;
  var criteria;
  var benefit;
}

// 회원 등급에 따른 혜택 조회
Future<List<Membership>> getMembership(String grade) async {
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection('membership')
      .where('grade', isEqualTo: grade)
      .get();
  List<Membership> list = [];
  for (var doc in querySnapshot.docs) {
    Membership tmp = Membership();
    tmp.grade = doc['grade'];
    tmp.criteria = doc['criteria'];
    tmp.benefit = doc['benefit'];
    list.add(tmp);
  }
  return list;
}

// 주문 내역
class Order {
  var orderNumber;
  var company;
  var product;
  var date;
  var payment;
  var price;
  var num;
  var state;
}

Future<List<Order>> getOrder() async {
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collection('orderHistory').get();
  List<Order> mOrder = [];
  for (var doc in querySnapshot.docs) {
    Order tmp = Order();
    tmp.orderNumber = doc['orderNumber'];
    tmp.company = doc['company'];
    tmp.product = doc['product'];
    tmp.date = DateFormat("yyyy-MM-dd").format(doc['date'].toDate());
    tmp.payment = doc['payment'];
    tmp.price = doc['price'];
    tmp.num = doc['num'];
    tmp.state = doc['state'];
    mOrder.add(tmp);
  }
  return mOrder;
}

// 배송지 관리
class Address {
  var isDefault;
  var name;
  var address;
  var message;
  var phone;
}

Future<List<Address>> getAddress() async {
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection('address');
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await collectionReference.get();
  List<Address> adrs = [];
  for (var doc in querySnapshot.docs) {
    Address tmp = Address();
    tmp.isDefault = doc['isDefault'];
    tmp.name = doc['name'];
    tmp.address = doc['address'];
    tmp.message = doc['message'];
    tmp.phone = doc['phone'];
    adrs.add(tmp);
  }
  return adrs;
}

void deletedata(BuildContext context, String name) {
  FirebaseFirestore.instance
      .collection("address")
      .doc(name)
      .delete()
      .then((value) => makeDialog2(context, '주소지가 삭제되었습니다.'));
}

class personalInq {
  var type;
  var category;
  var title;
  var content;
  var writer;
  var date;
  var isReply;
  var reply;
  personalInq(this.type, this.category, this.title, this.content, this.writer,
      this.date, this.isReply);
  Map<String, dynamic> toFirestore() {
    return {
      if (type != null) "type": type,
      if (category != null) "category": category,
      if (title != null) "title": title,
      if (content != null) "content": content,
      if (writer != null) "writer": writer,
      if (date != null) "date": date,
      if (isReply != null) "isReply": isReply,
      "reply": reply,
    };
  }
}

class productInq {
  var category;
  var orderNum;
  var title;
  var content;
  var writer;
  var date;
  var isReply;
  var reply;
  productInq(this.category, this.orderNum, this.title, this.content,
      this.writer, this.date, this.isReply);
  Map<String, dynamic> toFirestore() {
    return {
      if (category != null) "category": category,
      if (orderNum != null) "orderNumber": orderNum,
      if (title != null) "type": title,
      if (content != null) "content": content,
      if (writer != null) "writer": writer,
      if (date != null) "date": date,
      if (isReply != null) "isReply": isReply,
      "reply": reply,
    };
  }
}

class Review {
  var orderNumber;
  var stars;
  var company;
  var product;
  var content;
}
