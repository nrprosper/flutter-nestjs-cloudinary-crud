import 'package:flutter/material.dart';

class DTheme {
  const DTheme._();

  static ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      textStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18.0
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19))
    )
  );


  static ElevatedButtonThemeData actionButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      textStyle: TextStyle(fontSize: 14.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))
    )
  );

}