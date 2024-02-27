import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/assets/colors.dart';
import 'package:productive/assets/icons.dart';
import 'package:productive/core/extensions/extensions.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool isDisabled = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController firstInp = TextEditingController();
  TextEditingController secondInp = TextEditingController();
  final colors = AppColors();
  InputDecoration decoration({
    required String hintText,
    Widget? icon,
  }) =>
      InputDecoration(
        hintText: hintText,
        hintStyle: context.style.fontSize14Weight400.copyWith(
          color: colors.whiteLabel.withOpacity(0.5),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: colors.rgbInpBorder),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colors.rgbInpBorder,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: colors.rgbInpBorder,
            style: BorderStyle.solid,
          ),
        ),
        suffixIcon: icon,
        fillColor: colors.inpBackgroundColor,
        filled: true,
      );

  void inpCurrected() {
    if (formKey.currentState!.validate()) {
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
              "Create new password",
              style: context.style.fontSize24Weight600,
            ),
            const SizedBox(
              height: 36,
            ),
            Image.asset(AppIcons.rectangle),
            const SizedBox(
              height: 48,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    focusNode: FocusNode(),
                    onChanged: (value) {
                      firstInp.text = value;
                      setState(() {});
                      inpCurrected();
                    },
                    controller: firstInp,
                    decoration: decoration(hintText: "Enter new password"),
                    style: TextStyle(
                      color: colors.whiteLabel,
                    ),
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Iltimos, yangi parolni kiriting kiriting!';
                      } else if (value.length < 8) {
                        return "Parol kamida 8 belgidan iborat bo'lsin";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      secondInp.text = value;
                      setState(() {});
                      inpCurrected();
                    },
                    controller: secondInp,
                    decoration: decoration(
                        hintText: "Confirm password",
                        icon: Padding(
                          padding: const EdgeInsets.all(10),
                          child: isDisabled
                              ? SvgPicture.asset(
                                  AppIcons.isCheck,
                                  color: colors.isCheckGreenColor,
                                )
                              : SvgPicture.asset(
                                  AppIcons.isCheck,
                                ),
                        )),
                    style: TextStyle(
                      color: colors.whiteLabel,
                    ),
                    focusNode: FocusNode(),
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    validator: (passwodt2) {
                      if (firstInp.text == null || secondInp.text.isEmpty) {
                        return "Kiritgan parolingiz tepadagisi bilan mos kelmadi!";
                      } else if (firstInp.text != secondInp.text) {
                        return "Xatolik qayta urining";
                      }
                      return null;
                    },
                  )
                ],
              ),
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
          onTap: () {
            if (!isDisabled) {
              showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: Container(
                      padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: List.filled(
                          2,
                          const BoxShadow(
                            color: Colors.black45,
                          ),
                        ),
                      ),
                      child: Text(
                        "Success",
                      ),
                    ),
                  );
                },
              );
            }
          },
          child: Container(
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isDisabled
                    ? colors.buttonDisabledColor
                    : colors.buttonDisabledColor.withOpacity(0.3)),
            child: Text(
              "Save",
              style: context.style.fontSize16Weight600.copyWith(
                color: isDisabled
                    ? colors.whiteLabel
                    : colors.whiteLabel.withOpacity(0.3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
