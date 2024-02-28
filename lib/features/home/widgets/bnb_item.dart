import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive/core/extensions/extensions.dart';

import '../bloc/bnb_bloc.dart';

class BnbItem extends StatelessWidget {
  final int index;
  final String icon;
  final String title;
  final Function() onTap;

  const BnbItem({
    Key? key,
    required this.index,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: BlocBuilder<BnbBloc, BnbState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 13.5),
              index == 2 ? Icon(Icons.add_circle_outlined,size: 32,
                color: index == state.activeIndex ? context.colors.skipButtonColor : context.colors.white,):
              SvgPicture.asset(
                icon,width: 28,height: 28,
                color: index == state.activeIndex ? context.colors.skipButtonColor  : null,
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: context.style.fontSize12Weight500.copyWith(color:
                index == state.activeIndex
                        ? context.colors.skipButtonColor
                        : context.colors.white,
                ),
              ),
              const SizedBox(height: 10.5),
            ],
          );
        },
      ),
    );
  }
}
