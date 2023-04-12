import 'dart:developer';

import 'package:crud_with_softic/global/widgets/toast.dart';
import 'package:crud_with_softic/src/features/home/repository/database/product_repository.dart';
import 'package:crud_with_softic/src/features/home/repository/models/product_data/product_data_model.dart';
import 'package:crud_with_softic/src/helpers/connectivity_check.dart';
import 'package:crud_with_softic/src/services/domain/database/request_handler.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductRepository _apiRepository = ProductRepository();

  List<ProductDataModel> currentProductList = [];

  Future<void> getProductList(int page) async {
    if (await isConnected()) {
      try {
        final data = await _apiRepository.requestProductList(page);
        if (data != null) {
          currentProductList.addAll(data);
          update();
          showToast("Profile data updated!");
        } else {
          showToast('Profile fetch Error!');
        }
      } catch (e, s) {
        log("#Login", error: e, stackTrace: s);
        if (e is RequestException) {
          showToast(e.msg);
          if (e.statusCode == 401) {
            // HiveConfig.dispose();
            update();
          }
        } else {
          showToast(e.toString());
        }
      }
    } else {
      showToast('Connect to network to update profile!');
      // currentUserProfile = _localAuthRepo.currentProfile;
      update();
    }
  }
}
