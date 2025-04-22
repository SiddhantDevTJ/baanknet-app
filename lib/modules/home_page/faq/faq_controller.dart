import 'dart:developer';

import 'package:get/get.dart';
import '../../../common/service_helper/api_path.dart';
import '../../../common/service_helper/dio_helper.dart';
import '../../../common/service_helper/error_helper.dart';
import 'faq_model.dart';
import 'package:dio/dio.dart';

class FaqController extends GetxController {
  var isLoading = false.obs;
  FaqModel? faqModel;
  DioApi dioApi = DioApi();

  Future<void> fetchFaqs(int languageId) async {
    isLoading.value = true;
    update(); // Update UI to show loading state

    try {
      final response = await dioApi.sendRequest.get(ApiPath.faqs, queryParameters: {'languageId': languageId});

      if (response.statusCode == 200) {
        faqModel = FaqModel.fromJson(response.data);
        log("FAQ data loaded successfully: ${faqModel?.data?.length ?? 0} items");
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
