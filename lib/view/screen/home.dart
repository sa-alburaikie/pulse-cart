import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/home_controller.dart';
import 'package:pulse_cart/core/class/handlingdataview.dart';
import 'package:pulse_cart/view/widget/customappbar.dart';
import 'package:pulse_cart/view/widget/home/customcardhome.dart';
import 'package:pulse_cart/view/widget/home/customtitlehome.dart';
import 'package:pulse_cart/view/widget/home/listcategorieshome.dart';
import 'package:pulse_cart/view/widget/listproductshome.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return HandlingDataView(
          statusrequest: controller.statusrequest,
          widget: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                CustomAppBar(
                  titleappbar: "Find Product".tr,
                  onPressedIcon: () {},
                  onPressedSearch: () {},
                ),
                CustomCardHome(
                  title: "A summer surprise".tr,
                  body: "Cashback 20%".tr,
                ),
                CustomTitleHome(title: "Categories".tr),
                ListCategoriesHome(),
                CustomTitleHome(title: "Product for you".tr),
                ListProductsHome(),
              ],
            ),
          ),
        );
      },
    );
  }
}
