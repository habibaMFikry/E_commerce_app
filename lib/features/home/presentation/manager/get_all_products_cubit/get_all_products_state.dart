part of 'get_all_products_cubit.dart';

@immutable
abstract class GetAllProductsState {}

class GetAllProductsInitial extends GetAllProductsState {}

class GetAllProductsSuccess extends GetAllProductsState {}

class GetAllProductsloading extends GetAllProductsState {}

class GetAllProductsFailure extends GetAllProductsState {
  final String errorMessage;

  GetAllProductsFailure(this.errorMessage);
}
