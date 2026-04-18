import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/productdetails_controller.dart';
import 'package:pulse_cart/linkapi.dart';

class ProductImages extends GetView<ProductDetailsControllerImp> {
  const ProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "${controller.productModel.id}",
        child: CachedNetworkImage(
          imageUrl:
              "${AppLink.imageProducts}/${controller.productModel.image!}",
          height: 250,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
