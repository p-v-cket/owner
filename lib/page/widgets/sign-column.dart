import 'package:flutter/material.dart';
import 'package:master/colors.dart';

class InputBlank {
  InputBlank(this.text, this.controller, this.obscure);

  String text;
  TextEditingController controller;
  bool obscure;

  Widget build() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        TextField(
          controller: this.controller,
          enableSuggestions: false,
          autocorrect: false,
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
          ),
          cursorColor: Colors.grey.withOpacity(0.8),
          obscureText: obscure,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

Widget ButtonDeco(text, func) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        primary: MASTERpurple,
        //padding: EdgeInsets.all(15),
        textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal:0),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      width: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: MASTERpurple, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    onPressed: func,
  );
}
