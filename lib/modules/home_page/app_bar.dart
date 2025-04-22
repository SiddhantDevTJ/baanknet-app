import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/global_widgets/my_image.dart';
import '../../common/global_widgets/my_svg.dart';
import '../../common/home_page_widgets/about_banknet_section.dart';
import '../../common/home_page_widgets/bid_live_section.dart';
import '../../common/home_page_widgets/explore_category_section.dart';
import 'faq/faq_section.dart';
import '../../common/home_page_widgets/layered_container_example.dart';
import 'promoter_bank/promoter_bank_section.dart';
import '../../common/home_page_widgets/properties_available.dart';
import '../../common/home_page_widgets/upcoming_property_auction.dart';
import '../../utils/theme/app_theme.dart';
import '../../utils/theme/my_image_path.dart';

class SliverAppBarExample extends StatelessWidget {
  const SliverAppBarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a ScrollController to synchronize scrolling
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            expandedHeight: 400.h,
            title: Row(
              children: [
                Icon(Icons.menu, size: 30.sp),
                SizedBox(width: 30.w),
                MyImage(assetName: MyImagePath.baankknet, color: AppTheme.whiteColor),
                SizedBox(width: 10.w),
                Container(width: 1.w, height: 24.h, color: Colors.white30),
                SizedBox(width: 10.w),
                MySvg(assetName: MyImagePath.psbAlliance, color: AppTheme.whiteColor),
                const Spacer(),
              ],
            ),
            backgroundColor: AppTheme.primaryColor,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final bool isCollapsed = constraints.maxHeight <= kToolbarHeight + MediaQuery.of(context).padding.top;

                return FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  title:
                      isCollapsed == true
                          ? Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                print('tap');
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 0, bottom: 15.h, left: 0, right: 12.w),
                                child: Icon(Icons.search, color: Colors.white, size: 24.sp),
                              ),
                            ),
                          )
                          : SizedBox(),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(MyImagePath.appBarImage2, fit: BoxFit.cover),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black.withOpacity(0.3), Colors.black.withOpacity(0.7)],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120.h,
                        right: 20.w,
                        left: 20.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30.h),
                            Text(
                              'Your Search for a Property \n ends here',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24.sp),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'An advanced property listing and e-auction \n platform tailored for banks and lenders.',
                              style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 30.h),
                            Container(
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
                              width: double.maxFinite,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Content wrapped in a single SliverToBoxAdapter for smoother scrolling
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                LayeredContainerExample(),
                SizedBox(height: 20.h),

                // Property Listings
                ExploreCatogerySection(),
                SizedBox(height: 10.h),

                // Bid Live Section
                BidLiveSection(),

                // Upcoming Auctions Section
                UpcomingPropertyAuction(),

                SizedBox(height: 5.h),

                // About BaankNet Section
                AboutBankNetSection(),

                SizedBox(height: 5.h),

                // Properties Available
                PropertiesAvailable(onSeeAllPressed: () {}),
                SizedBox(height: 5),

                PromoterBankSection(),
                SizedBox(height: 5),

                // FAQ Section
                FaqSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
