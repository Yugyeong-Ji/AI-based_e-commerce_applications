import 'package:baljachwi_project/widgets/user.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';

class EditMemberInfo2 extends StatefulWidget {
  final User myInfo;
  const EditMemberInfo2(this.myInfo, {Key? key}) : super(key: key);
  @override
  _EditInfo createState() => _EditInfo();
}

class _EditInfo extends State<EditMemberInfo2> {
  final _pwdController = TextEditingController();
  final _pwdCheckController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(context, '회원 정보 수정'),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 2,
            color: const Color(0xffc0c0c0),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 27),
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: const Text(
                    '이메일',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    widget.myInfo.email,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xffa6a6a6),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: const Text(
                    '비밀번호',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: _pwdController,
                    style: const TextStyle(
                      color: Color(0xffa6a6a6),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: (widget.myInfo.pwd),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: const Text(
                    '비밀번호 확인',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: _pwdCheckController,
                    style: const TextStyle(
                      color: Color(0xffa6a6a6),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: (widget.myInfo.pwd),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: const Text(
                    '이름',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: _nameController,
                    style: const TextStyle(
                      color: Color(0xffa6a6a6),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: (widget.myInfo.name),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: const Text(
                    '휴대폰',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    controller: _nameController,
                    style: const TextStyle(
                      color: Color(0xffa6a6a6),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: (widget.myInfo.phone),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  color: const Color(0xfff2f2f2),
                  child: ElevatedButton(
                    onPressed: () {
                      if (pwdCheck()) {
                        Map<String, dynamic> tmp = createUpdateData();
                        if (tmp.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("업데이트할 정보가 없습니다.")));
                        } else {
                          print(tmp);
                          db
                              .collection('user')
                              .doc(widget.myInfo.email)
                              .update(tmp)
                              .then((value) => {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("접수가 완료되었습니다.")))
                                  });
                          Navigator.pop(context);
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("비밀번호가 일치하지 않습니다.")));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      primary: const Color(0xffffa511),
                    ),
                    child: const Text(
                      '수정 완료',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool pwdCheck() {
    if (_pwdController.text != _pwdCheckController.text) {
      return false;
    }
    return true;
  }

  Map<String, dynamic> createUpdateData() {
    return {
      if (_pwdController.text != null && _pwdController.text != "")
        "pwd": _pwdController.text,
      if (_nameController.text != null && _nameController.text != "")
        "name": _nameController.text,
      if (_phoneController.text != null && _phoneController.text != "")
        "phone": _phoneController.text,
    };
  }
}
