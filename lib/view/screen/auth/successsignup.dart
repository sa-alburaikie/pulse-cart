import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:pulse_cart/controller/auth/successsignup_controller.dart';
import 'package:pulse_cart/core/constant/color.dart';
import 'package:pulse_cart/view/widget/auth/custombuttonauth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller = Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Success".tr,
          style: Theme.of(
            context,
          ).textTheme.displayLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 180,
                color: AppColor.primaryColor,
              ),
            ),
            Text(
              "Verified Successfully".tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 8),
            Text(
              "You are successfully signed up ! press the button bellow to proceed with the app"
                  .tr,
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: CustomButtonAuth(text: "Go To Login".tr, onPressed: () {
                controller.goToPageLogin();
              }),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
