import 'package:baanknet/common/global_widgets/my_image.dart';
import 'package:baanknet/common/global_widgets/my_svg.dart';
import 'package:baanknet/common/home_page_widgets/about_banknet_section.dart';
import 'package:baanknet/common/home_page_widgets/bid_live_section.dart';
import 'package:baanknet/common/home_page_widgets/faq_section.dart';
import 'package:baanknet/common/home_page_widgets/promoter_bank_section.dart';
import 'package:baanknet/common/home_page_widgets/explore_category_section.dart';
import 'package:baanknet/common/home_page_widgets/upcoming_property_auction.dart';
import 'package:baanknet/utils/theme/app_theme.dart';
import 'package:baanknet/utils/theme/my_icon_path.dart';
import 'package:baanknet/utils/theme/my_image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/home_page_widgets/layered_container_example.dart';
import '../../common/home_page_widgets/properties_available.dart';
import 'app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with blue background
              Stack(
                children: [
                  // Background Image
                  Positioned.fill(child: Image.asset(MyImagePath.bg, fit: BoxFit.fitWidth)),

                  // Gradient Overlay
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppTheme.primaryColor.withOpacity(0.8), AppTheme.primaryColor.withOpacity(0.3)],
                        ),
                      ),
                    ),
                  ),

                  // Content
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo and menu
                      Padding(
                        padding: EdgeInsets.all(16.0.r),
                        child: Row(
                          children: [
                            IconButton(icon: Icon(Icons.menu, color: Colors.white), onPressed: () {}),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Row(
                                children: [
                                  MyImage(assetName: MyImagePath.baankknet, color: AppTheme.whiteColor),
                                  SizedBox(width: 10.w),
                                  Container(width: 1.w, height: 24.h, color: Colors.white30),
                                  SizedBox(width: 10.w),
                                  MySvg(assetName: MyImagePath.psbAlliance, color: AppTheme.whiteColor),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Hero text
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30.h),
                            Text(
                              'Your Search for a Property ends here',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24.sp),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'An advanced property listing and e-auction platform tailored for banks and lenders.',
                              style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 30.h),
                          ],
                        ),
                      ),

                      // Search bar
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search "Property"...',
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w600),
                              suffixIcon: Icon(Icons.search, color: AppTheme.secondaryColor),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 70.h),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // Mega Auction Banner
              LayeredContainerExample(),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Divider(height: 1, color: AppTheme.homeDividerColor, thickness: 3),
              ),

              // Property Listings
              ExploreCatogerySection(),

              Divider(height: 1, color: AppTheme.homeDividerColor, thickness: 3),
              // Bid Live Section
              BidLiveSection(),

              // Upcoming Auctions Section
              UpcomingPropertyAuction(),

              Divider(height: 1, color: AppTheme.homeDividerColor, thickness: 3),

              // About BaankNet Section
              AboutBankNetSection(),

              Divider(height: 1, color: AppTheme.homeDividerColor, thickness: 3),

              // Properties Available
              PropertiesAvailable(onSeeAllPressed: () {}),

              Divider(height: 1, color: AppTheme.homeDividerColor.withOpacity(0.1), thickness: 3),

              // Promoters Bank Section
              PromoterBankSection(),

              Divider(height: 1, color: AppTheme.homeDividerColor, thickness: 3),

              // FAQ Section
              FaqSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String category;
  final String price;
  final String location;

  const PropertyCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.price,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(imageUrl, height: 120.h, width: double.infinity, fit: BoxFit.cover),
        ),
        SizedBox(height: 8.h),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4.h),
        Text(category, style: TextStyle(color: Colors.grey[600], fontSize: 14.sp)),
        SizedBox(height: 6.h),
        Row(
          children: [
            Text(price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
            SizedBox(width: 8.w),
            Icon(Icons.location_on, size: 16.r, color: Colors.grey[600]),
            Text(location, style: TextStyle(color: Colors.grey[600], fontSize: 14.sp)),
          ],
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const StatCard({Key? key, required this.icon, required this.value, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.grey[800]!),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 24.r),
          SizedBox(height: 8.h),
          Text(value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.sp)),
          SizedBox(height: 4.h),
          Text(label, style: TextStyle(color: Colors.grey[400], fontSize: 14.sp)),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const FeatureCard({Key? key, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105.w,
      height: 107.h,
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(color: AppTheme.lightOrange, borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MySvg(assetName: MyIconPath.squareRoundedCheckFilled),
          SizedBox(height: 6.h),
          Text(subtitle, style: TextStyle(color: Colors.grey[700], fontSize: 10.sp, fontWeight: FontWeight.w400)),
          SizedBox(height: 4.h),
          Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp)),
        ],
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;
  final bool isExpanded;

  const FaqItem({Key? key, required this.question, required this.answer, this.isExpanded = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(question, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp))),
            Icon(isExpanded ? Icons.remove : Icons.add, color: Colors.black),
          ],
        ),
        if (isExpanded) ...[
          SizedBox(height: 8.h),
          Text(answer, style: TextStyle(color: Colors.grey[700], fontSize: 14.sp)),
        ],
      ],
    );
  }
}
