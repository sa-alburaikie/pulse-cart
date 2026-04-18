import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/productdetails_controller.dart';
import 'package:pulse_cart/core/constant/color.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            height: 60,
            width: 90,
            decoration: BoxDecoration(
              color: controller.subitems[index]['active'] == 1
                  ? AppColor.primaryColor
                  : Colors.white,
              border: Border.all(color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              controller.subitems[index]['name'],
              style: TextStyle(
                color: controller.subitems[index]['active'] == 1
                    ? Colors.white
                    : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
