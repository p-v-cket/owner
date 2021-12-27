import 'package:master/api/signInAPI.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:master/colors.dart';
import 'package:master/page/widgets/sign-column.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _nameFilter = new TextEditingController();
  final TextEditingController _phoneFilter = new TextEditingController();
  //final TextEditingController _addressFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _name = "";
  String _phone = "";
  //String _address = "";
  String _password = "";
  late RestClient client;

  _SignInPageState() {
    _nameFilter.addListener(_nameListen);
    _phoneFilter.addListener(_phoneListen);
    //_addressFilter.addListener(_addressListen);
    _passwordFilter.addListener(_passwordListen);
    try {
      client = RestClient(Dio());
    } catch (e) {
      print(
        "Error!!!! $e",
      );
    }
  }

  void _nameListen() {
    if (_nameFilter.text.isEmpty) {
      _name = "";
    } else {
      _name = _nameFilter.text;
    }
  }

  void _phoneListen() {
    if (_phoneFilter.text.isEmpty) {
      _phone = "";
    } else {
      _phone = _phoneFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          '사장님 회원가입',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: MASTERpurple,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.chevron_left),
        ),
      ),
      body: new Container(
        color: MASTERpurple,
        padding: EdgeInsets.all(16.0),
        child: new ListView(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          InputBlank('이름', _nameFilter, false).build(),
          InputBlank('연락처', _phoneFilter, false).build(),
          InputBlank('비밀번호', _passwordFilter, true).build(),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return ButtonDeco('회원가입', _showSheetWithoutList);
  }

  void _loginPressed() {
    print('$_name / $_phone / $_password');
    Customer owner =
        Customer(name: _name, phone: _phone, raw_password: _password);
    client
        .signup(owner)
        .then((res) => print('성공!'))
        .catchError((e) => print(e));
  }

  void _showSheetWithoutList() {
    showStickyFlexibleBottomSheet<void>(
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: .8,
      headerHeight: 50,
      context: context,
      decoration: const BoxDecoration(
        color: MASTERpurple,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      headerBuilder: (context, offset) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: MASTERpurple,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: Expanded(
            child: Center(
              child: Text(
                '약관에 동의해주세요',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
      bodyBuilder: (context, offset) {
        return SliverChildListDelegate(
          _children,
        );
      },
      anchors: [.2, 0.5, .8],
    );
  }
}

List<Widget> _children = [
  const _TextField(agreeMessage: '동의합니다1'),
  const _TestContainer(color: Color(0xEEFFFF00)),
  const _TextField(agreeMessage: '동의합니다2'),
  const _TestContainer(color: Color(0xDD99FF00)),
];

class _TextField extends StatelessWidget {
  final String agreeMessage;
  const _TextField({
    required this.agreeMessage,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: agreeMessage,
      ),
    );
  }
}

class _TestContainer extends StatelessWidget {
  final Color color;

  const _TestContainer({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: color,
      ),
    );
  }
}
