import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:pulse_cart/core/class/statusrequest.dart';
import 'package:pulse_cart/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<Statusrequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        print("HTTP Status: ${response.statusCode}");
        print("HTTP body: ${response.body}");
        Map responsebody = jsonDecode(response.body);
        // print(responsebody);
        return Right(responsebody);
      } else {
        return Left(Statusrequest.offlinefailure);
      }
    } catch (_) {
      return Left(Statusrequest.serverfailure);
    }
  }

  Future<Either<Statusrequest, Map>> getData(
    String linkurl, {
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      if (await checkInternet()) {
        final uri = Uri.parse(linkurl).replace(queryParameters: data);

        final headers = {
          'Accept': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        };

        var response = await http.get(uri, headers: headers);
        //   print('GET URL: $uri');
        // print('HTTP Status: ${response.statusCode}');
        // print('HTTP Body: ${response.body}');
        Map responsebody = jsonDecode(response.body);
        // print(responsebody);
        return Right(responsebody);
      } else {
        return Left(Statusrequest.offlinefailure);
      }
    } catch (_) {
      return Left(Statusrequest.serverfailure);
    }
  }
}
