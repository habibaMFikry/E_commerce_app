import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/screens/home_screen.dart';

import 'package:store_app/widgets/category_screen_body.dart';
import 'package:store_app/widgets/home_icons.dart';
import '../cubits/get_category/get_category_cubit.dart';
import 'app_drawer.dart';

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
            HomeIcons(),
          ],
        ),
        drawer: AppDrawer(),
        body: Padding(
          padding: EdgeInsets.only(right: 1.h, left: 1.h, bottom: 1.h),
          child: CategoryScreenBody(categoryTitle: categoryTitle),
        ),
      ),
    );
  }
}
