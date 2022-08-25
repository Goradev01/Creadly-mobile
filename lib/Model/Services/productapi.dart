import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../Configure/baseurl.dart';

class ProductApi {
  String endpoint = "${Baseurl().url}/api/v1/products";

  Future<Either<Exception, dynamic>> productApi() async {
    try {
      final response = await http.get(
        Uri.parse(
          endpoint,
        ),
        headers: {'Content-Type': 'application/json'},
      );
      final data = jsonDecode(response.body);

      return Right(data);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, dynamic>> productCategoryApi(String id) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$endpoint/category/$id',
        ),
        headers: {'Content-Type': 'application/json'},
      );
      final data = jsonDecode(response.body);

      return Right(data);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, dynamic>> perProduct(String id) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$endpoint/$id',
        ),
        headers: {'Content-Type': 'application/json'},
      );
      final data = jsonDecode(response.body);

      return Right(data);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, dynamic>> productMerchantApi(String id) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$endpoint/category/$id',
        ),
        headers: {'Content-Type': 'application/json'},
      );
      final data = jsonDecode(response.body);

      return Right(data);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, dynamic>> productHotDeal() async {
    try {
      final response = await http.get(
        Uri.parse(
          '$endpoint/hot',
        ),
        headers: {'Content-Type': 'application/json'},
      );
      final data = jsonDecode(response.body);

      return Right(data);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
