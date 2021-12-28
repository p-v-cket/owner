import 'package:flutter/material.dart';
import 'package:master/colors.dart';
import 'sign-column.dart';

List<Widget> children = [
  _CheckMsg(agreeMessage: '동의합니다1', necess: true),
  _tosText(text: '동의하세요1\n동의하세요1\n동의하세요1\n동의하세요1\n동의하세요1\n'),
  _CheckMsg(agreeMessage: '동의합니다2', necess: false),
  _tosText(text: '동의하세요2\n동의하세요2\n동의하세요2\n동의하세요2\n동의하세요2\n동의하세요2\n동의하세요2\n동의하세요2\n'),
];


class _CheckMsg extends StatefulWidget {
  final String agreeMessage;
  final bool necess;
  const _CheckMsg({
    required this.agreeMessage,
    required this.necess,
    Key? key,
  }) : super(key: key);

  @override
  _CheckMsgState createState() => _CheckMsgState();
}

class _CheckMsgState extends State<_CheckMsg> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 5),
        Checkbox(
          checkColor: MASTERpurple,
          activeColor: Colors.white,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Text(
          widget.agreeMessage,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
        Text(
          widget.necess == true ? '  (필수)' : '  (선택)',
          style: TextStyle(
            color: widget.necess == true ? Colors.white : Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class _tosText extends StatefulWidget {
  final String text;
  const _tosText({required this.text, Key? key}) : super(key: key);

  @override
  _tosTextState createState() => _tosTextState();
}

class _tosTextState extends State<_tosText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 30),
      child: Text(widget.text, style: TextStyle(fontSize: 12,color: Colors.grey),),
    );
  }
}
