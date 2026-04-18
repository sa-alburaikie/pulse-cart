import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:pulse_cart/core/class/statusrequest.dart';
import 'package:pulse_cart/core/constant/routes.dart';
import 'package:pulse_cart/core/functions/handlingdatacontroller.dart';
import 'package:pulse_cart/core/services/services.dart';
import 'package:pulse_cart/data/datasource/remote/productsdata.dart';
import 'package:pulse_cart/data/model/productsmodel.dart';

abstract class ProductsController extends GetxController {
  initialData();
  changeCat(int val,catval);
  getProducts();
  goToPageProductDetails(ProductModel productModel);
}

class ProductsControllerImp extends ProductsController {
  List categories = [];
  int? selectedCat;
  late String token;
  ProductsData productsData = ProductsData(Get.find());
  List data = [];
  late Statusrequest statusrequest;
  MyServices myServices = Get.find();


  @override
  void onInit() {
    initialData();
    getProducts();
    super.onInit();
  }
  
  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    token = myServices.sharedPreferences.getString("api_token")!;
  }

  @override
  changeCat(val,catval) {
   selectedCat = val;
   getProducts();
   update();
  }
  
  @override
  getProducts() async{
    data.clear();
    statusrequest = Statusrequest.loading;
    var response = await productsData.getData(token,{"selectedcat":(selectedCat! + 1).toString()});
    statusrequest = handlingData(response);
    if (Statusrequest.sucess == statusrequest) {
        data.addAll(response['products']);
      } else {
        statusrequest = Statusrequest.failure;
      }
    update();
  }
  
  @override
  goToPageProductDetails(productModel) {
    Get.toNamed(AppRoute.productDetails,arguments: {
      "productmodel": productModel
    });
  }
}
