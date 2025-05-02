import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/providers.dart';
import 'package:mobile/screens/categories_screen.dart';
import 'package:mobile/sections/home_products.dart';
import 'package:mobile/sections/home_top_categories.dart';
import 'package:mobile/utils/text.dart';
import 'package:mobile/widgets/bottom_navigation.dart';
import 'package:mobile/widgets/product_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              ref.read(categoryViewModelProvider.notifier).fetchCategories(),
              ref.read(productViewModelProvider.notifier).fetchProducts(),
            ]);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
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
                        Text(
                          DTexts.categories,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CategoriesScreen(),
                              ),
                            );
                          },
                          icon: Icon(Icons.chevron_right_rounded),
                        ),
                      ],
                    ),
                    SizedBox(height: 78, child: HomeTopCategories()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DTexts.featured,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        IconButton(
                          onPressed: () => {},
                          icon: Icon(Icons.chevron_right_rounded),
                        ),
                      ],
                    ),
                    HomeProducts(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
