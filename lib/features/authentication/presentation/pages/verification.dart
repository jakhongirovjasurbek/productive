import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:productive/core/extensions/extensions.dart';

import '../../../../assets/icons.dart';
import '../../../../assets/images.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    PinTheme defaultPinTheme = PinTheme(
      width: 51,
      height: 55,
      textStyle: context.style.fontSize24Weight600,
      decoration: BoxDecoration(
        color: context.colors.loginTextFieldBackgroundColor,
        border: Border.all(
          color: context.colors.pinputBorderColor.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    final TextEditingController pinPutController = TextEditingController();
    bool isPinPutValid = false;
    bool isError = false;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: context.colors.mainDark.withOpacity(0.3),
        title:  Row(
          children: [
            SvgPicture.asset(AppIcons.back),
            Gap(10),
            Text(
              context.localization.email_verification,
              style: context.style.fontSize24Weight600,
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
                height: 130,
                width: 130,
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Image.asset(AppImages.person)),
            Text(
              height: 130,
              width: 130,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: Image.asset(context.images.person)
            ),
             Text(
              context.localization.password,
              style: context.style.fontSize16Weight600,
              textAlign: TextAlign.center,
            ),
            const Gap(12),
            Pinput(
              length: 4,
              forceErrorState: isError,
              controller: pinPutController,
              enableSuggestions: isPinPutValid,
              defaultPinTheme: isPinPutValid
                  ? defaultPinTheme.copyBorderWith(
                      border: Border.all(
                      color: context.colors.calendarGreen,
                    ))
                  : defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(
                  color: context.colors.pinputBorderColor,
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(
                  color: !isPinPutValid
                      ? context.colors.pinputBorderColor
                      : context.colors.calendarGreen,
                ),
              ),
              onChanged: (value) {
                if (value.length == 4) {
                  if (value == '1111') {
                    isPinPutValid = true;
                  } else {
                    isError = true;
                  }

                  setState(() {});
                } else {
                  isPinPutValid = false;
                  isError = false;
                }
              },
              onCompleted: (value) {
                if (isPinPutValid) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Scaffold()));
                }
              },
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.localization.receive_code,
                  style: context.style.fontSize14Weight600,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Resent",
                    style: context.style.fontSize14Weight600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
