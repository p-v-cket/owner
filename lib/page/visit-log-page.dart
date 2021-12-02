import 'package:flutter/material.dart';
import 'package:master/api/signInAPI.dart';
import 'package:master/page/widgets/visit-log-item.dart';
import 'package:master/page/widgets/visit-log-func.dart';
import 'package:dio/dio.dart';
import 'package:master/provider/auth-provider.dart';
import 'package:provider/provider.dart';
import '../colors.dart';

class VisitLogPage extends StatefulWidget {
  @override
  _VisitLogPageState createState() => _VisitLogPageState();
}

class _VisitLogPageState extends State<VisitLogPage> {
  late RestClient client;

  _VisitLogPageState() {
    client = RestClient(Dio());
    getData();
  }

  List<VisitLog> visitantsList = [];

  getData() async {
    client.visitorList('Bearer ${Provider.of<AuthProvider>(context, listen: false).accessToken}', 'b759434e-9f22-431e-9c11-43a598edb838').then((res) => {
      this.setState(() {
        visitantsList = res;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('     제출하기     '),
        backgroundColor: MASTERpurple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                child: Text(
                  '매장 출입자 명단',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                child: Text(
                  '2021.09.03',
                  style: TextStyle(
                    fontSize: 12,
                    color: MASTERpurple,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: visitantsList.map<Widget>((ele) {
              return VisitLogItem(log: ele,);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
