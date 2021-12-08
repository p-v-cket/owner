import 'package:flutter/material.dart';

class InputBlank{
  InputBlank(this.text, this.controller, this.obscure);

  String text;
  TextEditingController controller;
  bool obscure;

  Widget build(){
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


