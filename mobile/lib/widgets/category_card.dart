import 'package:flutter/material.dart';
import 'package:mobile/utils/colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.0,
      children: [
        Container(height: 52.0, width: 52.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Color(0xFFE6F2EA)
          ),
          child: Center(
            child: SizedBox(height: 28, width: 28,
              child: Image.asset("assets/images/leaf.png", fit: BoxFit.contain),
            ),
          )
        ),
        Text("Vegetables", style: TextStyle(
          color: DColors.grey,
          fontSize: 10.0,
          fontWeight: FontWeight.w900
        ))
      ],
    );
  }
}