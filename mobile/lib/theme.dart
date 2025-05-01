import 'package:flutter/material.dart';

class DThemes {

  DThemes._();

  static InputDecorationTheme inputDecorationTheme =InputDecorationTheme(
    errorMaxLines: 3,
    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    labelStyle:  const TextStyle().copyWith(fontSize: 14, color: Colors.black),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
      border: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 2, color: Colors.black12)
      ),
      enabledBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.black12)
      ),
      focusedBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.black)
      ),
      errorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red)
      ),
      focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: Colors.orange)
      )
  );

}