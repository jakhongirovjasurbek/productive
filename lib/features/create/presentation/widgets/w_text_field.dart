import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productive/core/extensions/extensions.dart';

class WTextField extends StatelessWidget {
  InputDecoration? decoration;
      Function(String a) onChange;
  TextStyle? style;
  TextInputType? keyboardType;
  int? maxLines;
  WTextField({super.key,this.style,required this.onChange,this.decoration,this.keyboardType,this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextField(

      focusNode: FocusNode(),
      decoration: decoration ??
          InputDecoration(
            hintText: context.localization.new_title,
            hintStyle: context.style.fontSize18Weight500.copyWith(color: context.colors.createTaskTime),
          ),
      style: style ?? context.style.fontSize18Weight500.copyWith(color: context.colors.createTaskTime),
      onChanged: (value) {
        onChange(value);
      },
      keyboardType: keyboardType ?? TextInputType.text,
      maxLines: maxLines ?? 1,

    );
  }
}
