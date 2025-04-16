import 'package:baanknet/common/global_widgets/my_image.dart';
import 'package:baanknet/utils/theme/app_theme.dart';
import 'package:baanknet/utils/theme/my_image_path.dart';
import 'package:flutter/material.dart';

class LayeredContainerExample extends StatelessWidget {
  const LayeredContainerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 200,
        width: double.infinity, // Ensure full width
        // Don't set decoration with image here - we'll use a Stack instead
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            fit: StackFit.expand, // Make sure Stack fills the Container
            children: [
              // Layer 1: Background Image (bottom layer)
              Image.asset(
                MyImagePath.bg2, // Replace with your actual image path
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyImage(assetName: MyImagePath.unionBank),
                    // Bank name
                    const Text(
                      'Mega Auction of 800+',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),

                    // Auction text
                    const Text('Property across India', style: TextStyle(color: Colors.white, fontSize: 14)),
                    Text('Start from 28 Apr,2025', style: TextStyle(color: AppTheme.greyColor, fontSize: 14)),

                    const Spacer(), // Push the button to the bottom
                    // Button
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: const Text('View Details'),
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
