import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/all_categories/all_categories_cubit.dart';
import 'package:store_app/screens/home_screen.dart';
import 'package:store_app/widgets/drawer_item.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    BlocProvider.of<AllCategoriesCubit>(context).allCategories();
    super.initState();
  }

  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCategoriesCubit, AllCategoriesState>(
      builder: (context, state) {
        List? categoriesTitle =
            BlocProvider.of<AllCategoriesCubit>(context).categories ?? [];
        //states
        return Drawer(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  },
                  child: const Card(
                    elevation: 10,
                    child: ListTile(
                      title: Text('Home'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: _expanded ? 310 : 80,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _expanded = !_expanded;
                          });
                        },
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            title: const Text('Categories'),
                            trailing: Icon(_expanded
                                ? Icons.expand_less
                                : Icons.expand_more),
                          ),
                        ),
                      ),
                      const Divider(thickness: 2, height: 2),
                      SizedBox(
                        height: _expanded ? 225 : 0,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: categoriesTitle.length,
                          itemBuilder: (context, index) {
                            return DrawerItem(
                                categoryTitle: categoriesTitle[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
