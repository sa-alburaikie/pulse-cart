import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/core/class/statusrequest.dart';
import 'package:pulse_cart/core/constant/routes.dart';
import 'package:pulse_cart/core/functions/handlingdatacontroller.dart';
import 'package:pulse_cart/data/datasource/remote/forgetpassword/checkemaildata.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  // goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  Statusrequest statusrequest= Statusrequest.none;
  late TextEditingController email;
  @override
  checkEmail() async{
    if(formstate.currentState!.validate()){
      statusrequest = Statusrequest.loading;
      update();
      var response = await checkEmailData.postData(email.text.trim());
      statusrequest = handlingData(response);
      if (Statusrequest.sucess == statusrequest) {
        // data.addAll(response['data']);
        Get.offNamed(AppRoute.verifyCode,arguments: {
          "email": email.text
        });
      } else {
        Get.defaultDialog(
          title: "Warning".tr,
          middleText: "Email Not Found".tr,
        );
        statusrequest = Statusrequest.failure;
      }
      update();
    }
  }

  // @override
  // goToVerifyCode() {
  //   var formdata = formstate.currentState;
  //   if (formdata!.validate()) {
  //     Get.offNamed(AppRoute.verifyCode);
  //   } else {
  //     print("Not valid");
  //   }
  // }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
