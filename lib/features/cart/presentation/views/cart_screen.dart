import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:store_app/widgets/cart_screen_body.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Your Cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 2.5.h, left: 2.5.h, bottom: 1.h),
        child: const CartScreenBody(),
      ),
    );
  }
}
