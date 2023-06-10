import 'package:store_app/features/home/data/models/product_model.dart';
import '../../../../core/utils/api.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data = await Api().get(endPoint: 'products', token: '');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
