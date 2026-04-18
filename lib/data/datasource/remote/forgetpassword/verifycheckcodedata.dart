import 'package:pulse_cart/core/class/crud.dart';
import 'package:pulse_cart/linkapi.dart';

class VerifyCheckCodeData {
  Crud crud;
  VerifyCheckCodeData(this.crud);

  postData(String email,String verifycode) async {
    var response = await crud.postData(AppLink.verifyCheckCode, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
