import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/forgetpassword/resetpassword_controller.dart';
import 'package:pulse_cart/core/class/handlingdataview.dart';
import 'package:pulse_cart/core/constant/color.dart';
import 'package:pulse_cart/core/functions/validinput.dart';
import 'package:pulse_cart/view/widget/auth/custombuttonauth.dart';
import 'package:pulse_cart/view/widget/auth/customtextbodyauth.dart';
import 'package:pulse_cart/view/widget/auth/customtextformauth.dart';
import 'package:pulse_cart/view/widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp contoller = Get.put(
      ResetPasswordControllerImp(),
    );
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Reset Password".tr,
          style: Theme.of(
            context,
          ).textTheme.displayLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) {
          return HandlingDataRequest(
            statusrequest: controller.statusrequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: contoller.formstate,
                child: ListView(
                  children: [
                    SizedBox(height: 10),
                    CustomTextTitleAuth(text: "New Password".tr),
                    SizedBox(height: 10),
                    CustomTextBodyAuth(content: "Please Enter new Password".tr),
                    SizedBox(height: 20),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      mycontroller: contoller.password,
                      hinttext: "Enter Your Password".tr,
                      iconData: Icons.lock_outline,
                      labeltext: "Password".tr,
                    ),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      mycontroller: contoller.repassword,
                      hinttext: "Re Enter Your Password".tr,
                      iconData: Icons.lock_outline,
                      labeltext: "Password".tr,
                    ),
                    // CustomTextFormAuth(
                    //   mycontroller: contoller.email,
                    //   hinttext: "Enter Your Email",
                    //   iconData: Icons.email_outlined,
                    //   labeltext: "Email",
                    // ),
                    CustomButtonAuth(
                      text: "save".tr,
                      onPressed: () {
                        contoller.goToSuccessResetPassword();
                      },
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
