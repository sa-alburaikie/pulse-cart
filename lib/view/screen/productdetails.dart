import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/productdetails_controller.dart';
import 'package:pulse_cart/core/constant/color.dart';
import 'package:pulse_cart/core/functions/translatedatabase.dart';
import 'package:pulse_cart/view/widget/productdetails/priceandquantity.dart';
import 'package:pulse_cart/view/widget/productdetails/productimages.dart';
import 'package:pulse_cart/view/widget/productdetails/subitemslist.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(
      ProductDetailsControllerImp(),
    );
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 40,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: AppColor.secondColor,
          onPressed: () {},
          child: Text(
            "Add To Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: 20),
          ProductImages(),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${translateDatabase(controller.productModel.nameEn, controller.productModel.nameAr)}",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColor.secondColor,
                  ),
                ),
                // SizedBox(height: 10),
                PriceAndQuantity(
                  onAdd: () {},
                  onRemove: () {},
                  price: 200.0,
                  quantity: 2,
                ),
                SizedBox(height: 10),
                Text(
                  "${translateDatabase(controller.productModel.descriptionEn, controller.productModel.descriptionAr)} +"
                  " + ${translateDatabase(controller.productModel.descriptionEn, controller.productModel.descriptionAr)} ${translateDatabase(controller.productModel.descriptionEn, controller.productModel.descriptionAr)} ${translateDatabase(controller.productModel.descriptionEn, controller.productModel.descriptionAr)}",
                  style: Theme.of(context).textTheme.bodyMedium!,
                ),
                SizedBox(height: 10),
                Text(
                  "Color",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColor.secondColor,
                  ),
                ),
                SizedBox(height: 10),
                SubItemsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
