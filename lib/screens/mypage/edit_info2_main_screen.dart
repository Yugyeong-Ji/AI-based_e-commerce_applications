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
      appBar: AppBar(
        title: Text(
          '회원 정보 수정',
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
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        shape: Border(bottom: BorderSide(color: Color(0xffc0c0c0), width: 2)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onVerticalDragUpdate: (DragUpdateDetails details) {},
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 27),
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    makeTitle('이메일'),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: Text(
                        widget.myInfo.email,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xffa6a6a6),
                        ),
                      ),
                    ),
                    makeTitle('비밀번호'),
                    makeTextField(widget.myInfo.pwd, _pwdController),
                    makeTitle('비밀번호 확인'),
                    makeTextField(widget.myInfo.pwd, _pwdCheckController),
                    makeTitle('이름'),
                    makeTextField(widget.myInfo.name, _nameController),
                    makeTitle('전화번호'),
                    makeTextField(widget.myInfo.phone, _phoneController),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.only(top: 30),
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
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text("접수가 완료되었습니다.")))
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
        ),
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
      if (_pwdController.text != '') "pwd": _pwdController.text,
      if (_nameController.text != '') "name": _nameController.text,
      if (_phoneController.text != '') "phone": _phoneController.text,
    };
  }
}

Widget makeTitle(String text) {
  return Container(
    alignment: Alignment.topLeft,
    margin: const EdgeInsets.fromLTRB(5, 15, 5, 10),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
