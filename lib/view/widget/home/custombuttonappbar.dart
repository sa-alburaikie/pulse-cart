import 'package:flutter/material.dart';
import 'package:pulse_cart/core/constant/color.dart';

class CustomButtonAppbar extends StatelessWidget {
  final void Function()? onTap;
  final String textbutton;
  final IconData? icondata;
  final bool active;
  const CustomButtonAppbar({
    super.key,
    this.onTap,
    required this.textbutton,
    this.icondata,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icondata,
              color: active == true ? AppColor.primaryColor : AppColor.darkengGrey,
            ),
            Text(
              textbutton,
              style: TextStyle(
                color: active == true ? AppColor.primaryColor : AppColor.darkengGrey,
                height: 1,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
