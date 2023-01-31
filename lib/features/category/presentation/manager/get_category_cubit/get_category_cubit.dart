import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/product_model.dart';
import '../../services/category_service.dart';

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
