import 'package:flutter/material.dart';

class productInquiry extends StatefulWidget {
  const productInquiry({Key? key}) : super(key: key);

  @override
  State<productInquiry> createState() => _productInquiryState();
}

class _productInquiryState extends State<productInquiry> {
  final _valueList = ['배송', '주문 취소', '배송지 변경', '반품/교환', '기타 문의']; // 예시
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '상품 문의',
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
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 2,
                color: Color(0xffc0c0c0),
              ),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(25),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(25),
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: <Widget>[
                      make_boldText('문의 유형'),
                      Container(
                        width: 310,
                        margin: const EdgeInsets.only(bottom: 20),
                        child: DropdownButton(
                          hint: Text(' 문의 유형을 선택해주세요'),
                          value: _selectedValue,
                          items: _valueList
                              .map(
                                (value) => DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value as String;
                            });
                          },
                          style: TextStyle(
                            color: Color(0xffa6a6a6),
                            fontSize: 16,
                          ),
                          isExpanded: true,
                        ),
                      ),
                      make_boldText('주문 번호'),
                      make_textField('주문 번호를 입력해주세요'),
                      make_boldText('작성란'),
                      make_textField('제목을 입력해주세요'),
                      Container(
                        height: 200,
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xffa6a6a6),
                          ),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration.collapsed(
                            hintText: ' 문의하실 내용을 입력해주세요',
                            hintStyle: TextStyle(color: Color(0xffa6a6a6)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                color: Color(0xfff2f2f2),
                child: ElevatedButton(
                  child: Text(
                    '등록',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                    primary: Color(0xffffa511),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => (),
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Container make_boldText(String _text) {
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

Container make_textField(String _hintText) {
  return Container(
    height: 40,
    margin: const EdgeInsets.only(top: 5, bottom: 30),
    child: TextField(
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffa6a6a6)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffa6a6a6)),
        ),
        hintText: _hintText,
        hintStyle: TextStyle(
          color: Color(0xffa6a6a6),
        ),
      ),
    ),
  );
}
