import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/services/all_categories_service.dart';

part 'all_categories_state.dart';

class AllCategoriesCubit extends Cubit<AllCategoriesState> {
  AllCategoriesCubit() : super(AllCategoriesInitial());

  List<dynamic>? categories;

  Future<void> allCategories() async {
    emit(AllCategoriesLoading());
    try {
      categories = await AllCategoriesService().getAllCategories();
      emit(AllCategoriesSuccess());
    } catch (e) {
      emit(AllCategoriesFailure(e.toString()));
    }
  }
}
