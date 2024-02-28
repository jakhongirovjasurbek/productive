import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive/core/extensions/extensions.dart';
import '../../../../../assets/icons.dart';
import '../bloc/bloc_categories_bloc.dart';



class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryState();
}


class _CategoryState extends State<CategoryPage> {
  late final CategoryBloc _categoryBloc = CategoryBloc()..add(LoadCategories());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      bloc: _categoryBloc,
      builder: (context, state) {
        if (state is CategoryLoaded) {
          return Scaffold(
            backgroundColor: context.colors.mainDark,
            appBar: AppBar(
              backgroundColor: context.colors.mainDark,
              title: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(context.localization.categories_appbar, style: context.style.fontSize24Weight700),
                    SizedBox(width: 90),
                    Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: SvgPicture.asset(AppIcons.expanse_categories_search),
                    ),
                  ],
                ),
              ),
            ),
            body: GridView.builder(
              itemCount: state.categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                var category = state.categories[index];
                return Center(
                  child: Container(
                    height: 130,
                    width: 150,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 19),
                          child: Container(
                            width: 150,
                            height: 111,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: context.colors.loginTextFieldBackgroundColor,
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                category.icon,
                                height: index == 4 ? 38 : 38,
                                width: index == 4 ? 38 : 38,
                              ),
                              Text(category.name, style: context.style.fontSize16Weight500),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('\$', style: context.style.fontSize16Weight500, selectionColor: context.colors.white),
                                  Text(category.amount, style: context.style.fontSize16Weight500, selectionColor: context.colors.white),
                                ],
                              ),
                              SizedBox(height: 1),
                              SvgPicture.asset(category.icon2, height: 44,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          // Handle other states
          return Container();
        }
      },
    );
  }

  @override
  void dispose() {
    _categoryBloc.close();
    super.dispose();
  }
}
