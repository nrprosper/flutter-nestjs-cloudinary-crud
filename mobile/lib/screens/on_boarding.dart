import 'package:flutter/material.dart';
import 'package:mobile/screens/home_screen.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/text.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/onboarding.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 100.0,
            left: 30.0,
            right: 30.0,
            child: Column(
              spacing: 28.0,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 56.0,
                  width: 48.0,
                ),
                Column(
                  spacing: 8.0,
                  children: [
                    Text(
                      DTexts.welcome,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 48.0,
                        height: 1,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      DTexts.welcomeDesc,
                      style: TextStyle(
                        color: DColors.descColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 67.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          DColors.primaryGreen
                      )
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context)=> const HomeScreen())
                      );
                    },
                    child: Text(
                        DTexts.getStated
                    )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}