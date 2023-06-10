import '../../../../core/utils/api.dart';
import '../models/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct(
      {required int id,
      required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await Api().put(
        endPoint: 'products/$id',
        body: {
          'title': title,
          'price': price,
          'description': desc,
          'image': image,
          'category': category,
        },
        token: '');
    return ProductModel.fromJson(data);
  }
}
