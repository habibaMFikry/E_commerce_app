import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../services/all_categories_service.dart';

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
