import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: const Color.fromRGBO(21, 114, 161, 1),
    colorScheme: const ColorScheme.light()
        .copyWith(primary: const Color.fromRGBO(21, 114, 161, 1)),
    primaryColorDark: const Color.fromRGBO(4, 71, 104, 1),
    primaryColorLight: const Color.fromRGBO(88, 158, 192, 1),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    backgroundColor: const Color.fromRGBO(242, 224, 228, 1),
    fontFamily: 'Raleway',
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0x00000000),
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headline2: TextStyle(
        color: Color(0x00000000),
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline3: TextStyle(
        color: Color(0x00000000),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      headline4: TextStyle(
        color: Color(0x00000000),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline5: TextStyle(
        color: Color(0x00000000),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      headline6: TextStyle(
        color: Color(0x00000000),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyText1: TextStyle(
        color: Color(0x00000000),
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyText2: TextStyle(
        color: Color(0x00000000),
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
    ),
  );
}
