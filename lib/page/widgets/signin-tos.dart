import 'package:flutter/material.dart';
import 'package:master/colors.dart';

class TosMap {
  final String msg, text;
  final bool nec;

  TosMap(this.msg, this.nec, this.text);

  Widget TOSwidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CheckMsg(agreeMessage: this.msg, necess: this.nec),
        _tosText(text: this.text),
      ],
    );
}
}

final tosmap = [
  TosMap('동의합니다1', true, '1. 국가공간정보포털은 이용자가 본 약관 내용에 동의하는 경우, 국가공간정보포털의 서비스 제공 행위 및 회원의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.2. 국가공간정보포털은 약관을 개정할 경우, 적용일자 및 개정사유를 명시하여 현행약관과 함께 국가공간정보포털의 초기화면에 그 적용일 7일 이전부터 적용 전일까지 공지합니다. 단, 회원에 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 국가공간정보포털은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 회원이 알기 쉽도록 표시합니다.'),
  TosMap('동의합니다2', false, '변경된 약관은 국가공간정보포털 홈페이지에 공지하거나 e-mail을 통해 회원에게 공지하며, 약관의 부칙에 명시된 날부터 그 효력이 발생됩니다. 회원이 변경된 약관에 동의하지 않는 경우, 회원은 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 변경된 약관의 효력 발생일로부터 7일 이내에 거부의사를 표시하지 아니하고 서비스를 계속 사용할 경우는 약관 변경에 대한 동의로 간주됩니다.'),
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
