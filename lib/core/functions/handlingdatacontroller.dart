import 'package:pulse_cart/core/class/statusrequest.dart';

Statusrequest handlingData(dynamic response) {
  if (response is Map) {
    if (response['status'] == true) {
      return Statusrequest.sucess;
    } else if (response['status'] == false) {
      return Statusrequest.failure;
    }
  }

  return Statusrequest.serverfailure;
}
