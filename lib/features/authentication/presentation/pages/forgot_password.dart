import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/images.dart';
import 'package:productive/core/extensions/extensions.dart';
import 'package:productive/features/authentication/presentation/pages/verification.dart';

import '../../../../assets/icons.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

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
          color:context.colors.whiteLabel.withOpacity(.6),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        fillColor: context.colors.loginTextFieldBackgroundColor.withOpacity(0.5),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color:context.colors.whiteLabel.withOpacity(.1),
            style: BorderStyle.solid,
          ), 
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: context.colors.loginTextFieldBackgroundColor.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: context.colors.whiteLabel.withOpacity(.1),
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
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:context.colors.mainDark,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
                child: SvgPicture.asset(context.icons.back)),
            Gap(10),
            Text(
              context.localization.forgot_password,
              style:context.style.fontSize24Weight600,
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
                child: Image.asset(context.images.unknown),
              ),
              Gap(65),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(context.localization.email,style: context.style.fontSize18Weight600,),
              ),
              Form(
                key: formKey,
                child: TextFormField(
                  focusNode: mailFocusNode,
                  style: context.style.fontSize14Weight400,
                  cursorColor: context.colors.statsGradient1,
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
            width: (MediaQuery.of(context).size.width/100)*95,
            height:(MediaQuery.of(context).size.height /100)*6 ,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:context.colors.statsGradient1),
            child: Center(
              child: Text(
                context.localization.recover_password,
                style: context.style.fontSize16Weight600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
