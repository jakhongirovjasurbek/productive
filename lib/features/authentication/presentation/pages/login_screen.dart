import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/core/widgets/w_scale.dart';

import '../../../../assets/icons.dart';
import '../../../../core/route_names/app_route_name.dart';
import '../../../../core/widgets/w_button.dart';
import '../../../../core/widgets/w_textfield.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/social.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoginDataValid = true;
  final mailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  final mailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();
  bool isObscure = false;

  @override
  void initState() {
    mailTextEditingController.addListener(() {
      if (formKey.currentState!.validate()) {
        if (!isLoginDataValid) {
          setState(() {
            isLoginDataValid = true;
          });
        }
      } else {
        if (isLoginDataValid) {
          setState(() {
            isLoginDataValid = false;
          });
        }
      }
    });

    passwordTextEditingController.addListener(() {
      if (formKey.currentState!.validate()) {
        if (!isLoginDataValid) {
          setState(() {
            isLoginDataValid = true;
          });
        }
      } else {
        if (isLoginDataValid) {
          setState(() {
            isLoginDataValid = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    mailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    mailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Builder(builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (FocusScope.of(context).hasFocus) {
                  FocusScope.of(context).unfocus();
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Gap(160),
                      SvgPicture.asset(AppIcons.logo),
                      const Gap(44),
                      WTextField(
                        controller: mailTextEditingController,
                        cursorColor: context.colors.onBordingSkip,
                        hintText: context.localization.email,
                        textStyle: context.style.fontSize14Weight400
                            .copyWith(color: context.colors.white),
                        hintTextStyle: context.style.fontSize14Weight400
                            .copyWith(
                                color: context.colors.hintextcolor
                                    .withOpacity(0.6)),
                      ),
                      const Gap(16),
                      WTextField(
                        controller: passwordTextEditingController,
                        focusNode: passwordFocusNode,
                        keyBoardType: TextInputType.visiblePassword,
                        suffix: GestureDetector(
                          onTap: () {
                            isObscure = !isObscure;
                            setState(() {});
                          },
                          child: SvgPicture.asset(
                            isObscure ? AppIcons.eye_off : AppIcons.eye_on,
                          ),
                        ),
                        cursorColor: context.colors.onBordingSkip,
                        textStyle: context.style.fontSize14Weight400
                            .copyWith(color: context.colors.white),
                        hintText: context.localization.password,
                        hintTextStyle: context.style.fontSize14Weight400
                            .copyWith(
                                color: context.colors.hintextcolor
                                    .withOpacity(0.6)),
                        isObscureText: isObscure,
                      ),
                      const Gap(12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRouteNames.forgot_password);
                          },
                          child: Text(context.localization.forgot_password,
                              style: context.style.fontSize14Weight500.copyWith(
                                  color: context.colors.onBordingSkip)),
                        ),
                      ),
                      const Gap(16),
                      WScaleAnimation(
                        isDisabled: !isLoginDataValid,
                        onTap: () {},
                        child: WButton(
                          width: (MediaQuery.of(context).size.width/100)*95,
                          height:(MediaQuery.of(context).size.height /100)*6 ,
                          borderRadius: 12,
                          disabled: !isLoginDataValid,
                          onTap: () async {
                            context.read<AuthenticationBloc>().add(
                                  AuthenticationLoginRequestEvent(
                                    email:
                                        mailTextEditingController.text.trim(),
                                    password: passwordTextEditingController.text
                                        .trim(),
                                    onSuccess: () {
                                      Navigator.pushNamed(
                                          context, AppRouteNames.home);
                                    },
                                    onFailure: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            context.localization.not_found,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                          },
                          text: context.localization.login,
                        ),
                      ),
                      const Gap(56),
                      Row(
                        children: [
                          Expanded(child: Divider()),
                          Gap(6),
                          Text(
                            context.localization.or,
                            style: TextStyle(
                              color: context.colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Gap(5),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const Gap(54),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialMediaLoginButton(
                              onTap: () {}, icon: AppIcons.facebook),
                          const Gap(32),
                          SocialMediaLoginButton(
                              onTap: () {}, icon: AppIcons.google),
                          const Gap(32),
                          SocialMediaLoginButton(
                              onTap: () {}, icon: AppIcons.apple),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom + 18,
                      right: 4),
                  child: Text(
                    context.localization.dont_accaunt,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: context.colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouteNames.sign_up);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom + 18),
                    child: Text(
                      context.localization.sign_up,
                      style: TextStyle(
                          fontSize: 15, color: context.colors.onBordingSkip),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
