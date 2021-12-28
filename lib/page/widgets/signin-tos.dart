import 'package:flutter/material.dart';
import 'package:master/colors.dart';



List<Widget> children = [
  _CheckMsg(agreeMessage: '동의합니다1'),
  _CheckMsg(agreeMessage: '동의합니다2'),
  //ButtonDeco('회원가입', _loginPressed),
];

class _CheckMsg extends StatefulWidget {
  final String agreeMessage;
  const _CheckMsg({
    required this.agreeMessage,
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
        Checkbox(
          checkColor: MASTERpurple,
          activeColor: Colors.white,
          focusColor: Colors.white,
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
        )
      ],
    );
  }
}
