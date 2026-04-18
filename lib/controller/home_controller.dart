import 'package:get/get.dart';
import 'package:pulse_cart/core/class/statusrequest.dart';
import 'package:pulse_cart/core/constant/routes.dart';
import 'package:pulse_cart/core/functions/handlingdatacontroller.dart';
import 'package:pulse_cart/core/services/services.dart';
import 'package:pulse_cart/data/datasource/remote/homedata.dart';

abstract class HomeController extends GetxController{
  initialData();
  getData();
  goToProducts(List categories , int selectedCat) ;
}

class HomeControllerImp extends HomeController {

  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  List products = [];
  List categories = [];
  late Statusrequest statusrequest;
  String? lang;
  int? id;
  String? token;

  @override
  initialData(){
    lang = myServices.sharedPreferences.getString("lang");
    id = myServices.sharedPreferences.getInt("id");
    token = myServices.sharedPreferences.getString("api_token");
  }

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }
  
  @override
  getData() async{
    statusrequest = Statusrequest.loading;
    var response = await homeData.getData(token!);
    statusrequest = handlingData(response);
    if (Statusrequest.sucess == statusrequest) {
        categories.addAll(response['data']['categories']);
        products.addAll(response['data']['products']);
      } else {
        statusrequest = Statusrequest.failure;
      }
    update();
  }
  
  @override
  goToProducts(List categories , int selectedCat) {
    Get.toNamed(AppRoute.products,arguments: {
      "categories": categories,
      "selectedcat": selectedCat
    });
  }
}