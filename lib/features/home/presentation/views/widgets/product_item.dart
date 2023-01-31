import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/cubits/cart/cart_cubit.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final cart = BlocProvider.of<CartCubit>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              productModel: product,
            ),
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 50,
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 20,
                  offset: const Offset(10, 10),
                ),
              ],
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 1.h, left: 1.h, top: 1.h),
                    child: Text(
                      //maxLines: 1,
                      //overflow: TextOverflow.ellipsis,
                      product.title.substring(0, 10),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 1.h),
                        child: Text(
                          '\$${product.price.toString()}',
                          style: TextStyle(
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          BlocProvider.of<CartCubit>(context).addItem(
                              product.id,
                              product.price,
                              product.title,
                              product.image);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Added item to cart'),
                              duration: const Duration(seconds: 3),
                              action: SnackBarAction(
                                label: 'UNDO',
                                onPressed: () {
                                  cart.removeSingleItem(product.id);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                      'Item was removed',
                                      textAlign: TextAlign.center,
                                    ),
                                    duration: Duration(seconds: 2),
                                  ));
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 32,
            top: -60,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );

    /*GestureDetector(
      onTap: () {
        /*Navigator.pushNamed(context, UpdteProductPage.routeName,
            arguments: product);*/
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: const Offset(10, 10),
              ),
            ],
          ),
          /* height: 240,
          width: 200,*/
          child: Card(
            shape: RoundedRectangleBorder(
              //side: const BorderSide(color: Colors.teal),
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 125,
                    child: Image.network(
                      product.image,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.title.substring(0, 6),
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price.toString()}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      /*IconButton(
                        onPressed: () {
                          /*cart.addItem(product.id, product.price, product.title,
                              product.image);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Added item to cart!',
                              ),
                              duration: Duration(seconds: 2),
                              action: SnackBarAction(
                                label: 'UNDO',
                                onPressed: () {
                                  cart.removeSingleItem(product.id);
                                },
                              ),
                            ),
                          );*/
                        },
                        icon: Icon(Icons.add),
                      ),*/
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );*/
  }
}
