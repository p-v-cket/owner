import 'package:flutter/material.dart';
import 'package:master/colors.dart';
import 'package:master/page/reset-password-page.dart';


Widget ButtonDeco(text, func) {
  return Container(
    margin: const EdgeInsets.fromLTRB(0,23,0,0),
    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 0),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: TextButton(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: MASTERpurple, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onPressed: func,
    ),
  );
}


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
            fontSize: 20,
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

class InputBlankWithButton {

  InputBlankWithButton({required this.input_text, required this.obscure, required this.button_text, required this.button_func});

  String input_text;
  final TextEditingController controller = new TextEditingController();
  bool obscure;
  String button_text;
  Function(String value) button_func;

  Widget build() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            input_text,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: TextField(
                  controller: this.controller,
                  enableSuggestions: false,
                  autocorrect: false,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 20,
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
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0,20,0,20),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                ),
            child: TextButton(
            child: Text(
            button_text,
            textAlign: TextAlign.center,
            style: TextStyle(color: MASTERpurple, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              button_func(controller.text);
              },
            ),
            )
          ],
        ),
      ],
    );
  }
}
