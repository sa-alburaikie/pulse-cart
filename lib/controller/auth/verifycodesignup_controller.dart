import 'package:get/get.dart';
import 'package:pulse_cart/core/class/statusrequest.dart';
import 'package:pulse_cart/core/constant/routes.dart';
import 'package:pulse_cart/core/functions/handlingdatacontroller.dart';
import 'package:pulse_cart/data/datasource/remote/auth/verifycodesignupdata.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verifycodesignup);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  String? email;
  Statusrequest statusrequest= Statusrequest.none;
  @override
  checkCode() {}

  @override
  goToSuccessSignUp(String verifycodesignup) async {
    statusrequest = Statusrequest.loading;
    update();
    var response = await verifyCodeSignUpData.postData(
      email!,
      verifycodesignup,
    );
    statusrequest = handlingData(response);
    if (Statusrequest.sucess == statusrequest) {
      Get.offNamed(AppRoute.successSignUp);
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
