import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:store_app/screens/app_drawer.dart';
import 'package:store_app/widgets/home_icons.dart';
import 'package:store_app/widgets/home_screen_body.dart';

import '../cubits/cart/cart_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          HomeIcons(),
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: EdgeInsets.only(right: 1.h, left: 1.h, bottom: 1.h),
        child: const HomeScreenBody(),
      ),
    );
  }
}
