import 'package:creadlymobile/Model/Core/wishlist.dart';
import 'package:creadlymobile/Model/Services/wishlistapi.dart';
import 'package:creadlymobile/Model/nointernetglitch.dart';
import 'package:dartz/dartz.dart';
import '../glitch.dart';

class WishListHelper {
  final api = WishListApi();
  Future<Either<Glitch, List<WishListData>>> getData() async {
    final apiResult = await api.wishListApi();
    return apiResult.fold((l) => Left(NoInternetGlitch()), (r) {
      List<WishListData> data =
          List.generate(r.length, (index) => WishListData.fromJson(r[index]));
      return Right(data);
    });
  }

  Future<Either<Exception, dynamic>> removeWishList(String productId) async {
    final apiResult = await api.removeWishList(productId);
    return apiResult.fold((l) => Left(l), (r) => Right(r));
  }
}
