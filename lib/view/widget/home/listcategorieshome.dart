import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/home_controller.dart';
import 'package:pulse_cart/core/constant/color.dart';
import 'package:pulse_cart/core/functions/translatedatabase.dart';
import 'package:pulse_cart/data/model/categoriesmodel.dart';
import 'package:pulse_cart/linkapi.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel: CategoriesModel.fromJson(controller.categories[index]));
        },
      ),
    );
  }
}


class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToProducts(controller.categories,i);
      },
      child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.thirdColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 70,
                  width: 70,
                  child: SvgPicture.network(
                    "${AppLink.imageCategories}/${categoriesModel.image}",
                    colorFilter: ColorFilter.mode(
                      AppColor.secondColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Text(
                  "${translateDatabase(categoriesModel.nameEn, categoriesModel.nameAr)}",
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ],
            ),
    );
  }
}
