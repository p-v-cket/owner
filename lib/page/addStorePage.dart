import 'package:master/api/signInAPI.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:master/colors.dart';
import 'package:master/page/widgets/signColumn.dart';

class AddStorePage extends StatefulWidget {
  @override
  _AddStorePageState createState() => _AddStorePageState();
}

class _AddStorePageState extends State<AddStorePage> {
  final TextEditingController _nameFilter = new TextEditingController();
  final TextEditingController _locationFilter = new TextEditingController();
  final TextEditingController _business_numberFilter = new TextEditingController();
  String _name = "";
  String _location = "";
  String _business_number = "";
  late RestClient client;


  _AddStorePageState() {
    _nameFilter.addListener(_nameListen);
    _locationFilter.addListener(_locationListen);
    _business_numberFilter.addListener(_business_numberListen);
    try {
      client = RestClient(Dio());
    } catch (e) {
      print("Error!!!! $e",);
    }
  }

  void _nameListen() {
    if (_nameFilter.text.isEmpty) {
      _name = "";
    } else {
      _name = _nameFilter.text;
    }
  }

  void _locationListen() {
    if (_locationFilter.text.isEmpty) {
      _location = "";
    } else {
      _location = _locationFilter.text;
    }
  }

  void _business_numberListen() {
    if (_business_numberFilter.text.isEmpty) {
      _business_number = "";
    } else {
      _business_number = _business_numberFilter.text;
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          '가게 등록하기',
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
          InputBlank('이름', _nameFilter).build(),
          InputBlank('지역', _locationFilter).build(),
          InputBlank('사업자등록번호', _business_numberFilter).build(),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            child: new Text('등록'),
            onPressed: _storeEnterPressed,
          ),
        ],
      ),
    );
  }

  void _storeEnterPressed() {
    print('$_name / $_location / $_business_number');
    Store store = Store(name: _name, location: _location, business_number: _business_number);
    client.addStore(store).then((res) => print('성공!')).catchError((e) => print(e));
  }
}
