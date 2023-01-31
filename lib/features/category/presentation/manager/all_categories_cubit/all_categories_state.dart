part of 'all_categories_cubit.dart';

@immutable
abstract class AllCategoriesState {}

class AllCategoriesInitial extends AllCategoriesState {}

class AllCategoriesLoading extends AllCategoriesState {}

class AllCategoriesSuccess extends AllCategoriesState {}

class AllCategoriesFailure extends AllCategoriesState {
  final String errorMessage;

  AllCategoriesFailure(this.errorMessage);
}
