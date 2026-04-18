import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_cart/view/screen/home.dart';

abstract class HomeScreenController extends GetxController{

  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    Home(),
    Column(mainAxisAlignment:  MainAxisAlignment.center, children: [Center(child: Text("Settings"),)],),
    Column(mainAxisAlignment:  MainAxisAlignment.center, children: [Center(child: Text("Profile"),)],),
    Column(mainAxisAlignment:  MainAxisAlignment.center, children: [Center(child: Text("FAvorite"),)],),
  ];

  List titlebuttonappbar = [
    "Home",
    "Setting",
    "Profile",
    "Favorite"
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }

}