import 'package:baanknet/common/global_widgets/my_image.dart';
import 'package:baanknet/modules/home_page/promoter_bank/promorter_bank_controller.dart';
import 'package:baanknet/utils/theme/app_theme.dart';
import 'package:baanknet/utils/theme/my_image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PromoterBankSection extends StatelessWidget {
  const PromoterBankSection({super.key});

  @override
  Widget build(BuildContext context) {
    final PromoterBanksController banksController = Get.put(PromoterBanksController());

    // Call the API when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      banksController.fetchBanks();
    });

    return Container(
      color: AppTheme.whiteColor,
      padding: EdgeInsets.all(24.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Promoters Bank', style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: 24.h),

          // Use Obx to listen to the controller state
          Obx(() {
            if (banksController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (banksController.bankModel == null ||
                banksController.bankModel!.data == null ||
                banksController.bankModel!.data!.isEmpty) {
              return const Center(child: Text('No banks available'));
            } else {
              return SizedBox(
                height: 40.h, // Adjust the height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: banksController.bankModel!.data!.length,
                  itemBuilder: (context, index) {
                    final bank = banksController.bankModel!.data![index];
                    return Container(
                      margin: EdgeInsets.only(right: 16.w),
                      child: Column(
                        children: [
                          // Bank logo
                          Image.network(
                            "https://psb-alliance-uat-env-bucket.s3.ap-south-1.amazonaws.com/${bank.bankLogo!}",
                            width: 70.w,
                            height: 30.h,
                          ),
                          // SizedBox(height: 8.h),
                          // Bank name
                          // Text(
                          //   bank.bankName ?? 'Unknown Bank',
                          //   style: Theme.of(context).textTheme.bodySmall,
                          //   maxLines: 1,
                          //   overflow: TextOverflow.ellipsis,
                          // ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
