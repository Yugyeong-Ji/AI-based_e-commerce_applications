import 'package:baljachwi_project/widgets/user.dart';
import 'package:flutter/material.dart';
import 'package:baljachwi_project/screens/mypage/edit_member_info2_screen.dart';
import 'package:baljachwi_project/screens/mypage/ui.dart';

class EditMemberInfo extends StatefulWidget {
  final User myInfo;
  const EditMemberInfo(this.myInfo, {Key? key}) : super(key: key);
  @override
  _EditMemberInfo createState() => _EditMemberInfo();
}

class _EditMemberInfo extends State<EditMemberInfo> {
  final _pwdController = TextEditingController();
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
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 7),
                  child: const Text(
                    '비밀번호 재확인',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child: const Text(
                    '회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인해 주세요.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xffa6a6a6),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 30),
                  child: TextField(
                    controller: _pwdController,
                    style: TextStyle(color: Color(0xffa6a6a6)),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 15),
                  width: double.infinity,
                  color: const Color(0xfff2f2f2),
                  child: ElevatedButton(
                    onPressed: () {
                      if (pwdCheck()) {
                        _pwdController.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditMemberInfo2(widget.myInfo),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('비번 일치 X')));
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
                      '확인',
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
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  bool pwdCheck() {
    if (_pwdController.text == widget.myInfo.pwd) {
      return true;
    }
    return false;
  }
}
