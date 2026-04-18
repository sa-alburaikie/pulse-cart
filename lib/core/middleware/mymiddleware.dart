import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/core/constant/routes.dart';
import 'package:pulse_cart/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  int? get priority => 1;
  MyServices myServices = Get.find();

    @override
    RouteSettings? redirect(String? route){
      if(myServices.sharedPreferences.getString("step")=="2"){
        return RouteSettings(name: AppRoute.homepage);
      }
      if(myServices.sharedPreferences.getString("step")=="1"){
        return RouteSettings(name: AppRoute.login);
      }
      return null;
    }

}