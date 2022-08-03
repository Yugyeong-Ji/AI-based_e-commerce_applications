import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';

class inviteFriend extends StatefulWidget {
  @override
  State<inviteFriend> createState() => _inviteFriendState();
}

class _inviteFriendState extends State<inviteFriend> {
  final _inviteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(context, '친구 초대'),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 2,
              color: Color(0xffc0c0c0),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 27),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 7),
                    child: Text(
                      '새로운 친구를 초대해 보세요',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Text(
                      '친구의 카카오톡 아이디 or 전화번호를 입력해주세요.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xffa6a6a6),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(top: 15),
                    child: TextField(
                      controller: _inviteController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xffd9d9d9),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xffffa511),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(top: 15),
                    width: double.infinity,
                    color: Color(0xfff2f2f2),
                    child: ElevatedButton(
                      child: Text(
                        '초대하기',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        primary: Color(0xffffa511),
                      ),
                      onPressed: () {
                        if (vaildCheck()) {
                          print('valid check');
                          addFriend();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool vaildCheck() {
    if (_inviteController == "") {
      return false;
    }
    return true;
  }

  void addFriend() {
    friend newFriend = friend(_inviteController.text);
    FirebaseFirestore db = FirebaseFirestore.instance;
    db
        .collection('freinds')
        .add(newFriend.toFirestore())
        .then((value) => {print('문의가 접수되었습니다!')});
    //
  }
}

class friend {
  String? phoneNumber;
  friend(this.phoneNumber);

  Map<String, dynamic> toFirestore() {
    return {
      if (phoneNumber != null) "phoneNumber": phoneNumber,
    };
  }
}
