import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/forgetpassword/forgepassword_controller.dart';
import 'package:pulse_cart/core/class/handlingdataview.dart';
import 'package:pulse_cart/core/constant/color.dart';
import 'package:pulse_cart/core/functions/validinput.dart';
import 'package:pulse_cart/view/widget/auth/custombuttonauth.dart';
import 'package:pulse_cart/view/widget/auth/customtextbodyauth.dart';
import 'package:pulse_cart/view/widget/auth/customtextformauth.dart';
import 'package:pulse_cart/view/widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp contoller = Get.put(
      ForgetPasswordControllerImp(),
    );
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Forget Password".tr,
          style: Theme.of(
            context,
          ).textTheme.displayLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
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
                    CustomTextTitleAuth(text: "Check Email".tr),
                    SizedBox(height: 10),
                    CustomTextBodyAuth(
                      content:
                          "please Enter Your Email Address To Receive A verification code"
                              .tr,
                    ),
                    SizedBox(height: 20),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 100, "email");
                      },
                      mycontroller: contoller.email,
                      hinttext: "Enter Your Email".tr,
                      iconData: Icons.email_outlined,
                      labeltext: "Email".tr,
                    ),
                    CustomButtonAuth(
                      text: "Check".tr,
                      onPressed: () {
                        contoller.checkEmail();
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
