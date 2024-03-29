import 'package:master/api/signInAPI.dart';
import 'package:master/page/signin-page.dart';
import 'package:master/provider/auth-provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:master/colors.dart';
import 'package:master/page/widgets/sign-column.dart';
import 'package:provider/provider.dart';
import 'package:master/page/reset-password-page.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _idFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _id = "";
  String _password = "";
  late RestClient client;

  _LogInPageState() {
    _idFilter.addListener(_idListen);
    _passwordFilter.addListener(_passwordListen);
    try {
      client = RestClient(Dio());
    } catch (e) {
      print(
        "Error!!!! $e",
      );
    }
  }

  void _idListen() {
    if (_idFilter.text.isEmpty) {
      _id = "";
    } else {
      _id = _idFilter.text;
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
          '로그인',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: MASTERpurple,
        elevation: 0.0,
      ),
      body: new Container(
          color: MASTERpurple,
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/main_logo.png',
                  height: 200,
                  width: 200,
                ),
              ),
              _buildTextFields(),
              SizedBox(
                height: 30,
              ),
              _buildButtons(),
            ],
          )),
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          InputBlank('아이디(전화번호)', _idFilter, false).build(),
          InputBlank('비밀번호', _passwordFilter, true).build(),
        ],
      ),
    );
  }


  Widget _buildButtons() {
    return new Container(
      child: new Column(
        children: <Widget>[
          ButtonDeco('Log In', _loginPressed),
          ButtonDeco('Sign Up', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignInPage()),
            );
          }),
          ButtonDeco('Reset Password', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResetPWPage()),
            );
          }),
        ],
      ),
    );
  }

  void _loginPressed() {
    client.login(_id, _password).then((value) async {
      print(value);

      client.authTest("Bearer $value").then((value) => print(value));
      Provider.of<AuthProvider>(context, listen: false).setAccessToken(value);
    }).catchError((e) {
      print(e);
      print('Wrong password!');
    });
  }
}