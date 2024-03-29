import 'package:flutter/material.dart';
import 'package:master/page/widgets/main-func.dart';

class Page1 extends StatelessWidget {
  final graphItems = [
    Statistics('월', 0.2, 0.8),
    Statistics('화', 0.2, 0.8),
    Statistics('수', 0.2, 0.8),
    Statistics('목', 0.3, 0.6),
    Statistics('금', 0.2, 0.8),
    Statistics('토', 0.8, 0.2),
    Statistics('일', 0.2, 0.8),
    Statistics('월', 0.2, 0.8),
  ];

  final buttonItems = [
    Managements('매장 출입자 명단 제출하기', Colors.indigo, Icons.person_search),
    Managements(
        '매장 상세 현황', Colors.deepPurple, Icons.store_mall_directory_outlined),
    Managements('직원 급여 지급하기', Colors.green, Icons.money),
    Managements('직원/포인트 카드 발급하기', Colors.yellow, Icons.local_parking),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(1, 186, 115, 255),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: ListView(
        children: <Widget>[
          _buildTop(),
          _buildBottom(),
        ],
      ),
    );
  }

  Widget _buildTop() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              '이번 주 매장 현황',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: graphItems.map<Widget>((Statistics statistics) {
                return statistics.graph();
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Text(
              '매장 관리',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: buttonItems.map<Widget>((Managements managements) {
              return managements.button();
            }).toList(),
          ),
        ],
      ),
    );
  }
}
