import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/core/route_names/app_route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../assets/icons.dart';
import '../../features/authentication/presentation/bloc/auth_bloc.dart';
import '../injector/injector.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if(state.status == AuthenticationStatus.unauthenticated) {
          if(sl<SharedPreferences>().getBool("wizard") == true) {
            // Navigator.of(context)
            //     .pushNamedAndRemoveUntil(AppRouteNames.login, (_) => false);
          } else {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRouteNames.onboarding, (_) => false);
          }
        } else if(state.status == AuthenticationStatus.authenticated){
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRouteNames.home, (_) => false);
        }
      },
      builder: (context, state) {
        if(state.status == AuthenticationStatus.unknown) {
          Timer(const Duration(seconds: 3), (){
            context.read<AuthenticationBloc>().add(AuthenticationGetStatusEvent());
          });
        }
        return Scaffold(
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(40),
            child: const CupertinoActivityIndicator(
              radius: 16,
            ),
          ),
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 80),
            Center(
              child: SvgPicture.asset(AppIcons.logo),
            ),
            const SizedBox(height: 12),
            Text(
              context.localization.productive,
              style: context.style.fontSize40Weight700,
            ),
          ]),
        );
      },
    );
  }
}
