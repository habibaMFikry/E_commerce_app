import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/widgets/badge.dart';

import '../cubits/cart/cart_cubit.dart';
import '../screens/cart_screen.dart';
import '../screens/search_screen.dart';

class HomeIcons extends StatelessWidget {
  const HomeIcons({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = BlocProvider.of<CartCubit>(context);
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SearchPage(),
              ),
            );
          },
          icon: const Icon(
            Icons.search,
          ),
        ),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Badge(
              value: cart.itemCount.toString(),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
