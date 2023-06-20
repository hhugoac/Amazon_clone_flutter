import 'package:ecommerce_clone/feature/admin/screen/add_product_screen.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'Products',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddProduct,
        child: const Icon(
          Icons.add,
        ),
        tooltip: 'Add a product',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
