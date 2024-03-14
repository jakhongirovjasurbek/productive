import 'package:flutter/material.dart';
import 'package:productive/core/extensions/extensions.dart';

class ContainerIcon extends StatelessWidget {
  final Color color;
  const ContainerIcon({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22.5),
      ),
    );
  }
}
