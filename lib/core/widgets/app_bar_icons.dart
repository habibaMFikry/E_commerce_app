import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/widgets/badge.dart' as badge;

import '../../features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import '../../features/cart/presentation/views/cart_screen.dart';
import '../../features/home/presentation/views/search_view.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({super.key});

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
            return badge.Badge(
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
