import 'package:get/get_utils/get_utils.dart';
import 'package:pulse_cart/core/constant/imageasset.dart';
import 'package:pulse_cart/data/model/onboardingmodel.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: "Choose Product".tr,
    body:
        "We Have a 100K Product, Choose \n Your Product From Our \n PulseCart Shop".tr,
    image: AppImageAsset.onBoardingImageOne,
  ),
  OnBoardingModel(
    title: "Easy and Safe Payment".tr,
    body:
        "Easy Checkout and Safe Payment \n method. Trusted by our Customers \n from all over the world ".tr,
    image: AppImageAsset.onBoardingImageTwo,
  ),
  OnBoardingModel(
    title: "Track Your Order".tr,
    body:
        "Best Tracker has been used For \n Track your order. You'll know where \n your product is at the moment".tr,
    image: AppImageAsset.onBoardingImageThree,
  ),
  OnBoardingModel(
    title: "Fast Deleivery".tr,
    body:
        "Reliable And Fast Delivery. We \n Deliver your product the fastest \n way possible".tr,
    image: AppImageAsset.onBoardingImageFour,
  ),
];
