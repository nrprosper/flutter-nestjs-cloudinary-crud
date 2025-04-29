import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/data/category.dart';
import 'package:mobile/providers.dart';
import 'package:mobile/state/state.dart' as view;
import 'package:mobile/widgets/category_card.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryState = ref.watch(categoryViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Categories",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
      ),
      body: _buildBody(context, ref, categoryState),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, view.State<List<Category>> categoryState) {
    if (categoryState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (categoryState.isSuccess) {
      final categories = categoryState.data!;
      if (categories.isEmpty) {
        return RefreshIndicator(
          onRefresh: () => ref.read(categoryViewModelProvider.notifier).fetchCategories(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - kToolbarHeight - MediaQuery.of(context).padding.top,
              child: Center(
                child: Text(
                  'No categories found',
                  style: GoogleFonts.montserrat(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: () => ref.read(categoryViewModelProvider.notifier).fetchCategories(),
        color: Colors.blue,
        backgroundColor: Colors.white,
        strokeWidth: 2.0,
        displacement: 20.0,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: CategoryCard(
                      containerHeight: 66.0,
                      containerWidth: 66.0,
                      imageHeight: 32.0,
                      imageWidth: 32.0,
                      fontSize: 12.0,
                      category: category,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    }

    if (categoryState.isError) {
      return RefreshIndicator(
        onRefresh: () => ref.read(categoryViewModelProvider.notifier).fetchCategories(),
        color: Colors.blue,
        backgroundColor: Colors.white,
        strokeWidth: 2.0,
        displacement: 20.0,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - kToolbarHeight - MediaQuery.of(context).padding.top,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${categoryState.error.toString()}',
                    style: GoogleFonts.montserrat(fontSize: 16, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.read(categoryViewModelProvider.notifier).fetchCategories(),
                    child: Text(
                      'Retry',
                      style: GoogleFonts.montserrat(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return const Center(child: CircularProgressIndicator());
  }
}