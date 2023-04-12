import 'dart:convert';

import 'package:crud_with_softic/src/features/home/repository/models/product_data/product_data_model.dart';
import 'package:crud_with_softic/src/services/domain/localstorage/hive_config.dart';

class LocalProductRepository {
  final config = HiveConfig();

  List<ProductDataModel> get productList {
    return config.productBox.values
        .map(
          (e) => ProductDataModel.fromJson(
            json.decode(e),
          ),
        )
        .toList();
  }

  addSingleProduct(ProductDataModel data) => config.productBox.put(
      data.id,
      json.encode(
        data.toJson(),
      ));

  addBatchProduct(List<ProductDataModel> data) {
    for (var element in data) {
      addSingleProduct(element);
    }
  }

  deleteProduct(int id) {
    config.productBox.delete(id);
  }
}
