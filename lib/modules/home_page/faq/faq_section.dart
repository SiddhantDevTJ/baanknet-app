import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/theme/app_theme.dart';
import 'faq_controller.dart';
import 'faq_model.dart';

class FaqSection extends StatefulWidget {
  const FaqSection({super.key});

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  final FaqController _controller = Get.put(FaqController());
  final RxList<int> expandedIndexes = <int>[].obs;

  @override
  void initState() {
    super.initState();
    // Fetch FAQs when the widget initializes
    _controller.fetchFaqs(1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.whiteColor,
      padding: EdgeInsets.all(24.0.r),
      child: GetBuilder<FaqController>(
        builder: (_) {
          if (_controller.isLoading.value) {
            return Center(child: CircularProgressIndicator(color: AppTheme.secondaryColor));
          }

          final faqs = _controller.faqModel?.data ?? [];

          if (faqs.isEmpty) {
            return Center(child: Text('No FAQs available', style: TextStyle(fontSize: 14.sp, color: Colors.grey[700])));
          }

          final int limit = faqs.length >= 5 ? 5 : faqs.length;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('FAQ\'s', style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: 16.h),
              Divider(color: Colors.grey[300], thickness: 1.0, height: 1.0),

              ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: limit,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => Divider(color: Colors.grey[300], thickness: 1.0, height: 1.0),
                itemBuilder: (context, index) {
                  return _buildFaqItem(faqs[index], index);
                },
              ),

              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      'See all questions',
                      style: TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8.w),
                    Icon(Icons.arrow_forward, size: 18.sp, color: AppTheme.secondaryColor),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFaqItem(Data item, int index) {
    final isExpanded = expandedIndexes.contains(index);

    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (isExpanded) {
                expandedIndexes.remove(index);
              } else {
                expandedIndexes.clear();
                expandedIndexes.add(index);
              }
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    item.faqQuestion ?? '',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp, color: Colors.black),
                  ),
                ),
                _buildIcon(isExpanded),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox(height: 0),
          secondChild: Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(item.faqAnswer ?? '', style: TextStyle(fontSize: 12.sp, color: Colors.grey[700])),
            ),
          ),
          crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }

  Widget _buildIcon(bool isExpanded) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: Icon(
        isExpanded ? Icons.remove : Icons.add,
        key: ValueKey<bool>(isExpanded),
        color: AppTheme.blackColor.withOpacity(0.6),
      ),
    );
  }
}
