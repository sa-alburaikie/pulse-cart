import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pulse_cart/core/class/statusrequest.dart';
import 'package:pulse_cart/core/constant/imageasset.dart';

class HandlingDataView extends StatelessWidget {
  final Statusrequest statusrequest;
  final Widget widget;
  const HandlingDataView({
    super.key,
    required this.statusrequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusrequest == Statusrequest.loading
        ? Center(child: Lottie.asset(AppImageAsset.loading,height: 200,width: 200))
        : statusrequest == Statusrequest.offlinefailure
        ? Center(child: Lottie.asset(AppImageAsset.offline,height: 200,width: 200))
        : statusrequest == Statusrequest.serverfailure
        ? Center(child: Lottie.asset(AppImageAsset.serverError,height: 200,width: 200))
        : statusrequest == Statusrequest.failure
        ? Center(child: Text("No Data"))
        : widget;
  }
}


class HandlingDataRequest extends StatelessWidget {
  final Statusrequest statusrequest;
  final Widget widget;
  const HandlingDataRequest({
    super.key,
    required this.statusrequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusrequest == Statusrequest.loading
        ? Center(child: Lottie.asset(AppImageAsset.loading,height: 200,width: 200))
        : statusrequest == Statusrequest.offlinefailure
        ? Center(child: Lottie.asset(AppImageAsset.offline,height: 200,width: 200))
        : statusrequest == Statusrequest.serverfailure
        ? Center(child: Lottie.asset(AppImageAsset.serverError,height: 200,width: 200))
        :widget;
  }
}

