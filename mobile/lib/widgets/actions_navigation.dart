import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/theme.dart';

class ActionsNavigation extends StatelessWidget {
  const ActionsNavigation({super.key});

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
                          DColors.error
                      ),
                    ),
                    onPressed: () {
                    },
                    child: const Text('Delete Product'),
                  ),
                )),
                Expanded(child: SizedBox(
                  height: 54.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          DColors.warning
                      ),
                    ),
                    onPressed: () {
                    },
                    child: const Text('Update Product'),
                  ),
                )),
              ],
            ),
          ),
        )
    );;
  }
}
