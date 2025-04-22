import 'package:baanknet/common/global_widgets/my_svg.dart';
import 'package:baanknet/utils/theme/my_icon_path.dart';
import 'package:baanknet/utils/theme/my_image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme/app_theme.dart';

class BidLiveSection extends StatelessWidget {
  const BidLiveSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
      child: Column(
        children: [
          Row(
            children: [
              StatCard(icon: MyIconPath.moodHappy, value: '1.5M +', label: 'Happy customer'),
              SizedBox(width: 16.w),
              StatCard(icon: MyIconPath.buildingSkyscraper, value: '69447', label: 'Property Listed'),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              StatCard(icon: MyIconPath.hammer, value: '88192', label: 'Auction Conducted'),
              SizedBox(width: 16.w),
              StatCard(icon: MyIconPath.cash, value: '7181 Cr', label: 'Auctioned Property Value'),
            ],
          ),
        ],
      ),
    );
  }
}

// Assuming you have a StatCard class already, but if not, here's an implementation:
class StatCard extends StatelessWidget {
  final String icon;
  final String value;
  final String label;

  const StatCard({Key? key, required this.icon, required this.value, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.h),
      height: 96.h,
      width: 163.w,
      decoration: BoxDecoration(
        color: Color(0xFF212121),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppTheme.whiteColor, width: 0.5),
        // border: Border.all(color: Color(0xFF212121), width: 0.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon(icon, color: AppTheme.secondaryColor, size: 28.r),
          MySvg(assetName: icon, width: 24.w, height: 24.h),
          SizedBox(width: 12.w),
          Expanded(
            // This is the key change
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                SizedBox(height: 4.h),
                Text(
                  label,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                  maxLines: 2, // Allow up to 2 lines
                  style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
