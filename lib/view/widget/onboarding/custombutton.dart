import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/onboarding_controller.dart';
import 'package:pulse_cart/core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnboardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 2),
        textColor: Colors.white,
        color: AppColor.primaryColor,
        onPressed: () {
          controller.next();
        },
        child: Text("Continue".tr),
      ),
    );
  }
}
