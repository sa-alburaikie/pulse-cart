import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/homescreen_controller.dart';
import 'package:pulse_cart/core/constant/color.dart';
import 'package:pulse_cart/view/widget/home/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primaryColor,
            foregroundColor: Colors.white,
            
            onPressed: () {},
            child: Icon(Icons.shopping_basket_outlined),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomBottomAppBarHome(),
          body: controller.listPage.elementAt(controller.currentpage),
        );
      },
    );
  }
}
