import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/data/product.dart';
import 'package:mobile/providers.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/validators.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _lbsController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedCategoryId;
  List<File> _selectedImages = [];
  final _imagePicker = ImagePicker();

  Future<void> _pickImage() async {
    if (_selectedImages.length >= 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Maximum of 5 images allowed'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _lbsController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Groceries',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final categoryState = ref.watch(categoryViewModelProvider);
          if (categoryState.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (categoryState.isError) {
            return Center(child: Text('Error: ${categoryState.error}'));
          }
          final categories = categoryState.data ?? [];

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 17),
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 20.0,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: "Enter product name...",
                      ),
                      validator:
                          (value) => validateRequired(value, 'Product name'),
                    ),
                    Row(
                      spacing: 20.0,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _priceController,
                            decoration: InputDecoration(
                              hintText: "Enter product price ...",
                            ),
                            keyboardType: TextInputType.number,
                            validator:
                                (value) => validateNumber(value, 'Price'),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _lbsController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Enter product lbs ...",
                            ),
                            validator: (value) => validateNumber(value, 'Lbs'),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        hintText: "Enter product description...",
                      ),
                      keyboardType: TextInputType.multiline,
                      minLines: 4,
                      maxLines: 4,
                      validator:
                          (value) => validateRequired(value, 'Description'),
                    ),
                    DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      isExpanded: false,
                      value: _selectedCategoryId,
                      hint: const Text('Select category'),
                      items:
                          categories.map((category) {
                            return DropdownMenuItem<String>(
                              value: category.id,
                              child: Text(category.name),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategoryId = value;
                        });
                      },
                      validator: (value) => validateCategory(value),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_selectedImages.isNotEmpty)
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _selectedImages.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(
                                          _selectedImages[index],
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap:
                                              () => setState(
                                                () => _selectedImages.removeAt(
                                                  index,
                                                ),
                                              ),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image,
                                    size: 40,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Tap to upload images (maximum 5)",
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 57,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final imagesValidation = validateImages(_selectedImages);
                            if (imagesValidation != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(imagesValidation),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            final product = ProductRequest(
                              name: _nameController.text,
                              price: double.parse(_priceController.text),
                              lbs: double.parse(_lbsController.text),
                              description: _descriptionController.text,
                              categoryId: _selectedCategoryId!,
                            );


                            try {
                              await ref
                                  .read(productViewModelProvider.notifier)
                                  .createProduct(product, _selectedImages);

                              // Show success message and pop screen
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Product created successfully'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.pop(context);
                            } catch (e) {
                              // Show error message
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Error: $e'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            DColors.primaryGreen,
                          ),
                        ),
                        child: const Text("Submit"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
