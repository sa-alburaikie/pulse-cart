import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:pulse_cart/data/model/productsmodel.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  List subitems = [
    {
      "name": "red",
      "id": 2,
      "active": 1
    },
    {
      "name": "yellow",
      "id": 3,
      "active": 0
    },
    {
      "name": "black",
      "id": 1,
      "active": 0
    }
  ];
  late ProductModel productModel;

  initalData() {
    productModel = Get.arguments['productmodel'];
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }
}
