import 'package:flutter/material.dart';

final ThemeData customTheme = ThemeData.dark().copyWith(
  canvasColor: const Color(0xFF282A36),
  scaffoldBackgroundColor: const Color(0xFF282A36),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0,
    unselectedItemColor: Color(0xFF44475A),
    selectedItemColor: Color(0xFFFF79C6),
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
    type: BottomNavigationBarType.shifting,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color(0xFF282A36),
    iconTheme: IconThemeData(color: Color(0xFFF8F8F2)),
    actionsIconTheme: IconThemeData(size: 30),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.pink,
    linearTrackColor: Colors.pink[100],
  ),
  iconTheme: const IconThemeData(color: Colors.pink),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFFF79C6),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor:
          MaterialStateProperty.all<Color>(const Color(0xFF282A36)),
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0xFFFF79C6)),
    ),
  ),
);
