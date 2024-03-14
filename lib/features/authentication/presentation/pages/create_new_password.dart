import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/authentication/presentation/widgets/wTextField.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool isDisabled = false;
  TextEditingController firstInp = TextEditingController();
  TextEditingController secondInp = TextEditingController();

  InputDecoration decoration({
    required String hintText,
    Widget? icon,
  }) =>
      InputDecoration(
        hintText: hintText,
        hintStyle: context.style.fontSize14Weight400.copyWith(
          color: context.colors.whiteLabel.withOpacity(0.5),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: context.colors.rgbInpBorder),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: context.colors.rgbInpBorder,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: context.colors.rgbInpBorder,
            style: BorderStyle.solid,
          ),
        ),
        suffixIcon: icon,
        fillColor: context.colors.inpBackgroundColor,
        filled: true,
      );

  void inpCurrected() {
    if (firstInp.text == secondInp.text) {
      isDisabled = true;
      setState(() {});
    } else {
      isDisabled = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom + 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              context.localization.create_new_password,
              style: context.style.fontSize24Weight600,
            ),
            const SizedBox(
              height: 36,
            ),
            Image.asset(AppIcons.rectangle),
            const SizedBox(
              height: 48,
            ),
            Column(
              children: [
                WTextField(
                    firstInp,
                    context,
                    decoration(
                        hintText: context.localization.enter_new_password),
                    context.colors.whiteLabel, (s) {
                  inpCurrected();
                }),
                const SizedBox(
                  height: 16,
                ),
                WTextField(
                  secondInp,
                  context,
                  decoration(
                    hintText: context.localization.confirm_password,
                    icon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: isDisabled
                          ? SvgPicture.asset(
                              AppIcons.isCheck,
                              color: context.colors.isCheckGreenColor,
                            )
                          : SvgPicture.asset(
                              AppIcons.isCheck,
                            ),
                    ),
                  ),
                  context.colors.whiteLabel,
                  (s) {
                    inpCurrected();
                  },
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom + 24),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isDisabled
                    ? context.colors.buttonDisabledColor
                    : context.colors.buttonDisabledColor.withOpacity(0.3)),
            child: Text(
              context.localization.save,
              style: context.style.fontSize16Weight600.copyWith(
                color: isDisabled
                    ? context.colors.whiteLabel
                    : context.colors.whiteLabel.withOpacity(0.3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
