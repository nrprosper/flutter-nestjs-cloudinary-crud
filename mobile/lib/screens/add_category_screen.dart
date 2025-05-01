import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/data/category.dart';
import 'package:mobile/providers.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/validators.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? _selectedImage;
  final _imagePicker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Category',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final categoryState = ref.watch(categoryViewModelProvider);
          if (categoryState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

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
                        hintText: "Enter category name...",
                      ),
                      validator: (value) => validateRequired(value, 'Category name'),
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        hintText: "Enter category description...",
                      ),
                      keyboardType: TextInputType.multiline,
                      minLines: 4,
                      maxLines: 4,
                      validator: (value) => validateRequired(value, 'Description'),
                    ),
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey),
                        ),
                        height: 150,
                        width: double.infinity,
                        child:
                            _selectedImage == null
                                ? Center(
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
                                        "Tap to upload image",
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                : ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.file(
                                    _selectedImage!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 150,
                                  ),
                                ),
                      ),
                    ),
                    SizedBox(
                      height: 57,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (_selectedImage == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please select an image'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            final category = CategoryRequest(
                              name: _nameController.text,
                              description: _descriptionController.text,
                            );

                            try {
                              await ref
                                  .read(categoryViewModelProvider.notifier)
                                  .createCategory(category, _selectedImage!);

                              // Show success message and pop screen
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Category created successfully',
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.of(context).pop();
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
                        child: Text("Submit"),
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
