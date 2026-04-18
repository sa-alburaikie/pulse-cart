import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/core/class/statusrequest.dart';
import 'package:pulse_cart/core/constant/routes.dart';
import 'package:pulse_cart/core/functions/handlingdatacontroller.dart';
import 'package:pulse_cart/data/datasource/remote/auth/signupdata.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
  showpassword();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  SignUpData signUpData = SignUpData(Get.find());
  List data = [];
  Statusrequest statusrequest= Statusrequest.none;

  @override
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      var response = await signUpData.postData(
        username.text,
        password.text,
        email.text,
        phone.text,
      );
      statusrequest = handlingData(response);
      if (Statusrequest.sucess == statusrequest) {
        // data.addAll(response['data']);
        Get.offNamed(
          AppRoute.verifyCodeSignUp,
          arguments: {"email": email.text},
        );
      } else {
        Get.defaultDialog(
          title: "Warning".tr,
          middleText: "Phone Number Or Email already Exists!".tr,
        );
        statusrequest = Statusrequest.failure;
      }
      update();
      // Get.delete<SignUpControllerImp>();
    } else {
      print("Not valid");
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }
}
