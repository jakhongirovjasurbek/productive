import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';

class RowBottom extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String icon;
  const RowBottom({
    required this.icon,
    required this.onTap,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(icon),
          const Gap(8),
          Text(title,style: context.style.fontSize14Weight400grey,),
        ],
      ),
    );
  }
}
