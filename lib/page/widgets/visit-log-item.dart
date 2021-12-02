import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:master/api/signInAPI.dart';

class VisitLogItem extends StatelessWidget {
  final VisitLog log;

  const VisitLogItem({Key? key, required this.log}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.log.user.name,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Text(
                this.log.user.phone,
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(128, 128, 128, 1),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                this.log.user.area,
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(128, 128, 128, 1),
                ),
              ),
              Text(
                "${DateFormat('yyyy년 MM월 dd일 HH:mm').format(this.log.created_at.toLocal())}",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(128, 128, 128, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
