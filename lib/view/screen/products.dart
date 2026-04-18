import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:pulse_cart/controller/products_controller.dart';
import 'package:pulse_cart/core/class/handlingdataview.dart';
import 'package:pulse_cart/data/model/productsmodel.dart';
import 'package:pulse_cart/view/widget/customappbar.dart';
import 'package:pulse_cart/view/widget/products/customlistproducts.dart';
import 'package:pulse_cart/view/widget/products/listcategoriesproducts.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductsControllerImp());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: GetBuilder<ProductsControllerImp>(
          builder: (controller) {
            return ListView(
              children: [
                CustomAppBar(
                  titleappbar: "Find Product",
                  onPressedIcon: () {},
                  onPressedSearch: () {},
                ),
                SizedBox(height: 10),
                ListCategoriesProducts(),
                HandlingDataView(
                  statusrequest: controller.statusrequest,
                  widget: GridView.builder(
                    itemCount: controller.data.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.5,
                    ),
                    itemBuilder: (BuildContext context, index) {
                      return CustomListProducts(
                        active: true,
                        productModel: ProductModel.fromJson(
                          controller.data[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
