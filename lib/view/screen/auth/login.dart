import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/auth/login_controller.dart';
import 'package:pulse_cart/core/class/handlingdataview.dart';
import 'package:pulse_cart/core/constant/color.dart';
import 'package:pulse_cart/core/functions/alertexitapp.dart';
import 'package:pulse_cart/core/functions/validinput.dart';
import 'package:pulse_cart/view/widget/auth/custombuttonauth.dart';
import 'package:pulse_cart/view/widget/auth/customtextbodyauth.dart';
import 'package:pulse_cart/view/widget/auth/customtextformauth.dart';
import 'package:pulse_cart/view/widget/auth/customtexttitleauth.dart';
import 'package:pulse_cart/view/widget/auth/logoauth.dart';
import 'package:pulse_cart/view/widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Sign In".tr,
          style: Theme.of(
            context,
          ).textTheme.displayLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) => alertExitApp(),
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) {
            return HandlingDataRequest(
              statusrequest: controller.statusrequest,
              widget: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      LogoAuth(),
                      SizedBox(height: 10),
                      CustomTextTitleAuth(text: "Welcome Back".tr),
                      SizedBox(height: 10),
                      CustomTextBodyAuth(
                        content:
                            "Sign In With Your Email And Password Or Continue With Social Media"
                                .tr,
                      ),
                      SizedBox(height: 20),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        mycontroller: controller.email,
                        hinttext: "Enter Your Email".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "Email".tr,
                      ),
                      GetBuilder<LoginControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          obscure: controller.isshowpassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 30, "password");
                          },
                          mycontroller: controller.password,
                          hinttext: "Enter Your Password".tr,
                          iconData: Icons.lock_outline,
                          labeltext: "Password".tr,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: Text(
                          "Forget Password".tr,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      CustomButtonAuth(
                        text: "Sign In".tr,
                        onPressed: () {
                          controller.login();
                        },
                      ),
                      SizedBox(height: 30),
                      CustomTextSignUpOrSignIn(
                        textone: "Don't have an account ? ".tr,
                        texttwo: "Sign Up".tr,
                        onTap: () {
                          controller.goToSignUp();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
