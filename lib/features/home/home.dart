import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/home/widgets/bnb_item.dart';

import '../../assets/icons.dart';
import 'bloc/nbn_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController homePageController;

  var index = 1;

  @override
  void initState() {
    homePageController = PageController(keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NbnBloc(),
      child: BlocBuilder<NbnBloc, NbnState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
                children: [
                  Expanded(
                    child:
                    IndexedStack(
                      index: index,
                      children: const [

                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                    decoration: BoxDecoration(
                      color: context.colors.bnbColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:
                        [
                          NbnItem(
                              index: 0,
                              icon: AppIcons.tasks,
                              title: context.localization.tasks,
                              onTap: () {
                                index = 0;
                                context.read<NbnBloc>().add(IsActiveColor(index: 0, isActive: true));
                              }),
                          NbnItem(
                              index: 1,
                              icon: AppIcons.expense,
                              title: context.localization.expense,
                              onTap: () {
                                index = 1;
                                context.read<NbnBloc>().add(IsActiveColor(index: 1, isActive: true));
                              }),
                          NbnItem(
                              index: 2,
                              icon: AppIcons.expense,
                              title: context.localization.create,
                              onTap: () {
                                index = 2;
                                context.read<NbnBloc>().add(IsActiveColor(index: 2, isActive: true));
                              }),
                          NbnItem(
                              index: 3,
                              icon: AppIcons.calendar,
                              title: context.localization.calendar,
                              onTap: () {
                                index = 3;
                                context.read<NbnBloc>().add(IsActiveColor(index: 3, isActive: true));
                              }),
                          NbnItem(
                              index: 4,
                              icon: AppIcons.stats,
                              title: context.localization.stats,
                              onTap: () {
                                index = 4;
                                context.read<NbnBloc>().add(IsActiveColor(index: 4, isActive: true));
                              }),
                        ]
                    ),
                  ),
                ]
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    homePageController.dispose();
    super.dispose();
  }
}
