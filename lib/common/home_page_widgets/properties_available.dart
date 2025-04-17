import 'package:baanknet/utils/theme/my_image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme/app_theme.dart';

class PropertiesAvailable extends StatelessWidget {
  final Function() onSeeAllPressed;

  // Optional parameters to customize the component
  final String title;
  final int itemCount;
  final bool showSeeAll;

  const PropertiesAvailable({
    Key? key,
    required this.onSeeAllPressed,
    this.title = 'Properties Available',
    this.itemCount = 5,
    this.showSeeAll = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Generate properties list automatically
    final List<PropertyItem> properties = _generatePropertyItems(itemCount);

    return Container(
      color: AppTheme.whiteColor,
      child: Column(
        children: [
          // Header with title and "See all" button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 16.sp)),
                if (showSeeAll)
                  GestureDetector(
                    onTap: onSeeAllPressed,
                    child: Row(
                      children: [
                        Text(
                          'See all',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(Icons.arrow_forward, size: 16.r, color: Theme.of(context).colorScheme.secondary),
                      ],
                    ),
                  ),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          // Properties grid
          SizedBox(
            height: 240.h, // Fixed height for horizontal scrolling list
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              itemCount: properties.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: index == properties.length - 1 ? 0 : 16.w),
                  child: PropertyCard(property: properties[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Method to automatically generate property items
  List<PropertyItem> _generatePropertyItems(int count) {
    // Define categories and IDs
    final List<String> categories = ['Residential', 'Commercial', 'Agricultural', 'Industrial'];
    final List<String> propertyIds = ['41864', '52431', '38975', '67290', '45112'];

    // Define image paths (replace with your actual paths)
    final List<String> imagePaths = [
      MyImagePath.imageProd,
      MyImagePath.imageProd,
      MyImagePath.imageProd,
      MyImagePath.imageProd,
    ];

    // Generate the properties
    List<PropertyItem> items = [];
    for (int i = 0; i < count; i++) {
      items.add(
        PropertyItem(
          id: propertyIds[i % propertyIds.length],
          category: categories[i % categories.length],
          imageUrl: imagePaths[i % imagePaths.length],
        ),
      );
    }

    return items;
  }
}

class PropertyCard extends StatelessWidget {
  final PropertyItem property;

  const PropertyCard({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Stack(
        children: [
          // Property Image
          Positioned.fill(child: Image.asset(property.imageUrl, fit: BoxFit.cover)),

          // Gradient overlay for better text readability
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
            ),
          ),

          // Property ID and Category
          Positioned(
            bottom: 16.h,
            left: 16.w,
            right: 16.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Property ID
                Text(property.id, style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600)),

                SizedBox(height: 4.h),

                // Property Category
                Text(
                  property.category,
                  style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyItem {
  final String id;
  final String category;
  final String imageUrl;

  PropertyItem({required this.id, required this.category, required this.imageUrl});
}

// Example usage:
class PropertiesAvailableExample extends StatelessWidget {
  const PropertiesAvailableExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7F4), // Light background color from your theme
      appBar: AppBar(title: const Text('BaankNet')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.h),
            PropertiesAvailable(
              onSeeAllPressed: () {
                // Navigate to all properties screen
                print('See all properties pressed');
              },
              // Optional: Customize the component
              // title: 'Featured Properties',
              // itemCount: 3,
              // showSeeAll: true,
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
