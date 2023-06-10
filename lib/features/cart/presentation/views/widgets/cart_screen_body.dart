import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../manager/cart_cubit/cart_cubit.dart';
import 'cart_item.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = BlocProvider.of<CartCubit>(context).items;
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            Card(
              color: Colors.black12,
              child: Padding(
                padding: EdgeInsets.all(1.h),
                child: Row(
                  children: [
                    Text(
                      'Total:  ',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    Text(
                      '\$${cartCubit.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.sp),
                    ),
                    //Spacer(),
                    /*Chip(
                          label: Text(
                          '$${cart.totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        backgroundColor:Theme.of(context).primaryColor
                        )
                        */
                  ],
                ),
              ),
            ),
            SizedBox(height: 1.h),
            const Divider(
              height: 0,
              color: Colors.black,
              thickness: 1.5,
              indent: 8,
              endIndent: 8,
            ),
            SizedBox(height: 1.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: cart.length,
                itemBuilder: (ctx, i) => CartItem(
                  cartModel: cart.values.toList()[i],
                  productId: cart.keys.toList()[i],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
