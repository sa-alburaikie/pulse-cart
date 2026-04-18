import 'package:pulse_cart/core/class/crud.dart';
import 'package:pulse_cart/linkapi.dart';

class ProductsData {
  Crud crud;
  ProductsData(this.crud);

  getData(String token, Map<String,dynamic>? data) async {
    var response = await crud.getData(AppLink.products,token: token,data: data);
    return response.fold((l) => l, (r) => r);
  }
}
