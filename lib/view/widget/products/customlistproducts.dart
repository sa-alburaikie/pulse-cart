import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/products_controller.dart';
import 'package:pulse_cart/core/constant/color.dart';
import 'package:pulse_cart/core/functions/translatedatabase.dart';
import 'package:pulse_cart/data/model/productsmodel.dart';
import 'package:pulse_cart/linkapi.dart';

class CustomListProducts extends GetView<ProductsControllerImp> {
  final ProductModel productModel;
  final bool active;
  const CustomListProducts({
    super.key,
    required this.productModel,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(productModel);
      },
      child: Card(
        color: AppColor.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${productModel.id}",
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageProducts}/${productModel.image!}",
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10),
              Text(
                translateDatabase(productModel.nameEn!, productModel.nameAr!),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Rating: 3.5", textAlign: TextAlign.center),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 18,
                    child: Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => Icon(Icons.star, size: 11),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${productModel.price} \$",
                    style: TextStyle(
                      color: AppColor.secondColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "sans",
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      active ? Icons.favorite : Icons.favorite_border_outlined,color: AppColor.secondColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
