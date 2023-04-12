import 'dart:developer';

import 'package:crud_with_softic/src/features/home/repository/models/product_data/product_data_model.dart';
import 'package:crud_with_softic/src/services/domain/database/api_repository.dart';
import 'package:crud_with_softic/src/services/domain/database/request_handler.dart';

class ProductRepository extends ApiRepository {
  static const getProductsPath = '/products';
/*   Future<String?> requestLogin({required LoginRequest requestData}) async {
    final res = await requestHandler.post(loginPath, requestData.toJson());
    if (res is! RequestException) {
      try {
        return (res as Map<String, String>)['id_token'];
      } catch (e, s) {
        log('#UNCAUGHT ERROR', error: e, stackTrace: s);
        rethrow;
      }
    } else {
      throw res;
    }
  } */

  Future<List<ProductDataModel>?> requestProductList(int page) async {
    final res = await requestHandler.get(getProductsPath, queryParams: {
      'size': 20,
      'page': page,
    });

    if (res is! RequestException) {
      try {
        return (res as List)
            .map(
              (e) => ProductDataModel.fromJson(
                Map.from(e),
              ),
            )
            .toList();
      } catch (e, s) {
        log('#UNCAUGHT ERROR', error: e, stackTrace: s);
        rethrow;
      }
    } else {
      throw res;
    }
  }
}
