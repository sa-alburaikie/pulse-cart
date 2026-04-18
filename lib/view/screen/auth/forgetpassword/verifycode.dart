import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/forgetpassword/verifycode_controller.dart';
import 'package:pulse_cart/core/constant/color.dart';
import 'package:pulse_cart/view/widget/auth/customtextbodyauth.dart';
import 'package:pulse_cart/view/widget/auth/customtexttitleauth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp contoller = Get.put(
      VerifyCodeControllerImp(),
    );
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Verification Code".tr,
          style: Theme.of(
            context,
          ).textTheme.displayLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            SizedBox(height: 10),
            CustomTextTitleAuth(text: "Check Code".tr),
            SizedBox(height: 10),
            CustomTextBodyAuth(
              content: "${"Please Enter The Digit Code sent To ".tr}smoaa@gmail.com",
            ),
            SizedBox(height: 20),
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                contoller.goToResetPassword(verificationCode);
              }, // end onSubmit
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
