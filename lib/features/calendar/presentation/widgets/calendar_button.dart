import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CalendarButton extends StatelessWidget {
  const CalendarButton({
    super.key,
    required this.onTap,
    required this.assetName,
  });
  final VoidCallback onTap;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector( 
      onTap: onTap,
      child: SizedBox(
        
        width: 36,
        height: 36,
        child: SvgPicture.asset(assetName),
      ),
    );
  }
}
