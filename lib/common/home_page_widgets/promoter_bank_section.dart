import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme/my_image_path.dart';

class PromoterBankSection extends StatelessWidget {
  const PromoterBankSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Promoters Bank', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(MyImagePath.image39),
              Image.asset(MyImagePath.image40),
              Image.asset(MyImagePath.image41),
              Image.asset(MyImagePath.image42),
            ],
          ),
        ],
      ),
    );
  }
}
