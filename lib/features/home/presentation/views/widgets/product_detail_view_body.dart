import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_app/features/home/data/models/product_model.dart';
import '../../../../cart/presentation/manager/cart_cubit/cart_cubit.dart';

class ProductDetailScreenBody extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetailScreenBody({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    final cart = BlocProvider.of<CartCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: SizedBox(
              height: 250,
              width: 300,
              child: Center(
                child: Image.network(productModel.image),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 300,
              child: Text(
                textAlign: TextAlign.center,
                productModel.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 2,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price: \$${productModel.price.toString()}'),
              Column(
                children: [
                  Text(
                    'Rating: ${productModel.rating!.rate.toString()}',
                  ),
                  Text(
                    'Count: ${productModel.rating!.count.toString()}',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(productModel.description),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(20),
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            label: const Text(
              'Add to your cart',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {
              BlocProvider.of<CartCubit>(context).addItem(
                productModel.id,
                productModel.price,
                productModel.title,
                productModel.image,
              );
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Added item to cart'),
                  duration: const Duration(seconds: 3),
                  action: SnackBarAction(
                    label: 'UNDO',
                    //textColor: Colors.white,
                    onPressed: () {
                      cart.removeSingleItem(productModel.id);
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
