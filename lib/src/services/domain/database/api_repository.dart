import 'package:crud_with_softic/src/services/domain/database/request_handler.dart';
import 'package:get/get.dart';

abstract class ApiRepository {
  final RequestHandler requestHandler = Get.find<RequestHandler>();
}

enum CustomResponseStatus {
  success,
  failure,
  unknown,
}
