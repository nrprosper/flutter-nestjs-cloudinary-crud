import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryCardShimmer extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;
  final double imageWidth;
  final double imageHeight;
  final double fontSize;

  const CategoryCardShimmer({
    super.key,
    this.containerHeight = 52.0,
    this.containerWidth = 52.0,
    this.imageWidth = 28.0,
    this.imageHeight = 28.0,
    this.fontSize = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: containerHeight,
              width: containerWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              height: fontSize,
              width: containerWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
