import 'package:pulse_cart/core/class/crud.dart';
import 'package:pulse_cart/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postData( String password, String email) async {
    var response = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
