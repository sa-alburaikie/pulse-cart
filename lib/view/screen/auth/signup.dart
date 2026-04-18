import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/auth/signup_controller.dart';
import 'package:pulse_cart/core/class/handlingdataview.dart';
import 'package:pulse_cart/core/constant/color.dart';
import 'package:pulse_cart/core/functions/alertexitapp.dart';
import 'package:pulse_cart/core/functions/validinput.dart';
import 'package:pulse_cart/view/widget/auth/custombuttonauth.dart';
import 'package:pulse_cart/view/widget/auth/customtextbodyauth.dart';
import 'package:pulse_cart/view/widget/auth/customtextformauth.dart';
import 'package:pulse_cart/view/widget/auth/customtexttitleauth.dart';
import 'package:pulse_cart/view/widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Sign Up".tr,
          style: Theme.of(
            context,
          ).textTheme.displayLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) => alertExitApp(),
        child: GetBuilder<SignUpControllerImp>(
          builder: (contoller) {
            return HandlingDataRequest(
              statusrequest: contoller.statusrequest,
              widget: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),
                child: Form(
                  key: contoller.formstate,
                  child: ListView(
                    children: [
                      SizedBox(height: 10),
                      CustomTextTitleAuth(text: "Welcome Back".tr),
                      SizedBox(height: 10),
                      CustomTextBodyAuth(
                        content:
                            "Sign Up With Your Email And Password Or Continue With Social Media"
                                .tr,
                      ),
                      SizedBox(height: 20),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 5, 30, "username");
                        },
                        mycontroller: contoller.username,
                        hinttext: "Enter Your Username".tr,
                        iconData: Icons.person_outline,
                        labeltext: "Username".tr,
                      ),
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
                      CustomTextFormAuth(
                        isNumber: true,
                        valid: (val) {
                          return validInput(val!, 5, 20, "phone");
                        },
                        mycontroller: contoller.phone,
                        hinttext: "Enter Your Phone".tr,
                        iconData: Icons.phone_android_outlined,
                        labeltext: "Phone".tr,
                      ),
                      GetBuilder<SignUpControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          obscure: contoller.isshowpassword,
                          onTapIcon: () {
                            contoller.showpassword();
                          },
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 100, "password");
                          },
                          mycontroller: contoller.password,
                          hinttext: "Enter Your Password".tr,
                          iconData: Icons.lock_outline,
                          labeltext: "Password".tr,
                        ),
                      ),
                      CustomButtonAuth(
                        text: "Sign Up".tr,
                        onPressed: () {
                          contoller.signUp();
                        },
                      ),
                      SizedBox(height: 30),
                      CustomTextSignUpOrSignIn(
                        textone: "Have an account ? ".tr,
                        texttwo: "Sign In".tr,
                        onTap: () {
                          contoller.goToSignIn();
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
