part of 'get_category_cubit.dart';

@immutable
abstract class GetCategoryState {}

class GetCategoryInitial extends GetCategoryState {}

class GetCategoryLoading extends GetCategoryState {}

class GetCategorySuccess extends GetCategoryState {}

class GetCategoryFailure extends GetCategoryState {
  final String errorMessage;

  GetCategoryFailure(this.errorMessage);
}
