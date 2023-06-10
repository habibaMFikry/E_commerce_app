import 'package:store_app/features/home/data/models/product_model.dart';
import '../../../../core/utils/api.dart';

class CategoryService {
  Future<List<ProductModel>> getCategory({required String categoryName}) async {
    List<dynamic> data =
        await Api().get(endPoint: 'products/category/$categoryName');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
