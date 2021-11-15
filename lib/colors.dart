import 'package:flutter/material.dart';

const MASTERpurple = Color.fromRGBO(127, 8, 246, 1);

const MaterialColor MASTERpurpleM = const MaterialColor(
  0xffffffff,
  <int, Color>{
    50: Color(0x0ff7F08F6),
    100: Color(0x1f7F08F6),
    200: Color(0x2f7F08F6),
    300: Color(0x3f7F08F6),
    400: Color(0x4f7F08F6),
    500: Color(0x5f7F08F6),
    600: Color(0x6f7F08F6),
    700: Color(0x7f7F08F6),
    800: Color(0x8f7F08F6),
    900: Color(0x9f7F08F6),
  },
);

class Item {
  Item(this.name, this.icon, this.color);
  String name;
  IconData icon;
  Color color;

  Icon buildIcon() => Icon(
    this.icon,
    color: this.color,
  );
}


class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.apartment_outlined,
          size: MediaQuery.of(context).size.width * 0.785,
          color: MASTERpurple,
        ),
      ),
    );
  }
}
