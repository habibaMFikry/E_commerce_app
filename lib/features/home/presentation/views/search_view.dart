import 'package:flutter/material.dart';

import 'package:store_app/widgets/search_screen_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static const routeName = 'SearchPage';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchScreenBody(),
    );
  }
}
