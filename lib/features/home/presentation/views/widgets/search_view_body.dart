import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/features/home/presentation/views/widgets/product_item.dart';

import '../cubits/get_all_products_cubit/get_all_products_cubit.dart';
import '../models/product_model.dart';

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({super.key});

  @override
  State<SearchScreenBody> createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.black),
      borderRadius: BorderRadius.circular(2.w),
    );
  }

  String? searchText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(right: 10, left: 10, top: 50, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: buildBorder(),
                    enabledBorder: buildBorder(),
                    focusedBorder: buildBorder(Colors.black),
                    labelText: 'Search',
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchText = value.toLowerCase();
                      BlocProvider.of<GetAllProductsCubit>(context)
                          .productSearch(searchText!);
                    });
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
          builder: (context, state) {
            List<ProductModel> results =
                BlocProvider.of<GetAllProductsCubit>(context).results ?? [];
            return searchText == null
                ? const Text('search for a product')
                : Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(top: 30),
                      itemCount: results.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 10),
                        child: ProductItem(
                          product: results[index],
                        ),
                      ),
                    ),
                  );
          },
        ),
      ],
    );
  }
}
