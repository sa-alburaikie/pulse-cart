import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:pulse_cart/core/class/statusrequest.dart';
import 'package:pulse_cart/core/functions/handlingdatacontroller.dart';
import 'package:pulse_cart/data/datasource/remote/test_data.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  List data = [];
  late Statusrequest statusrequest;

  getData() async {
    statusrequest = Statusrequest.loading;
    var response = await testData.getData();
    statusrequest = handlingData(response);
    if (Statusrequest.sucess == statusrequest) {
      if (response['msg'] == "success") {
        data.addAll(response['data']);
      } else {
        statusrequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
