import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/core/class/statusrequest.dart';
import 'package:pulse_cart/core/constant/routes.dart';
import 'package:pulse_cart/core/functions/handlingdatacontroller.dart';
import 'package:pulse_cart/core/services/services.dart';
import 'package:pulse_cart/data/datasource/remote/auth/logindata.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
  showPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  Statusrequest statusrequest = Statusrequest.none;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      var response = await loginData.postData(password.text, email.text.trim());
      statusrequest = handlingData(response);
      if (Statusrequest.sucess == statusrequest) {
        // data.addAll(response['data']);
        myServices.sharedPreferences.setInt("id", response["data"]["id"]);
        myServices.sharedPreferences.setString(
          "name",
          response["data"]["name"],
        );
        myServices.sharedPreferences.setString(
          "email",
          response["data"]["email"],
        );
        myServices.sharedPreferences.setString(
          "phone",
          response["data"]["phone"],
        );
        myServices.sharedPreferences.setString(
          "api_token",
          response["data"]["api_token"],
        );
        myServices.sharedPreferences.setString("step", "2");
        Get.offNamed(AppRoute.homepage);
      } else {
        Get.defaultDialog(
          title: "Warning".tr,
          middleText: "Email Or Password Is Not Correct".tr,
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
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }
}
