import 'package:pulse_cart/core/class/crud.dart';
import 'package:pulse_cart/linkapi.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  postData(String name, String password, String email, String phone) async {
    var response = await crud.postData(AppLink.signUp, {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
