import 'package:creadlymobile/Model/Core/orderdata.dart';
// import 'package:creadlymobile/Model/Core/OrderData.dart';
import 'package:creadlymobile/Model/Services/orderapi.dart';
// import 'package:creadlymobile/Model/Services/productapi.dart';
import 'package:creadlymobile/Model/glitch.dart';
import 'package:creadlymobile/Model/nointernetglitch.dart';
import 'package:dartz/dartz.dart';

class OrderHelper {
  final api = OrderApi();
  Future<Either<Glitch, List<OrderData>>> getOrder(String usertoken) async {
    final apiResult = await api.orderApi(usertoken);
    return apiResult.fold((l) => Left(NoInternetGlitch()), (r) {
      List<OrderData> data =
          List.generate(r.length, (index) => OrderData.fromJson(r[index]));
      return Right(data);
    });
  }
}
