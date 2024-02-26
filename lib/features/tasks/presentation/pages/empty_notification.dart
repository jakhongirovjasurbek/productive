
import 'package:flutter/material.dart';
import 'package:productive/core/extensions/extensions.dart';

import '../../../../assets/app_route_names.dart';

class EmptyNotificationPage extends StatelessWidget {
  const EmptyNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.mainDark,
        elevation: 0,
        title: IconButton(
          icon:Icon(Icons.arrow_back_ios_new),
          color: context.colors.white, onPressed: () {
          Navigator.pushReplacementNamed(context, AppRouteNames.notification);
        },
        ),
        actions: [
          Text(
            "Notifications",
            style: context.style.fontSize24Weight700,
          ),
          const SizedBox(width: 130,)
        ],
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 270,),
          Center(child: Text("NO NOTIFICATION YET",style: context.style.fontSize20Weight500,)),

        ],
      ),
    );
  }
}
