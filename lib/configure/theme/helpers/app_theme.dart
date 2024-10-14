import 'package:flutter/material.dart';

const Color _customcolor = Color(0xFF49149F);

List<Color> _color = [
  _customcolor,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.teal,
  Colors.green,
  Colors.pink,
];

class AppTheme {
  final int selctedcolor;
  AppTheme({this.selctedcolor = 0})
      : assert(selctedcolor >= 0 && selctedcolor < _color.length,
            'color index must be betetween and ${_color.length - 1}');

  ThemeData theme() {
    return ThemeData(useMaterial3: false, colorSchemeSeed: _color[4]);
  }
}