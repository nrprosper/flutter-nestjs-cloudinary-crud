import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/screens/on_boarding.dart';
import 'package:mobile/utils/theme.dart';

void main() {
  runApp(const FNMApplication());
}

class FNMApplication extends StatelessWidget {
  const FNMApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFFF4F5F9),
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme
        ),
        elevatedButtonTheme: DTheme.elevatedButtonThemeData
      ),
      home: const OnBoardingScreen()
    );
  }

}