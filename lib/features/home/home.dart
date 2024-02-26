import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/features/home/bloc/nbn_bloc.dart';
import 'package:productive/features/home/widgets/bnb_item.dart';

import '../../assets/icons.dart';

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
      appBar: AppBar(
        title: const Text('main route'),
      ),
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
            decoration: const BoxDecoration(
              color: Color(0XFF1C1E2D),
              borderRadius: BorderRadius.only(
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
                      title: "Tasks",
                      onTap: () {
                        index = 0;
                        context.read<NbnBloc>().add(IsActiveColor(index: 0, isActive: true));
                      }),
                  NbnItem(
                      index: 1,
                      icon: AppIcons.expense,
                      title: "Expense",
                      onTap: () {
                        index = 1;
                        context.read<NbnBloc>().add(IsActiveColor(index: 1, isActive: true));
                      }),
                  NbnItem(
                      index: 2,
                      icon: AppIcons.create,
                      title: "Create",
                      onTap: () {
                        index = 2;
                        context.read<NbnBloc>().add(IsActiveColor(index: 2, isActive: true));
                      }),
                  NbnItem(
                      index: 3,
                      icon: AppIcons.calendar,
                      title: "Calendar",
                      onTap: () {
                        index = 3;
                        context.read<NbnBloc>().add(IsActiveColor(index: 3, isActive: true));
                      }),
                  NbnItem(
                      index: 4,
                      icon: AppIcons.stats,
                      title: "Stats",
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
