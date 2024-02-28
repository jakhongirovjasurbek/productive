part of 'bloc_categories_bloc.dart';


abstract class CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;
  CategoryLoaded(this.categories);
}