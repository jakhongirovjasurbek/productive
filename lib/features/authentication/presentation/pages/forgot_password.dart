import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/images.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/authentication/presentation/pages/verification.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final textFieldContentStyle = const TextStyle(
    color: Color(0xFFFEFEFE),
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final mailFocusNode = FocusNode();

  bool isEmailValid = false;

  InputDecoration decoration({
    required String hintText,
    Widget? suffixIcon,
  }) =>
      InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 13.5),
        hintStyle: TextStyle(
          color: Color(0xFFFEFEFE).withOpacity(.6),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        fillColor: Color(0xFF1C233A),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: Color.fromRGBO(0, 110, 233, 0.10).withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: Color.fromRGBO(0, 110, 233, 0.10).withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: Color.fromRGBO(0, 110, 233, 0.10).withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
      );

  @override
  void initState() {
    emailController.addListener(() {
      if (formKey.currentState!.validate()) {
        if (!isEmailValid) {
          setState(() {
            isEmailValid = true;
          });
        }
      } else {
        if (isEmailValid) {
          setState(() {
            isEmailValid = false;
          });
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF131524),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SvgPicture.asset(context.icons.back),
            Gap(10),
            Text(
              context.localization.forgot_password,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 450,
          height: 350,
          child: Column(
            children: [
              Gap(45),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                width: 130,
                height: 130,
                child: Image.asset(AppImages.unknown),
              ),
              Gap(100),
              Form(
                key: formKey,
                child: TextFormField(
                  focusNode: mailFocusNode,
                  style: textFieldContentStyle,
                  cursorColor: Color(0xFF4B7FD6),
                  controller: emailController,
                  decoration: decoration(hintText: context.localization.email),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: () {
                    // passwordFocusNode.requestFocus();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Emailingizni kiriting!';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return " To'g'ri email kiriting";
                    }

                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: GestureDetector(
          onTap: isEmailValid
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerificationPage(),
                    ),
                  );
                }
              : null,
          child: Container(
            width: 343,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFF4B7FD6)),
            child: Center(
              child: Text(
                context.localization.recover_password,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
