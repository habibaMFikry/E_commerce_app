import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/cubits/cart/cart_cubit.dart';
import 'package:store_app/models/cart_model.dart';
import 'package:store_app/widgets/delete_dialog.dart';

class CartItem extends StatelessWidget {
  final CartModel cartModel;
  final dynamic productId;

  const CartItem({super.key, required this.cartModel, this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Dismissible(
          key: ValueKey(cartModel.id),
          background: Container(
            color: Theme.of(context).errorColor,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 2.h),
            margin: EdgeInsets.all(1.h),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 30,
            ),
          ),
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) {
            return showDialog(
              context: context,
              builder: (ctx) => const DeleteDialog(),
            );
          },
          onDismissed: (direction) {
            BlocProvider.of<CartCubit>(context).removeItem(productId);
          },
          child: Card(
            elevation: 15,
            margin: EdgeInsets.symmetric(
              //horizontal: 15,
              vertical: 0.75.h,
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 8.w,
                child: Image.network(cartModel.image),
              ),
              title: Text(
                cartModel.title,
                maxLines: 1,
              ),
              subtitle: Text(
                'Total: \$${(cartModel.price * cartModel.quantity).toStringAsFixed(2)}',
                style: TextStyle(fontSize: 10.sp),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context).addOrRemoveQuantity(
                          productId, false, cartModel.quantity);
                    },
                    icon: const Icon(Icons.remove, color: Colors.black),
                  ),
                  Text('${cartModel.quantity} x'),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<CartCubit>(context).addOrRemoveQuantity(
                          productId, true, cartModel.quantity);
                    },
                    icon: const Icon(Icons.add, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
