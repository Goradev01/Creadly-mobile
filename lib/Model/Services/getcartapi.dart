import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Configure/baseurl.dart';

class GetCart {
  Future<Either<Exception, dynamic>> cartApi() async {
    String url = "${Baseurl().url}/api/v1/users/cart";
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String usertoken = pref.getString('AuthToken')!;
    try {
      final response = await http.get(
        Uri.parse(
          url,
        ),
        headers: {
          'Content-Type': 'application/json',
          "authorization": usertoken
        },
      );
      final data = jsonDecode(response.body);

      return Right([data][0]['cart']);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
