class AppLink {
  //Server Link
  static const String server = "http://192.168.1.117:8000/api/pulse-cart";

  //==================== Image Links ==========================================
  static const String imageStatic = "http://192.168.1.117:8000/images";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageProducts = "$imageStatic/products";
  //
  
  // static const String server = "localhost:8000/api/pulse-cart";
  static const String test = "$server/test";

  //==================== Auth ==========================================
  static const String signUp = "$server/sign-up";
  static const String verifyCodeSignUp = "$server/verify-code";
  static const String login = "$server/login";

  //==================== Forget Password ==========================================
  static const String checkEmail = "$server/check-email";
  static const String verifyCheckCode = "$server/verify-check-code";
  static const String resetPassword = "$server/reset-password";

    //==================== Home ===================================================
  static const String home = "$server/home";
  //Products Page
  static const String products = "$server/get-products";
    

}
