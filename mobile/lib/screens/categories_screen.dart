import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Categories", style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(12, (index) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white
                ),
                child: const Center(
                  child: CategoryCard(
                    containerHeight: 66.0,
                    containerWidth: 66.0,
                    imageHeight: 32.0,
                    imageWidth: 32.0,
                    fontSize: 12.0,
                  ),
                ),
              )).toList()
          ),
        ),
      ),
    );
  }
}
