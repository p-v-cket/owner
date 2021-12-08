import 'package:master/api/signInAPI.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:master/colors.dart';
import 'package:master/page/widgets/sign-column.dart';
import 'package:master/provider/auth-provider.dart';
import 'package:provider/provider.dart';
import 'package:smart_dropdown/smart_dropdown.dart';

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
          '가게 관리',
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
      body:
      Container(
        child: new Column(
          children: <Widget>[
            Container(
                color: MASTERpurple,
                child: Provider.of<AuthProvider>(context, listen: false).storeList != null ? _showStoreList() : Text("현재 등록된 가게가 없습니다.")),
            Expanded(
              child: _addStore(),
            ),
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
          InputBlank('지역', _locationFilter, false).build(),
          InputBlank('사업자등록번호', _business_numberFilter, false).build(),
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

  Widget _addStore(){
    return Container(
      color: MASTERpurple,
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          _buildTextFields(),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _showStoreList(){
    List<StoreInfo>? lst = Provider.of<AuthProvider>(context, listen: false).storeList;
//    return ListView.builder(
//        padding: const EdgeInsets.all(8),
//        itemCount: lst?.length,
//        itemBuilder: (BuildContext context, int index) {
//          return Container(
//            height: 50,
//            color: MASTERpurple,
//            child: Center(child: Text(lst![index].name)),
//          );
//        }
//    );
    List<SmartDropdownMenuItem<String>> items;
    items = lst!.map((e) => SmartDropdownMenuItem(value: e.uuid, child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(e.name),
    ))).toList();

    return Center(
      child: SizedBox(
          height: 40, width: 300,
          child: SmartDropDown(
            items: items,
            hintText: "가게를 선택하세요.",
            borderRadius: 5,
            borderColor: Colors.white,
            expandedColor: MASTERpurple,

            onChanged: (val){
              print(val);
              Provider.of<AuthProvider>(context, listen: false).storeUuid = val;
            },
          )
        ),
    );
  }


  void _storeEnterPressed() {
    print('$_name / $_location / $_business_number');
    Store store = Store(name: _name, location: _location, business_number: _business_number);
    print((Provider.of<AuthProvider>(context, listen: false).accessToken));
    client.addStore("Bearer ${Provider.of<AuthProvider>(context, listen: false).accessToken}", store).then((res) => print('성공!')).catchError((e) => print(e));
  }
}
