import 'package:flutter/material.dart';
import 'package:mobile/utils/text.dart';
import 'package:mobile/widgets/bottom_navigation.dart';
import 'package:mobile/widgets/category_card.dart';
import 'package:mobile/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.0),
              child: Column(
                spacing: 12.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DTexts.categories, style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900
                      )),
                      IconButton(
                          onPressed: () => {}, 
                          icon: Icon(Icons.chevron_right_rounded)
                      )
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 16,
                      children: [
                        CategoryCard(),
                        CategoryCard(),
                        CategoryCard(),
                        CategoryCard(),
                        CategoryCard(),
                        CategoryCard()
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DTexts.featured, style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900
                      )),
                      IconButton(
                          onPressed: () => {},
                          icon: Icon(Icons.chevron_right_rounded)
                      )
                    ],
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(10, (index) => ProductCard()).toList()
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}