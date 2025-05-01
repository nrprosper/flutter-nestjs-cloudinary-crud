import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/screens/on_boarding.dart';
import 'package:mobile/theme.dart';
import 'package:mobile/utils/theme.dart';

void main() async{
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: FNMApplication()));
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
        inputDecorationTheme: DThemes.inputDecorationTheme,
        elevatedButtonTheme: DTheme.elevatedButtonThemeData,
        appBarTheme: AppBarTheme(
          color: Color(0xFFF4F5F9)
        )
      ),
      home: const OnBoardingScreen()
    );
  }

}