import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/cubits/all_categories/all_categories_cubit.dart';
import 'package:store_app/cubits/cart/cart_cubit.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';
import 'package:store_app/simple_bloc_observer.dart';

import 'cubits/get_all_products_cubit/get_all_products_cubit.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetAllProductsCubit()),
        BlocProvider(create: (context) => AllCategoriesCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            routes: {
              HomeScreen.routeName: (context) => const HomeScreen(),
              // UpdteProductPage.routeName: (context) => UpdteProductPage(),
            },
            initialRoute: HomeScreen.routeName,
          );
        },
      ),
    );
  }
}
