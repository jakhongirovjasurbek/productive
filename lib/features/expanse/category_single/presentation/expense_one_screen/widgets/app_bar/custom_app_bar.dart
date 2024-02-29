import 'package:flutter/material.dart';
import 'package:productive/assets/colors.dart';
import 'package:productive/core/extensions/extensions.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 29,
      automaticallyImplyLeading: false,
      backgroundColor: context.colors.bacgroundColor,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  _getStyle() {
    switch (styleType) {
      case Style.bgFill:
        return Container(
          height: 2,
          width: 289,
          margin: EdgeInsets.fromLTRB(62, 38, 24, 5),
          decoration: BoxDecoration(
            color: AppColors.blueGray90090,
            borderRadius: BorderRadius.circular(
              1,
            ),
          ),
        );
      default:
        return null;
    }
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}

enum Style {
  bgFill,
}
