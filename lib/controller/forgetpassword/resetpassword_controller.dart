import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/core/class/statusrequest.dart';
import 'package:pulse_cart/core/constant/routes.dart';
import 'package:pulse_cart/core/functions/handlingdatacontroller.dart';
import 'package:pulse_cart/data/datasource/remote/forgetpassword/resetpassworddata.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController repassword;
  String? email;
  Statusrequest statusrequest= Statusrequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  @override
  resetPassword() {}

  @override
  goToSuccessResetPassword() async {
    if(password.text != repassword.text){
      return Get.defaultDialog(
          title: "Warning".tr,
          middleText: "Password Not Match".tr,
        );
    }
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusrequest = Statusrequest.loading;
      update();
      var response = await resetPasswordData.postData(
        email!,
        password.text,
      );
      statusrequest = handlingData(response);
      if (Statusrequest.sucess == statusrequest) {
        // data.addAll(response['data']);
        Get.offNamed(AppRoute.successResetPassword);
      } else {
        Get.defaultDialog(
          title: "Warning".tr,
          middleText: "Try Again".tr,
        );
        statusrequest = Statusrequest.failure;
      }
      update();
    } else {
      print("Not valid");
    }
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
