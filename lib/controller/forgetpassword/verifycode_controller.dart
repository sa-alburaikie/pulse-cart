import 'package:get/get.dart';
import 'package:pulse_cart/core/class/statusrequest.dart';
import 'package:pulse_cart/core/constant/routes.dart';
import 'package:pulse_cart/core/functions/handlingdatacontroller.dart';
import 'package:pulse_cart/data/datasource/remote/forgetpassword/verifycheckcodedata.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  VerifyCheckCodeData verifyCheckCodeData = VerifyCheckCodeData(Get.find());
  Statusrequest? statusrequest;

  @override
  checkCode() {}

  @override
  goToResetPassword(String verifycode) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await verifyCheckCodeData.postData(email!, verifycode);
    statusrequest = handlingData(response);
    if (Statusrequest.sucess == statusrequest) {
      Get.offNamed(AppRoute.resetpPassword,arguments: {
        "email": email
      });
    } else {
      Get.defaultDialog(
        title: "Warning".tr,
        middleText: "Verify Code is not correct".tr,
      );
      statusrequest = Statusrequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
