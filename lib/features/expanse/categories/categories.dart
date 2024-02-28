import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive/core/extensions/extensions.dart';

import '../../../assets/icons.dart';


class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: context.colors.mainDark,
      appBar: AppBar(
        backgroundColor: context.colors.mainDark,
        title: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Categories",style: TextStyle(color: Colors.white),),
              SizedBox(width: 90),
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.add,color: Colors.white,),
              ),
            ],
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: 5,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          List<String> money = ["150","20","100","100","0"];
          List<String> texts = ["Food", "Shopping", "Gift", "Transport", "-"];
          List<String> icons = [
            AppIcons.expanse_categories_food,
            AppIcons.expanse_categories_shopping,
            AppIcons.expanse_categories_gift,
            AppIcons.expanse_categories_transport,
            AppIcons.expanse_categories_add,
          ];
          List<String> icons2 = [
            AppIcons.expanse_categories2_food,
            AppIcons.expanse_categories2_shopping,
            AppIcons.expanse_categories2_gift,
            AppIcons.expanse_categories2_transport,
            AppIcons.expanse_categories2_add,
          ];

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
                          icons[index],
                          height: index == 4 ? 38 : 38,
                          width: index == 4 ? 38 : 38,
                        ),
                        Text(texts[index], style: TextStyle(color: Colors.white)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('\$', style: TextStyle(color: Colors.white)),
                            Text(money[index], style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        SizedBox(height: 1),
                        SvgPicture.asset(
                          icons2[index],
                          height: 30,
                        ),
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
  }
}
