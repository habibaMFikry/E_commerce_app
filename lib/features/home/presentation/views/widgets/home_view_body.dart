import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_app/features/home/presentation/views/widgets/product_item.dart';
import 'package:store_app/features/home/presentation/views/widgets/slide_show.dart';

import '../../../data/models/product_model.dart';
import '../../manager/get_all_products_cubit/get_all_products_cubit.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  void initState() {
    BlocProvider.of<GetAllProductsCubit>(context).getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SlideShow(),
          BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
            builder: (context, state) {
              List<ProductModel> products =
                  BlocProvider.of<GetAllProductsCubit>(context).products ?? [];
              if (state is GetAllProductsSuccess) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 70),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    clipBehavior: Clip.none,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 90,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) => ProductItem(
                      product: products[index],
                    ),
                  ),
                );
              }
              if (state is GetAllProductsFailure) {
                return Center(child: Text(state.errorMessage));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
