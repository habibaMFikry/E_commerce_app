import 'package:flutter/material.dart';
import 'package:store_app/screens/category_screen.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.categoryTitle});

  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.shop,
            color: Colors.black,
          ),
          title: Text(categoryTitle),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  CategoriesScreen(categoryTitle: categoryTitle),
            ));
          },
        ),
        const Divider(
          color: Colors.black,
          height: 0,
          thickness: 1,
        )
      ],
    );
  }
}
