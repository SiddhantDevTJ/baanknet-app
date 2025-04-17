import 'package:baanknet/common/global_widgets/my_image.dart';
import 'package:baanknet/utils/theme/my_image_path.dart';
import 'package:flutter/material.dart';

class PropertyHorizontalList extends StatelessWidget {
  const PropertyHorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample property data - replace with your actual data source
    final List<Map<String, dynamic>> properties = [
      {
        'imageUrl': MyImagePath.imageProd, // Replace with MyImagePath.imageProd
        'title': 'Individual House for Sale in Mirzapur',
        'category': 'Residential',
        'price': '₹ 1.20 Crore',
        'location': 'Mirzapur',
      },
      {
        'imageUrl': MyImagePath.imageProd, // Replace with MyImagePath.imageProd
        'title': 'Commercial Space for Sale in Varanasi',
        'category': 'Commercial',
        'price': '₹ 2.50 Crore',
        'location': 'Varanasi',
      },
      {
        'imageUrl': MyImagePath.imageProd, // Replace with MyImagePath.imageProd
        'title': 'Luxury Apartment in Lucknow',
        'category': 'Residential',
        'price': '₹ 95 Lakh',
        'location': 'Lucknow',
      },
      {
        'imageUrl': MyImagePath.imageProd, // Replace with MyImagePath.imageProd
        'title': 'Plot for Sale in Allahabad',
        'category': 'Land',
        'price': '₹ 75 Lakh',
        'location': 'Allahabad',
      },
      // Add more property items as needed
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 12),

          // Horizontal ListView
          SizedBox(
            height: 320, // Set fixed height for the horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: properties.length,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final property = properties[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: SizedBox(
                    width: 260, // Fixed width for each card
                    child: PropertyCard(
                      imageUrl: property['imageUrl'],
                      title: property['title'],
                      category: property['category'],
                      price: property['price'],
                      location: property['location'],
                    ),
                  ),
                );
              },
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(imageUrl, height: 160, width: double.infinity, fit: BoxFit.cover),
          ),

          // Property Details
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Property Title
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 8),
                Text(
                  category,
                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12, fontWeight: FontWeight.bold),
                ),

                // Price
                const SizedBox(height: 8),

                // Location
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
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
          ),
        ],
      ),
    );
  }
}
