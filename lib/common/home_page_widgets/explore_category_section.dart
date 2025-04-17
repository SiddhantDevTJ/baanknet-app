import 'package:baanknet/common/global_widgets/my_image.dart';
import 'package:baanknet/utils/theme/my_image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme/app_theme.dart';

class ExploreCatogerySection extends StatefulWidget {
  const ExploreCatogerySection({Key? key}) : super(key: key);

  @override
  State<ExploreCatogerySection> createState() => _ExploreCategorySectionState();
}

class _ExploreCategorySectionState extends State<ExploreCatogerySection> {
  // Selected segment index (0 for Real Estate, 1 for Automobiles)
  int _selectedIndex = 0;

  // Sample real estate data
  final List<Map<String, dynamic>> _realEstateProperties = [
    {
      'imageUrl': MyImagePath.imageProd,
      'title': 'Individual House for Sale in Mirzapur',
      'category': 'Residential',
      'price': '₹ 1.20 Crore',
      'location': 'Mirzapur',
    },
    {
      'imageUrl': MyImagePath.imageProd,
      'title': 'Commercial Space for Sale in Varanasi',
      'category': 'Commercial',
      'price': '₹ 2.50 Crore',
      'location': 'Varanasi',
    },
    {
      'imageUrl': MyImagePath.imageProd,
      'title': 'Luxury Apartment in Lucknow',
      'category': 'Residential',
      'price': '₹ 95 Lakh',
      'location': 'Lucknow',
    },
    {
      'imageUrl': MyImagePath.imageProd,
      'title': 'Plot for Sale in Allahabad',
      'category': 'Land',
      'price': '₹ 75 Lakh',
      'location': 'Allahabad',
    },
  ];

  // Sample automobile data
  final List<Map<String, dynamic>> _automobileProperties = [
    {
      'imageUrl': MyImagePath.imageProd,
      'title': 'Maruti Suzuki Swift',
      'category': 'Hatchback',
      'price': '₹ 7.50 Lakh',
      'location': 'Varanasi',
    },
    {
      'imageUrl': MyImagePath.imageProd,
      'title': 'Toyota Fortuner 4x4',
      'category': 'SUV',
      'price': '₹ 42.50 Lakh',
      'location': 'Lucknow',
    },
    {
      'imageUrl': MyImagePath.imageProd,
      'title': 'Honda City 2022',
      'category': 'Sedan',
      'price': '₹ 12.75 Lakh',
      'location': 'Prayagraj',
    },
    {
      'imageUrl': MyImagePath.imageProd,
      'title': 'Royal Enfield Classic 350',
      'category': 'Motorcycle',
      'price': '₹ 1.90 Lakh',
      'location': 'Gorakhpur',
    },
  ];

  // Get the current list based on selected index
  List<Map<String, dynamic>> get _currentList => _selectedIndex == 0 ? _realEstateProperties : _automobileProperties;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      height: 418.h,
      margin: EdgeInsets.symmetric(vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text('Explore Assets by Category', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
          ),
          SizedBox(height: 12.h),
          // Segmented Control with tap functionality
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      decoration: BoxDecoration(
                        color: _selectedIndex == 0 ? Colors.black : Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          bottomLeft: Radius.circular(20.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Real Estate',
                          style: TextStyle(
                            color: _selectedIndex == 0 ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      decoration: BoxDecoration(
                        color: _selectedIndex == 1 ? Colors.black : Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Automobiles',
                          style: TextStyle(
                            color: _selectedIndex == 1 ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),

          Container(
            height: 280.h,
            margin: EdgeInsets.only(left: 24.w), // Set fixed height for the horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _currentList.length,

              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final item = _currentList[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: PropertyCard(
                    imageUrl: item['imageUrl'],
                    title: item['title'],
                    category: item['category'],
                    price: item['price'],
                    location: item['location'],
                  ),
                );
              },
            ),
          ),
          // SizedBox(height: 10.h),
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _selectedIndex == 0 ? 'See all Properties' : 'See all Vehicles',
                    style: TextStyle(
                      color: AppTheme.secondaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Icon(Icons.arrow_forward, color: AppTheme.secondaryColor, size: 16.r),
                ],
              ),
            ),
          ),
        ],
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
    return Container(
      width: 220.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Image

          // Property Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12.h,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(imageUrl, height: 135, fit: BoxFit.cover),
              ),
              // Property Title
              Text(
                title,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              Text(category, style: TextStyle(color: AppTheme.greyColor, fontSize: 12, fontWeight: FontWeight.w400)),

              // Price

              // Location
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      // color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(location, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
