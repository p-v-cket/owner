import 'package:master/api/signInAPI.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:master/colors.dart';
import 'package:master/page/widgets/sign-column.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:master/page/widgets/signin-tos.dart';

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
    return Column(
      children: [
        ButtonDeco('약관동의', _showSheetWithoutList),
        ButtonDeco('회원가입', _loginPressed),
      ],
    );
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
      ),
      headerBuilder: (context, offset) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: 50,
          child: Expanded(
            child: Center(
              child: Text(
                '이용약관',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
      bodyBuilder: (context, offset) {
        return SliverChildListDelegate(
          children,
        );
      },
      anchors: [.2, 0.5, .8],
    );
  }

}


