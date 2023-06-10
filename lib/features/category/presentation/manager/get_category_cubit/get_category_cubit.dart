import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/data/models/product_model.dart';
import '../../../data/services/category_service.dart';

part 'get_category_state.dart';

class GetCategoryCubit extends Cubit<GetCategoryState> {
  GetCategoryCubit() : super(GetCategoryInitial());

  List<ProductModel>? products;

  Future<void> getCategory(String categoryName) async {
    emit(GetCategoryLoading());
    try {
      products =
          await CategoryService().getCategory(categoryName: categoryName);
      emit(GetCategorySuccess());
    } catch (e) {
      emit(GetCategoryFailure(e.toString()));
    }
  }
}
