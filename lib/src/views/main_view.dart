import 'package:crud/src/constants/string.dart';
import 'package:crud/src/models/product_model.dart';
import 'package:crud/src/providers/product_provider.dart';
import 'package:crud/src/widgets/create_product_form.dart';
import 'package:crud/src/widgets/slidable_listtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productListAsync = ref.watch(productListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(kTitle),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(productListProvider.future),
        child: productListAsync.when(
          data: (products) => ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return SlidableListtile(
                subtitle: '$kPrice: \$${product.price}',
                title: product.name,
                delete: (_) {
                  ref.read(productDeleteProvider(product.id!));
                  ref.invalidate(productListProvider);
                },
                update: (_) {
                  _showUpdateDialog(context, ref, product);
                },
              );
            },
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) {
            return Center(
              child: Text('$kError: $error'),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateProductSheet(context, ref);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showUpdateDialog(
      BuildContext context, WidgetRef ref, ProductModel product) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController nameController =
        TextEditingController(text: product.name);
    final TextEditingController priceController =
        TextEditingController(text: product.price.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(kUpdate),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: kName),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return kPleaseEnterAName;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: kPrice),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return kPleaseEnterAPrice;
                    }
                    try {
                      double.parse(value);
                    } catch (e) {
                      return kInvalidPrice;
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(kCancel),
            ),
            TextButton(
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;

                final updatedProduct = ProductModel(
                  id: product.id,
                  name: nameController.text,
                  price: double.parse(priceController.text),
                );

                await ref.read(productUpdateProvider(updatedProduct).future);

                ref.invalidate(productListProvider);

                Navigator.pop(context);
              },
              child: const Text(kUpdate),
            ),
          ],
        );
      },
    );
  }

  void _showCreateProductSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 24,
          ),
          child: const CreateProductForm(),
        );
      },
    );
  }
}
