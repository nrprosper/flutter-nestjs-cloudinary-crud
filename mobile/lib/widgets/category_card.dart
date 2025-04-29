import 'package:flutter/material.dart';
import 'package:mobile/data/category.dart';
import 'package:mobile/utils/colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    this.containerHeight = 52.0,
    this.containerWidth = 52.0,
    this.imageWidth = 28.0,
    this.imageHeight = 28.0,
    this.fontSize = 10.0,
    required this.category
  });

  final double containerHeight;
  final double containerWidth;
  final double imageWidth;
  final double imageHeight;
  final double fontSize;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        spacing: 5.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(height: containerHeight, width: containerWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Color(0xFFE6F2EA)
              ),
              child: Center(
                child: SizedBox(height: imageHeight, width: imageWidth,
                  child: Image.network(category.image, fit: BoxFit.contain),
                ),
              )
          ),
          Text(category.name, style: TextStyle(
              color: DColors.grey,
              fontSize: fontSize,
              fontWeight: FontWeight.w900
          ))
        ],
      ),
    );
  }
}