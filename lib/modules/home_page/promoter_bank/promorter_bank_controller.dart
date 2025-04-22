import 'dart:developer';

import 'package:baanknet/modules/home_page/promoter_bank/promoter_bank_model.dart';
import 'package:get/get.dart';
import '../../../common/service_helper/api_path.dart';
import '../../../common/service_helper/dio_helper.dart';
import '../../../common/service_helper/error_helper.dart';

import 'package:dio/dio.dart';

class PromoterBanksController extends GetxController {
  var isLoading = false.obs;
  PromoterBankModel? bankModel;
  DioApi dioApi = DioApi();

  Future<void> fetchBanks() async {
    isLoading.value = true;
    update(); // Update UI to show loading state

    try {
      final response = await dioApi.sendRequest.get(ApiPath.pBank);

      if (response.statusCode == 200) {
        bankModel = PromoterBankModel.fromJson(response.data);
        log("Banks data loaded successfully: ${bankModel?.data?.length ?? 0} items");
      }
    } on DioException catch (error) {
      String errorMessage = handleDioError(error);
      Get.snackbar("Error", errorMessage);
      log("Dio error: $errorMessage");
    } catch (e) {
      Get.snackbar("Error", e.toString());
      log("Unexpected error: ${e.toString()}");
    } finally {
      isLoading.value = false;
      update(); // Notify listeners that data is ready or there was an error
    }
  }
}
