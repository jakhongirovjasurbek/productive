part of 'bloc_categories_bloc.dart';


abstract class CategoriesState {}

class CategoryLoaded extends CategoriesState {
  final List<Category> categories;
  CategoryLoaded(this.categories);
}