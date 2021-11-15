import 'package:flutter/material.dart';
import 'package:master/colors.dart';
import 'package:master/second_page/visitLog_func.dart';

class Page2 extends StatelessWidget {
  final visitantsList =[
    Visitant('김기성', '010-1234-5678', '포켓동', '10:11'),
    Visitant('김기성', '010-1234-5678', '포켓동', '10:11'),
    Visitant('김기성', '010-1234-5678', '포켓동', '10:11'),
    Visitant('김기성', '010-1234-5678', '포켓동', '10:11'),
    Visitant('김기성', '010-1234-5678', '포켓동', '10:11'),
    Visitant('김기성', '010-1234-5678', '포켓동', '10:11'),
    Visitant('김기성', '010-1234-5678', '포켓동', '10:11'),
    Visitant('김기성', '010-1234-5678', '포켓동', '10:11'),
    Visitant('김기성', '010-1234-5678', '포켓동', '10:11'),
  ];



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
            children: visitantsList.map<Widget>((Visitant visitant) {
              return visitant.visitLog();
            }).toList(),
          ),
        ],
      ),
    );
  }
}
