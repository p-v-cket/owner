import 'package:flutter/material.dart';

class Visitant {
  Visitant(this.name, this.number, this.address, this.time);

  String name, number, address, time;

  Widget visitLog() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.name,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Text(
                this.number,
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
                this.address,
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(128, 128, 128, 1),
                ),
              ),
              Text(
                this.time,
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