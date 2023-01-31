import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/screens/category_screen.dart';

class SlideShow extends StatelessWidget {
  const SlideShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
          child: Text(
            'Categories',
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
        ImageSlideshow(
          height: 175,
          initialPage: 0,
          isLoop: true,
          autoPlayInterval: 4000,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const CategoriesScreen(categoryTitle: 'electronics'),
                  ),
                );
              },
              child: Image.network(
                'https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_.jpg',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const CategoriesScreen(categoryTitle: 'jewelery'),
                  ),
                );
              },
              child: Image.network(
                'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CategoriesScreen(
                        categoryTitle: 'men\'s clothing'),
                  ),
                );
              },
              child: Image.network(
                'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CategoriesScreen(
                        categoryTitle: 'women\'s clothing'),
                  ),
                );
              },
              child: Image.network(
                'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
