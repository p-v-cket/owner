import 'package:master/api/signInAPI.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:master/colors.dart';
import 'package:master/page/widgets/sign-column.dart';

//filter 추가해야 됨.

class ResetPWPage extends StatefulWidget {
  @override
  _ResetPWPageState createState() => _ResetPWPageState();
}

class _ResetPWPageState extends State<ResetPWPage> {

  String _phone = "";
  late RestClient client;


//  _ResetPWPageState() {
//    _phoneFilter.addListener(_phoneListen);
//    try {
//      client = RestClient(Dio());
//    } catch (e) {
//      print("Error!!!! $e",);
//    }
//  }
//  void _phoneListen() {
//    if (_phoneFilter.text.isEmpty) {
//      _phone = "";
//    } else {
//      _phone = _phoneFilter.text;
//    }
//  }

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
          InputBlankWithButton(
      input_text: '전화번호',
        obscure: false,
        button_text: '전송',
        button_func: (value) {
          _messageSendPressed(value);
        }).build(),
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


  VoidCallback _messageSendPressed(String field_content){
    print(field_content);
    _phone = field_content;
    return () => '$_phone';
  }
}