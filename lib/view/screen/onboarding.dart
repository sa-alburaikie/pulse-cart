import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/onboarding_controller.dart';
import 'package:pulse_cart/view/widget/onboarding/custombutton.dart';
import 'package:pulse_cart/view/widget/onboarding/customslider.dart';
import 'package:pulse_cart/view/widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: const [
                  SizedBox(height: 30,),
                  CustomDotControllerOnBoarding(),
                  Spacer(flex: 2,),
                  CustomButtonOnBoarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
