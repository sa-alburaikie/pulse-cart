import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/home_controller.dart';
import 'package:pulse_cart/core/constant/color.dart';
import 'package:pulse_cart/data/model/productsmodel.dart';
import 'package:pulse_cart/linkapi.dart';

class ListProductsHome extends GetView<HomeControllerImp> {
  const ListProductsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: controller.products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return ProductsHome(productModel: ProductModel.fromJson(controller.products[i]));
        },
      ),
    );
  }
}

class ProductsHome extends StatelessWidget {
  final ProductModel productModel;
  const ProductsHome({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Image.network(
                  "${AppLink.imageProducts}/${productModel.image}",
                  height: 100,
                  width: 150,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.black.withAlpha(80),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 120,
                width: 200,
              ),
              Positioned(
                left: 10,
                child: Text(
                  "${productModel.nameEn}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          );
  }
}
