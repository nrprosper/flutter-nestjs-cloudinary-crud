import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/providers.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/widgets/actions_navigation.dart';
import 'package:mobile/widgets/shimmers/product_details_shimmer.dart';

class ProductDetails extends ConsumerWidget {
  final String productId;

  const ProductDetails({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsyncValue = ref.watch(productDetailsProvider(productId));

    return Theme(
      data: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        bottomNavigationBar: const ActionsNavigation(),
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        body: productAsyncValue.when(
          data:
              (product) => RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(productDetailsProvider(productId));
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: Image.network(product.images[0]),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          spacing: 16.0,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "\$${product.price.toStringAsFixed(2)}",
                                      style: TextStyle(
                                        color: DColors.primaryGreen,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      '${product.name}',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${product.lbs} lbs",
                                      style: TextStyle(
                                        color: DColors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_border_rounded),
                                ),
                              ],
                            ),

                            Text(
                              product.description,
                              style: TextStyle(color: Color(0xFF868889)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          error:
              (error, stack) => Center(
                child: Text(
                  'Failed to load product details ${error.toString()}',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          loading: () => const ProductDetailsShimmer(),
        ),
      ),
    );
  }
}
