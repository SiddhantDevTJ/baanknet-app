import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../modules/home_page/home_page.dart';
import '../../utils/theme/app_theme.dart';

class UpcomingPropertyAuction extends StatelessWidget {
  const UpcomingPropertyAuction({super.key});

  Widget _buildPropertyTypeTab(String text, bool isSelected) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0.w),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: isSelected ? AppTheme.secondaryColor : AppTheme.greyColor,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 8.h),
          if (isSelected) Container(height: 2.h, width: 60.w, color: AppTheme.secondaryColor),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFF7F3),
      padding: EdgeInsets.symmetric(vertical: 24.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Upcoming Auctions in 30 Days',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 12.h),

          // Category Tabs
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        bottomLeft: Radius.circular(20.r),
                      ),
                    ),
                    child: Center(
                      child: Text('Real Estate', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r),
                      ),
                    ),
                    child: Center(
                      child: Text('Automobiles', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),

          // Property Type Tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Row(
              children: [
                _buildPropertyTypeTab('Residential', true),
                _buildPropertyTypeTab('Commercial', false),
                _buildPropertyTypeTab('Agricultural', false),
                _buildPropertyTypeTab('Industrial', false),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // Auction Cards
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Row(
              children: [
                AuctionCard(
                  id: '105539',
                  title: 'Flat for Sale in Himachal Pradesh',
                  bank: 'Bank of Baroda',
                  location: 'Bengaluru, Karnataka',
                  days: '08',
                  hours: '08',
                  mins: '08',
                ),
                SizedBox(width: 16.w),
                AuctionCard(
                  id: '105539',
                  title: 'Flat for Sale in Himachal Pradesh',
                  bank: 'Bank of Baroda',
                  location: 'Bengaluru, Karnataka',
                  days: '08',
                  hours: '08',
                  mins: '08',
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          // See all auctions button
          Center(
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'See all auctions',
                    style: TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.w700, fontSize: 12.sp),
                  ),
                  SizedBox(width: 5.w),
                  Icon(Icons.arrow_forward, color: AppTheme.secondaryColor, size: 16.sp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuctionCard extends StatelessWidget {
  final String id;
  final String title;
  final String bank;
  final String location;
  final String days;
  final String hours;
  final String mins;

  const AuctionCard({
    Key? key,
    required this.id,
    required this.title,
    required this.bank,
    required this.location,
    required this.days,
    required this.hours,
    required this.mins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 5)],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(id, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp)),
            SizedBox(height: 4.h),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 13.h),
            Text(bank, style: TextStyle(color: Colors.grey[700], fontSize: 12.sp, fontWeight: FontWeight.w400)),
            SizedBox(height: 4.h),
            Text(location, style: TextStyle(color: Colors.grey[700], fontSize: 12.sp, fontWeight: FontWeight.w400)),
            SizedBox(height: 16.h),
            Container(
              // color: const Color(0xFFFCF8F6),
              decoration: BoxDecoration(color: const Color(0xFFFCF8F6), borderRadius: BorderRadius.circular(0.r)),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_buildTimeBox(days, 'days'), _buildTimeBox(hours, 'hours'), _buildTimeBox(mins, 'mins')],
              ),
            ),
            SizedBox(height: 16.h),
            // Property Detail Button
            GestureDetector(
              onTap: () {},

              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 7.h),
                decoration: BoxDecoration(
                  // side: BorderSide(color: AppTheme.secondaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  border: Border.all(color: AppTheme.secondaryColor),
                ),
                child: Center(
                  child: Text(
                    'Property Detail',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp, color: AppTheme.secondaryColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            // Auction Detail Button
            GestureDetector(
              onTap: () {},

              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 7.h),
                decoration: BoxDecoration(
                  color: AppTheme.secondaryColor,
                  // side: BorderSide(color: AppTheme.secondaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  border: Border.all(color: AppTheme.secondaryColor),
                ),
                child: Center(
                  child: Text(
                    'Property Detail',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp, color: AppTheme.whiteColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeBox(String value, String label) {
    return Container(
      width: 60.w,
      padding: EdgeInsets.symmetric(vertical: 10.h),

      child: Column(
        children: [
          Text(value, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp)),
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 11.sp)),
        ],
      ),
    );
  }
}
