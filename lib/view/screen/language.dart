import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/core/constant/routes.dart';
import 'package:pulse_cart/core/localization/changelocale.dart';
import 'package:pulse_cart/view/widget/language/custombuttonlang.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.displayLarge),
            SizedBox(height: 20),
            CustomButtonLang(
              textbutton: "Ar".tr,
              onPressed: () {
                controller.changeLang("ar");
                Get.offNamed(AppRoute.onBoarding);
              },
            ),
            CustomButtonLang(
              textbutton: "En".tr,
              onPressed: () {
                controller.changeLang("en");
                Get.offNamed(AppRoute.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
