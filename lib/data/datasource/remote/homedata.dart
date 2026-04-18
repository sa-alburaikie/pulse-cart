import 'package:pulse_cart/core/class/crud.dart';
import 'package:pulse_cart/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData(String token) async {
    var response = await crud.getData(AppLink.home,token: token);
    return response.fold((l) => l, (r) => r);
  }
}
