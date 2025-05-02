import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/providers.dart';
import 'package:mobile/widgets/product_card.dart';
import 'package:mobile/widgets/shimmers/product_card_shimmer.dart';

class HomeProducts extends ConsumerWidget {
  const HomeProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productViewModelProvider);

    if (productsState.isError) {
      return Center(
        child: Text(
          'Failed to load products ${productsState.error.toString()}',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      );
    }

    if(productsState.isLoading) {
      return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
        ),
        itemCount: 12,
        itemBuilder: (context, index) => const ProductCardShimmer()
      );
    }

    if (productsState.isSuccess) {
      final products = productsState.data!;
      if (products.isEmpty) {
        return Center(
          child: Text(
            'No products available available',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          ),
        );
      }

      return GridView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        },
      );
    }
    return const SizedBox.shrink();
  }
}
