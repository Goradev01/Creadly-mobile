import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../Configure/baseurl.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class PaymentApi {
  String endpoint = "${Baseurl().url}/api/v1/users";

  Future<Either<Exception, dynamic>> paymentApi() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String usertoken = pref.getString('AuthToken')!;
    try {
      final response = await http.get(Uri.parse(endpoint), headers: {
        "Content-Type": "application/json",
        "authorization": usertoken,
      });
      final data = jsonDecode(response.body);

      return Right([data][0]['data']);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
