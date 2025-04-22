import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../modules/home_page/home_page.dart';
import '../../utils/theme/app_theme.dart';
import '../../utils/theme/my_image_path.dart';
import '../global_widgets/my_image.dart';
import '../global_widgets/my_svg.dart';

class AboutBankNetSection extends StatelessWidget {
  const AboutBankNetSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppTheme.whiteColor,
          padding: EdgeInsets.all(24.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('About BAANKNET', style: Theme.of(context).textTheme.headlineSmall),
              Text('(Bank Asset Auction Network)', style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: 16.h),
              Text(
                'A state-of-the-art innovative property listing and e-auction platform designed specifically for banks and lending institutions, addressing recovery of Non-Performing Assets.',
                style: TextStyle(fontSize: 12.sp, color: Colors.black87),
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Read more',
                      style: TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.w600, fontSize: 12.sp),
                    ),
                    SizedBox(width: 5.w),
                    Icon(Icons.arrow_downward, color: AppTheme.secondaryColor, size: 16.r),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              // Features Grid
              Wrap(
                spacing: 12.w, // horizontal spacing between children
                runSpacing: 12.h, // vertical spacing between lines
                children: [
                  FeatureCard(title: 'From Search to sale', subtitle: 'One solution'),
                  FeatureCard(title: 'Seamless Process', subtitle: 'Transparent &'),
                  FeatureCard(title: 'Property & Auction', subtitle: 'Simple Search'),
                  FeatureCard(title: 'Smart Auctions', subtitle: '& Fair Pricing'),
                  FeatureCard(title: 'Seamless Process', subtitle: 'Transparent &'),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('An initiative of'),
                        SizedBox(height: 10.h),

                        Row(
                          children: [
                            MyImage(assetName: MyImagePath.image22, height: 30.h, width: 110.w),
                            SizedBox(width: 16.w),
                            MyImage(assetName: MyImagePath.image24),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('Powered by'),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            MySvg(assetName: MyImagePath.psbAlliance, color: AppTheme.greyColor, width: 60.w),
                            SizedBox(width: 10.w),

                            MyImage(assetName: MyImagePath.baankknet, width: 90.w),
                            SizedBox(width: 10.w),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
