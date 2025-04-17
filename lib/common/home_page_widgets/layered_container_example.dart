import 'package:baanknet/common/global_widgets/my_image.dart';
import 'package:baanknet/utils/theme/app_theme.dart';
import 'package:baanknet/utils/theme/my_image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LayeredContainerExample extends StatelessWidget {
  const LayeredContainerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 10.h),
      child: Container(
        height: 192.h,
        width: 342.w, // Ensure full width
        // Don't set decoration with image here - we'll use a Stack instead
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Stack(
            fit: StackFit.expand, // Make sure Stack fills the Container
            children: [
              // Layer 1: Background Image (bottom layer)
              Image.asset(
                MyImagePath.bg2,
                // Replace with your actual image path
                fit: BoxFit.cover,
              ),

              // Layer 2: Gradient Overlay (middle layer)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.2), // Reduced opacity at top
                      Colors.black.withOpacity(0.5), // Stronger opacity at bottom
                    ],
                  ),
                ),
              ),

              // Layer 3: Content (top layer)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyImage(assetName: MyImagePath.unionBank, width: 94.w, height: 20.h),
                    SizedBox(height: 16.h),
                    // Bank name
                    Text(
                      'Mega Auction of 800+ \n Property across India',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),

                    SizedBox(height: 2.h),

                    Text('Start from 28 Apr,2025', style: TextStyle(color: AppTheme.greyColor, fontSize: 11.sp)),
                    SizedBox(height: 22.h),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      ),
                      child: Text('Explore Now', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
