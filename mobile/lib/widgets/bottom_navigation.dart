import 'package:flutter/material.dart';
import 'package:mobile/utils/theme.dart';

import '../utils/colors.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          elevatedButtonTheme: DTheme.actionButtonThemeData
        ),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              spacing: 20.0,
              children: [
                Expanded(child: SizedBox(
                  height: 54.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          DColors.primaryGreen
                      ),
                    ),
                    onPressed: () {
                    },
                    child: const Text('Add Product'),
                  ),
                )),
                Expanded(child: SizedBox(
                  height: 54.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          DColors.primaryGreen
                      ),
                    ),
                    onPressed: () {
                    },
                    child: const Text('Add Category'),
                  ),
                )),
              ],
            ),
          ),
        )
    );
  }
}
