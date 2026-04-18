import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/binding.dart';
import 'package:pulse_cart/core/localization/changelocale.dart';
import 'package:pulse_cart/core/localization/translation.dart';
import 'package:pulse_cart/core/services/services.dart';
import 'package:pulse_cart/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      // home:
      //     // Test(),
      //     const Language(),
      initialBinding: MyBinding(),
      // routes: routes,
      getPages: routes,
    );
  }
}
