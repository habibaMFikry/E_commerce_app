import 'package:flutter/material.dart';
import 'package:store_app/models/cart_model.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/product_detail_screen_bbody.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetailScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          // productModel.title,
          productModel.title.substring(0, 10),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: ProductDetailScreenBody(productModel: productModel),
    );
  }
}
