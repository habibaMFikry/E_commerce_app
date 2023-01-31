import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/product_model.dart';
import '../../services/all_products_service.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit() : super(GetAllProductsInitial());

  List<ProductModel>? products;
  List<ProductModel>? results;

  Future<void> getAllProducts() async {
    emit(GetAllProductsloading());
    try {
      products = await AllProductsService().getAllProducts();
      emit(GetAllProductsSuccess());
    } catch (e) {
      emit(GetAllProductsFailure(e.toString()));
    }
  }

  Future<List<ProductModel>?> productSearch(String searchText) async {
    results = /*(searchText == '')
        ? products = await AllProductsService().getAllProducts()
        : */
        products!
            .where(
              (c) => c.title.toLowerCase().contains(searchText),
            )
            .toList();
    return results;
  }
}
