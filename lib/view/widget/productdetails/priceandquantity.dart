import 'package:flutter/material.dart';
import 'package:pulse_cart/core/constant/color.dart';

class PriceAndQuantity extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final double price;
  final int quantity;

  const PriceAndQuantity({
    super.key,
    required this.onAdd,
    required this.onRemove,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 2),
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Text(
                "$quantity",
                style: TextStyle(fontSize: 20, height: 1.1),
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
          ],
        ),
        Spacer(),
        Text(
          "$price \$",
          style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: 30,
            fontFamily: 'sans',
          ),
        ),
      ],
    );
  }
}
