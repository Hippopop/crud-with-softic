import 'dart:developer';

import 'package:crud_with_softic/global/widgets/toast.dart';
import 'package:crud_with_softic/src/features/authentication/view/login_screen.dart';
import 'package:crud_with_softic/src/features/home/repository/database/product_repository.dart';
import 'package:crud_with_softic/src/features/home/repository/local/local_product_repository.dart';
import 'package:crud_with_softic/src/features/home/repository/models/product_data/product_data_model.dart';
import 'package:crud_with_softic/src/helpers/connectivity_check.dart';
import 'package:crud_with_softic/src/services/domain/database/request_handler.dart';
import 'package:crud_with_softic/src/services/domain/localstorage/hive_config.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductRepository _apiRepository = ProductRepository();
  final LocalProductRepository _localProductRepository =
      LocalProductRepository();

  bool loading = false;
  int currentPageIndex = 0;
  List<ProductDataModel> currentProductList = [];
  Future<void> getProductList([int? index]) async {
    if (await isConnected()) {
      try {
        if (loading || (index != null && index < currentPageIndex)) return;
        loading = true;
        final data = await _apiRepository.requestProductList(currentPageIndex);
        if (data != null) {
          if (data.isNotEmpty) {
            currentPageIndex = currentPageIndex + 1;
            log(currentPageIndex.toString());
          }
          loading = false;
          currentProductList.addAll(data);
          _localProductRepository.addBatchProduct(data);
          update();
        } else {
          showToast('Product fetch Error!');
        }
      } catch (e, s) {
        log("#ProductGet", error: e, stackTrace: s);
        loading = false;
        if (e is RequestException) {
          showToast(e.msg);
          if (e.statusCode == 401) {
            HiveConfig().dispose();
            Get.offAll(() => const LoginScreen());
          }
        } else {
          showToast(e.toString());
        }
      }
    } else {
      showToast('Connect to network to update product list!');
      currentProductList.clear();
      currentProductList.addAll(_localProductRepository.productList);
    }
    update();
  }
}
