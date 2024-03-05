import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../../../assets/icons.dart';
import '../../data/model/category_model.dart';
part 'bloc_categories_event.dart';
part 'bloc_categories_state.dart';


class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoryLoaded([])) {
    on<LoadCategories>(_onLoadCategories);
  }
  void _onLoadCategories(LoadCategories event, Emitter<CategoriesState> emit) {
    List<Category> categories = [
      Category(name: "Food", icon: AppIcons.expanse_categories_food, icon2: AppIcons.expanse_categories_food2, amount: "150"),
      Category(name: "Shopping", icon: AppIcons.expanse_categories_shopping, icon2: AppIcons.expanse_categories_shopping2, amount: "20"),
      Category(name: "Gift", icon: AppIcons.expanse_categories_gift, icon2: AppIcons.expanse_categories_gift2, amount: "100"),
      Category(name: "Transport", icon: AppIcons.expanse_categories_transport, icon2: AppIcons.expanse_categories_transport2, amount: "100"),
      Category(name: "-", icon: AppIcons.expanse_categories_add, icon2: AppIcons.expanse_categories_add2, amount: "0"),
    ];
    emit(CategoryLoaded(categories));
  }
  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {}
}


