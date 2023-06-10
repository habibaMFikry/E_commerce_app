import 'package:flutter/material.dart';

import 'package:store_app/features/home/presentation/views/widgets/search_view_body.dart';

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
