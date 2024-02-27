import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:productive/core/extensions/extensions.dart';

import '../../../../assets/images.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  PinTheme defaultPinTheme = PinTheme(
    width: 51,
    height: 55,
    textStyle: const TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: Color(0xFF1C233A),
      border: Border.all(
        color: Color(0xFF006EE9).withOpacity(0.1),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  );
  final TextEditingController pinPutController = TextEditingController();
  bool isPinPutValid = false;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF131524),
        title:  Text(context.localization.email_verification),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 130,
              width: 130,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: Image.asset(AppImages.person)
            ),
             Text(
              context.localization.password,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
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
                      color: Colors.green,
                    ))
                  : defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(
                  color: Color(0xFF006EE9),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(
                  color: !isPinPutValid ? Color(0xFFFF2752) : Colors.green,
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
                          builder: (context) => const SizedBox()));
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
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF979797),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Resent",
                    style: TextStyle(
                      color: Color(0xFF407BFF),
                      fontSize: 14,
                    ),
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
