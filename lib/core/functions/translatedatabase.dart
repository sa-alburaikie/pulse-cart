import 'package:get/instance_manager.dart';
import 'package:pulse_cart/core/services/services.dart';

translateDatabase(columnen , columnar){
  MyServices myServices = Get.find();

  if(myServices.sharedPreferences.getString("lang") == "ar"){
    return columnar;
  }else {
    return columnen;
  }
}