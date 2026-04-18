import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/controller/homescreen_controller.dart';
import 'package:pulse_cart/view/widget/home/custombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) {
        return BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: SizedBox(
            height: 56,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...List.generate(
                        2,
                        (index) => CustomButtonAppbar(
                          textbutton: controller.titlebuttonappbar[index],
                          icondata: Icons.home,
                          active: controller.currentpage == index
                              ? true
                              : false,
                          onTap: () {
                            controller.changePage(index);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 56),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...List.generate(
                        2,
                        (index) => CustomButtonAppbar(
                          textbutton: controller.titlebuttonappbar[index + 2],
                          icondata: Icons.home,
                          active: controller.currentpage == index + 2
                              ? true
                              : false,
                          onTap: () {
                            controller.changePage(index + 2);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Row(
                // //   children: [
                //     CustomButtonAppbar(
                //       textbutton: "Home",
                //       icondata: Icons.home,
                //       active: controller.currentpage == 0? true: false,
                //       onTap: () {
                //         controller.changePage(0);
                //       },
                //     ),
                //     CustomButtonAppbar(
                //       textbutton: "Settings",
                //       icondata: Icons.settings,
                //       active: controller.currentpage == 1? true: false,
                //       onTap: () {
                //         controller.changePage(1);
                //       },
                //     ),
                //   ],
                // ),
                // Row(
                //   children: [
                //     CustomButtonAppbar(
                //       textbutton: "Profile",
                //       icondata: Icons.settings,
                //       active: controller.currentpage == 2? true: false,
                //       onTap: () {
                //         controller.changePage(2);
                //       },
                //     ),
                //     CustomButtonAppbar(
                //       textbutton: "Favorite",
                //       icondata: Icons.settings,
                //       active: controller.currentpage == 3? true: false,
                //       onTap: () {
                //         controller.changePage(3);
                //       },
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
