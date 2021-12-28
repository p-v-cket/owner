import 'package:flutter/material.dart';
import 'package:master/api/signInAPI.dart';
import 'package:master/page/widgets/visit-log-item.dart';
import 'package:master/page/widgets/visit-log-func.dart';
import 'package:dio/dio.dart';
import 'package:master/provider/auth-provider.dart';
import 'package:provider/provider.dart';
import '../colors.dart';
import 'package:share/share.dart';
import 'dart:convert';


class VisitLogPage extends StatefulWidget {
  @override
  _VisitLogPageState createState() => _VisitLogPageState();
}

class _VisitLogPageState extends State<VisitLogPage> {
  late RestClient client;

  _VisitLogPageState() {
    client = RestClient(Dio());
  }
  String _logs =
      'NULL LOGS';

  void _shareLogs(){
    Share.share(_logs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _shareLogs,
        label: const Text('     제출하기     '),
        backgroundColor: MASTERpurple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
      ),
      body: FutureBuilder<List<VisitLog>>(
        future: client.visitorList('Bearer ${Provider.of<AuthProvider>(context, listen: false).accessToken}', 'b759434e-9f22-431e-9c11-43a598edb838'),
        builder: (context, AsyncSnapshot<List<VisitLog>> snapshot) {
          if (snapshot.hasData == false) {
            return Center(child: CircularProgressIndicator(color: MASTERpurple,));
          }
          else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Error: ${snapshot.error}', style: TextStyle(fontSize: 15),),
            );
          }
          else {
            final visit_log = snapshot.data! as Map;
            _logs = jsonEncode(visit_log);
            return ListView.builder(
              itemCount: snapshot.data!.length + 1,
              itemBuilder: (context, int idx) {
                if (idx == 0) return Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Text(
                    '매장 출입자 명단',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                );

                return VisitLogItem(log: snapshot.data![idx - 1]);
              }
            );
          }
        })
    );
  }
}
