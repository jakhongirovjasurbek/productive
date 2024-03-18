import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/images.dart';
import 'package:productive/core/extensions/extensions.dart';
import '../widgets/drawer_widget.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      backgroundColor: context.colors.onBoardingColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 238,
              top: 67,
              right: 18,
            ),
            child: SvgPicture.asset(context.icons.sun),
          ),
          ListTile(
            leading: CircleAvatar(
                radius: 25, backgroundImage: AssetImage(AppImages.d)),
            title: Text('Rozan',
                style: TextStyle(
                  color: context.colors.whiteLabel,
                  fontSize: 20,
                  fontFamily: 'Barlow',
                  fontWeight: FontWeight.w700,
                )),
            subtitle: Text('rozan.hasan.matar115@gmail...',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Barlow',
                    fontWeight: FontWeight.w400,
                    color: context.colors.whiteLabel)),
          ),

          const SizedBox(height: 12),

          /// Premium button
          DrawerWidget(
            onTap: () {},
            icon: context.icons.premiumTask,
            title: 'Premium',
            color: context.colors.whiteLabel,
          ),
          const Gap(20),

          /// Settings button
          DrawerWidget(
            onTap: () {},
            icon: context.icons.settingsTask,
            title: 'Settings',
            color: context.colors.whiteLabel,
          ),
          const Gap(28),

          /// Articles button
          DrawerWidget(
              onTap: () {},
              icon: context.icons.articles,
              title: 'Articles',
              color: context.colors.whiteLabel),
          const Gap(16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: WDivider(),
          ),
          const Gap(16),

          /// Help button
          DrawerWidget(
              onTap: () {},
              icon: context.icons.help,
              title: 'Help',
              color: context.colors.whiteLabel),
          const Gap(24),

          /// Terms button
          DrawerWidget(
              onTap: () {},
              icon: context.icons.terms,
              title: 'Terms',
              color: context.colors.whiteLabel),
          const Gap(24),

          /// FAQ button
          DrawerWidget(
              onTap: () {},
              icon: context.icons.faq,
              title: 'FAQ',
              color: context.colors.whiteLabel),
        ],
      ),
    );
  }
}
