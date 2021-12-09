import 'package:master/api/signInAPI.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:master/colors.dart';
import 'package:master/page/widgets/sign-column.dart';

class ResetPWPage extends StatefulWidget {
  @override
  _ResetPWPageState createState() => _ResetPWPageState();
}

class _ResetPWPageState extends State<ResetPWPage> {
  final TextEditingController _phoneFilter = new TextEditingController();
  String _phone = "";
  late RestClient client;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          '비밀번호 재설정',
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
          InputBlank('전화번호', _phoneFilter, false).build(),
          //InputBlank('연락처', _phoneFilter, false).build(),
          //InputBlank('비밀번호', _passwordFilter, true).build(),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      //ButtonDeco('회원가입', _loginPressed);
    );
  }

  void _messageSendPressed() {
    print('$_phone');
    //Customer owner = Customer(name: _name, phone: _phone, raw_password: _password);
    //client.signup(owner).then((res) => print('성공!')).catchError((e) => print(e));
  }
}