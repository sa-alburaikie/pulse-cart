import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pulse_cart/core/constant/routes.dart';
import 'package:pulse_cart/core/middleware/mymiddleware.dart';
// import 'package:pulse_cart/test_view.dart';
// import 'package:pulse_cart/test.dart';
import 'package:pulse_cart/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:pulse_cart/view/screen/auth/login.dart';
import 'package:pulse_cart/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:pulse_cart/view/screen/auth/signup.dart';
import 'package:pulse_cart/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:pulse_cart/view/screen/auth/successsignup.dart';
import 'package:pulse_cart/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:pulse_cart/view/screen/auth/verifycodesignup.dart';
// import 'package:pulse_cart/view/screen/home.dart';
import 'package:pulse_cart/view/screen/homescreen.dart';
import 'package:pulse_cart/view/screen/language.dart';
import 'package:pulse_cart/view/screen/onboarding.dart';
import 'package:pulse_cart/view/screen/productdetails.dart';
// import 'package:pulse_cart/view/screen/productdetails.dart';
import 'package:pulse_cart/view/screen/products.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: ()=> ProductDetails()),
  //Auth
  GetPage(name: AppRoute.login, page: () => Login()),
  GetPage(name: AppRoute.signUp, page: () => SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => VerifyCode()),
  GetPage(name: AppRoute.resetpPassword, page: () => ResetPassword()),
  GetPage(
    name: AppRoute.successResetPassword,
    page: () => SuccessResetPassword(),
  ),
  GetPage(name: AppRoute.successSignUp, page: () => SuccessSignUp()),
  GetPage(name: AppRoute.verifyCodeSignUp, page: () => VerifyCodeSignUp()),
  //OnBoarding
  GetPage(name: AppRoute.onBoarding, page: () => OnBoarding()),
  //HomePage
  GetPage(name: AppRoute.homepage, page: () => HomeScreen()),
  //ProductsPage
  GetPage(name: AppRoute.products, page: () => Products()),
  GetPage(name: AppRoute.productDetails, page: () => ProductDetails()),
];

// Map<String, Widget Function(BuildContext)> routes = {
//   //Auth
//   AppRoute.login: (context) => Login(),
//   AppRoute.signUp: (context) => SignUp(),
//   AppRoute.forgetPassword: (context) => ForgetPassword(),
//   AppRoute.verifyCode: (context) => VerifyCode(),
//   AppRoute.resetpPassword: (context) => ResetPassword(),
//   AppRoute.successResetPassword: (context) => SuccessResetPassword(),
//   AppRoute.successSignUp: (context) => SuccessSignUp(),
//   AppRoute.verifyCodeSignUp: (context) => VerifyCodeSignUp(),
//   //OnBoarding
//   AppRoute.onBoarding: (context) => OnBoarding(),
// };
