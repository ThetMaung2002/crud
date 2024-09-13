// ignore_for_file: use_build_context_synchronously

import 'package:crud/src/constants/string.dart';
import 'package:crud/src/models/product_model.dart';
import 'package:crud/src/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateProductForm extends ConsumerStatefulWidget {
  const CreateProductForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateProductFormState();
}

class _CreateProductFormState extends ConsumerState<CreateProductForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 24,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: kProductName),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return kEnterProductName;
                }
                return null;
              },
            ),
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: kProductPrice),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return kEnterProductPrice;
                }
                if (double.tryParse(value) == null) {
                  return kEnterValidNumber;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            if (_isLoading) const CircularProgressIndicator(),
            if (!_isLoading)
              FilledButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _isLoading = true;
                    });

                    // Create the product using the form data
                    final newProduct = ProductModel(
                      name: _nameController.text,
                      price: double.parse(_priceController.text),
                    );

                    try {
                      // Use Riverpod to create the product
                      await ref.read(productCreateProvider)(newProduct);
                      ref.invalidate(productListProvider);
                      // Close the BottomSheet after successful creation
                      Navigator.pop(context);
                    } catch (e) {
                      // Handle error if necessary
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$kErrorCreatingProduct: $e')),
                      );
                    } finally {
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  }
                },
                child: const Text(kCreateProduct),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
