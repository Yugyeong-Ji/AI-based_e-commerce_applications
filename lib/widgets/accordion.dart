import 'package:flutter/material.dart';

class Accordion extends StatefulWidget {
  final Widget title;
  final Widget content;
  final bool useAnotherTitle;
  final Widget title_at_showContent;

  const Accordion(
      {Key? key,
      required this.title,
      required this.content,
      required this.useAnotherTitle,
      required this.title_at_showContent})
      : super(key: key);

  @override
  _AccordionState createState() => _AccordionState(this.title, this.content,
      this.title_at_showContent, this.useAnotherTitle);
}

class _AccordionState extends State<Accordion> {
  final Widget title;
  final Widget content;
  final Widget title_at_showContent; // 컨텐츠가 펼져쳤을 때 보일 타이틀(선택)
  final bool useAnotherTitle;

  _AccordionState(this.title, this.content, this.title_at_showContent,
      this.useAnotherTitle);

  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.only(top: 2, bottom: 10, left: 10, right: 10),
      child: Column(children: [
        ListTile(
          title: Row(
            children: [
              _showContent && useAnotherTitle
                  ? this.title_at_showContent
                  : this.title,
              IconButton(
                visualDensity: VisualDensity.compact,
                icon: Icon(_showContent
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_up, color:  Color(0xffDE900F)),
                onPressed: () {
                  setState(() {
                    _showContent = !_showContent;
                  });
                },
              ),
            ],
          ),
        ),
        _showContent
            ? Container(
                padding:
                    const EdgeInsets.all(10),
                child: this.content)
            : Container()
      ]),
    );
  }
}
