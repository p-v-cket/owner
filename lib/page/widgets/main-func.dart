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
              fontSize: 18,
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 0),
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color.fromARGB(1, 186, 115, 255)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              SizedBox(width: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Icon(
                  this.icon,
                  color: Colors.deepPurple, //color,
                  size: 30,
                ),
              ),
              SizedBox(width: 10),
              Text(
                this.str,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
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
