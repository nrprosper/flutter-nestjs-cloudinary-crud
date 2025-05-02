import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/providers.dart';
import 'package:mobile/widgets/category_card.dart';
import 'package:mobile/widgets/shimmers/category_card_shimmer.dart';

class HomeTopCategories extends ConsumerWidget {
  const HomeTopCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryState = ref.watch(categoryViewModelProvider);

    if (categoryState.isLoading) {
      return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => CategoryCardShimmer(),
        separatorBuilder: (context, index) => SizedBox(width: 24.0),
      );
    }

    if (categoryState.isError) {
      return Center(
        child: Text(
          'Failed to load categories ${categoryState.error.toString()}',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      );
    }

    if (categoryState.isSuccess) {
      final categories = categoryState.data!;
      if (categories.isEmpty) {
        return Center(
          child: Text(
            'No categories available',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          ),
        );
      }

      return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 24.0),
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryCard(category: category);
        },
      );
    }
    return const SizedBox.shrink();
  }
}
