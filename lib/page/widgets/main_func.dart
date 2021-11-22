import 'package:flutter/material.dart';
import 'package:master/colors.dart';

class Statistics {
  Statistics(this.day, this.pre, this.cur);
  String day;
  double pre, cur;

  Widget graph() {
    return SizedBox(
      width: 25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                color: MASTERpurple,
                width: 4,
                height: this.pre * 150,
              ),
              Container(
                color: Colors.deepOrange,
                width: 4,
                height: this.cur * 150,
              ),
            ],
          ),
          Text(
            this.day,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

}
class Managements {
  Managements(this.str, this.color, this.icon);
  String str;
  IconData icon;
  Color color;

  Widget button() {
    return SizedBox(
      height: 67,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              SizedBox(width: 22),
              Container(
                color: this.color,
                child: Icon(
                  this.icon,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Text(
                this.str,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.chevron_right,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }

}
