import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/core/extensions/extensions.dart';

import '../../../../core/widgets/w_button.dart';

class SocialMediaLoginButton extends StatelessWidget {
  final Function() onTap;
  final String icon;
  const SocialMediaLoginButton({
    required this.onTap,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WButton(
      borderRadius: 12,
      color: context.colors.loginTextFieldBackgroundColor,
      width: (MediaQuery.of(context).size.width/100) *18.2,
      height: ( MediaQuery.of(context).size.height/100 ) * 6,
      onTap: onTap,
      child: SvgPicture.asset(icon),
    );
  }
}
