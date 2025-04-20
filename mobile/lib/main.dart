import 'package:flutter/material.dart';

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
      ),
      home: Scaffold(
        body: Center(
          child: Text("Welcome to FNM Store - CRUD Application"),
        ),
      ),
    );
  }

}