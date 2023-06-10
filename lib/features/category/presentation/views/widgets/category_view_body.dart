import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../home/data/models/product_model.dart';
import '../../../../home/presentation/views/widgets/product_item.dart';
import '../../manager/get_category_cubit/get_category_cubit.dart';

class CategoryScreenBody extends StatefulWidget {
  const CategoryScreenBody({super.key, required this.categoryTitle});

  final String categoryTitle;

  @override
  State<CategoryScreenBody> createState() => _CategoryScreenBodyState();
}

class _CategoryScreenBodyState extends State<CategoryScreenBody> {
  @override
  void initState() {
    BlocProvider.of<GetCategoryCubit>(context)
        .getCategory(widget.categoryTitle);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoryCubit, GetCategoryState>(
      builder: (context, state) {
        List<ProductModel> products =
            BlocProvider.of<GetCategoryCubit>(context).products ?? [];

        if (state is GetCategorySuccess) {
          return Padding(
            padding: EdgeInsets.only(left: 1.h, right: 1.h, top: 8.h),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
        if (state is GetCategoryFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
