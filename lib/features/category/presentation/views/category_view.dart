import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/features/category/presentation/views/widgets/category_view_body.dart';
import 'package:store_app/core/widgets/app_bar_icons.dart';

import '../../../../core/widgets/app_drawer.dart';
import '../manager/get_category_cubit/get_category_cubit.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.categoryTitle});

  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCategoryCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          /* leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              }),*/
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            categoryTitle,
            style: const TextStyle(color: Colors.black),
          ),
          actions: const [
            AppBarIcons(),
          ],
        ),
        drawer: const AppDrawer(),
        body: Padding(
          padding: EdgeInsets.only(right: 1.h, left: 1.h, bottom: 1.h),
          child: CategoryScreenBody(categoryTitle: categoryTitle),
        ),
      ),
    );
  }
}
