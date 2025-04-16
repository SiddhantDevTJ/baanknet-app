import 'package:baanknet/utils/theme/my_image_path.dart';
import 'package:flutter/material.dart';

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

    return Column(
      children: [
        // Header with title and "See all" button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              if (showSeeAll)
                TextButton(
                  onPressed: onSeeAllPressed,
                  child: Row(
                    children: [
                      Text(
                        'See all',
                        style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.arrow_forward, size: 16, color: Theme.of(context).colorScheme.secondary),
                    ],
                  ),
                ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Properties grid
        SizedBox(
          height: 240, // Fixed height for horizontal scrolling list
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: properties.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: index == properties.length - 1 ? 0 : 16),
                child: PropertyCard(property: properties[index]),
              );
            },
          ),
        ),
      ],
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
      width: 220,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
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
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Property ID
                Text(
                  property.id,
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 4),

                // Property Category
                Text(property.category, style: const TextStyle(color: Colors.white, fontSize: 16)),
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
            const SizedBox(height: 24),
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
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
