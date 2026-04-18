import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/utils.dart';
import 'package:pulse_cart/controller/test_controller.dart';
import 'package:pulse_cart/core/class/handlingdataview.dart';
import 'package:pulse_cart/core/constant/color.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(title: Text("test data"),
      backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {

          return HandlingDataView(statusrequest: controller.statusrequest, widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context,index){
                return Text("${controller.data}");
            }));

        //   if (controller.statusrequest == Statusrequest.loading) {
        //     return Center(child: Text("Loading"));
        //   } else if (controller.statusrequest == Statusrequest.offlinefailure) {
        //     return Center(child: Text("Offline Failure"));
        //   } else if (controller.statusrequest == Statusrequest.serverfailure) {
        //     return Center(child: Text("Server Failure"));
        //   } else if (controller.statusrequest == Statusrequest.failure) {
        //     return Center(child: Text("No Data"));
        //   } else {
        //     return ListView.builder(
        //       itemCount: controller.data.length,
        //       itemBuilder: (context,index){
        //         return Text("${controller.data}");
        //     });
        //   }
        },
      ),
    );
  }
}
