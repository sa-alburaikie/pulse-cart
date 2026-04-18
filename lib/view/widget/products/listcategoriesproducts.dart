import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/products_controller.dart';
import 'package:pulse_cart/core/constant/color.dart';
import 'package:pulse_cart/core/functions/translatedatabase.dart';
import 'package:pulse_cart/data/model/categoriesmodel.dart';

class ListCategoriesProducts extends GetView<ProductsControllerImp> {
  const ListCategoriesProducts({super.key});

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
            categoriesModel: CategoriesModel.fromJson(
              controller.categories[index],
            ),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ProductsControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToProducts(controller.categories,i);
        controller.changeCat(i,categoriesModel.id!);
      },
      child: Column(
        children: [
          GetBuilder<ProductsControllerImp>(
            builder: (controller) {
              return Container(
                padding: EdgeInsets.only(right: 10,left: 10,bottom: 5),
                decoration: controller.selectedCat == i
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 3,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      )
                    : null,
                child: Text(
                  "${translateDatabase(categoriesModel.nameEn, categoriesModel.nameAr)}",
                  style: TextStyle(fontSize: 20, color: AppColor.darkengGrey),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
