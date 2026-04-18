import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/auth/successresetpassword_controller.dart';
import 'package:pulse_cart/core/constant/color.dart';
import 'package:pulse_cart/view/widget/auth/custombuttonauth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller = Get.put(SuccessResetPasswordControllerImp());
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
            Text("Verified Successfully".tr,style: Theme.of(context).textTheme.displayLarge,),
            SizedBox(height: 10,),
            Text("You successfully reset your password ! press the button bellow to proceed with the app".tr),
            Spacer(),
            Container(
              width: double.infinity,
              child: CustomButtonAuth(text: "Go To Login".tr, onPressed: () {
                controller.goToPageLogin();
              }),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
