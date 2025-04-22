import 'package:baanknet/utils/theme/app_theme.dart';
import 'package:baanknet/utils/theme/my_image_path.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LayeredContainerExample extends StatefulWidget {
  const LayeredContainerExample({Key? key}) : super(key: key);

  @override
  State<LayeredContainerExample> createState() => _LayeredContainerExampleState();
}

class _LayeredContainerExampleState extends State<LayeredContainerExample> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  // Sample list of image URLs - replace with your own images
  final List<String> imageList = [MyImagePath.homePageBanner, MyImagePath.homePageBanner, MyImagePath.homePageBanner];

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      height: 230.h,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 200.h,
            child: CarouselSlider(
              items:
                  imageList.map((imageUrl) {
                    return Container(
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 6.0)],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(imageUrl, fit: BoxFit.cover, width: double.maxFinite),
                      ),
                    );
                  }).toList(),
              carouselController: _carouselController,
              options: CarouselOptions(
                // enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 10.h),

          // Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _carouselController.animateToPage(entry.key),
                    child: Container(
                      width: 8.w,
                      height: 8.h,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.blackColor.withOpacity(_currentIndex == entry.key ? 0.9 : 0.3),
                      ),
                    ),
                  );
                }).toList(),
          ),
          // const SizedBox(height: 30),
          // Navigation buttons
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ElevatedButton(
          //       onPressed:
          //           () => _carouselController.previousPage(
          //             duration: const Duration(milliseconds: 300),
          //             curve: Curves.easeIn,
          //           ),
          //       child: const Icon(Icons.arrow_back),
          //     ),
          //     const SizedBox(width: 20),
          //     ElevatedButton(
          //       onPressed:
          //           () =>
          //               _carouselController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn),
          //       child: const Icon(Icons.arrow_forward),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
