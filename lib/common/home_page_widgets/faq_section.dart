import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme/app_theme.dart';

class FaqSection extends StatefulWidget {
  const FaqSection({super.key});

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  final List<FaqItem> _faqItems = [
    FaqItem(
      question: 'What is eAuction',
      answer:
          'To participate as a Bidder, registration is a simple process. Go to the registration form from the homepage. Select "Register as Individual or Company" and fill out all required details, completing eKYC online.',
      isExpanded: true,
    ),
    FaqItem(
      question: 'What is Bidder',
      answer:
          'A Bidder is an individual or entity that participates in auction events by placing bids on items or properties being auctioned.',
      isExpanded: false,
    ),
    FaqItem(
      question: 'How Can a Bidder Register on the Auction Portal?',
      answer:
          'To register as a Bidder, visit the homepage and click on the registration form. Select "Register as Individual or Company" and complete all required fields. You will need to complete the eKYC process online to verify your identity.',
      isExpanded: false,
    ),
    FaqItem(
      question: 'Are Auction Events Private or Public?',
      answer:
          'Auction events can be both private and public, depending on the organizer\'s preferences. Public auctions are open to all registered bidders, while private auctions require specific invitations to participate.',
      isExpanded: false,
    ),
    FaqItem(
      question: 'How Do I Place a Bid During an Auction?',
      answer:
          'To place a bid, navigate to the active auction event, select the item you wish to bid on, and enter your bid amount. Ensure it meets the minimum incremental value set for that auction item.',
      isExpanded: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.whiteColor,
      padding: EdgeInsets.all(24.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('FAQ\'s', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
          SizedBox(height: 16.h),
          Divider(color: Colors.grey[300], thickness: 1.0, height: 1.0),

          // Use custom implementation instead of Accordion widget to have more control
          Column(
            children: List.generate(_faqItems.length * 2 - 1, (index) {
              // Even indices are FAQ items
              if (index % 2 == 0) {
                final itemIndex = index ~/ 2;
                return _buildFaqItem(_faqItems[itemIndex]);
              }
              // Odd indices are dividers
              else {
                return Divider(color: Colors.grey[300], thickness: 1.0, height: 1.0);
              }
            }),
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
        ],
      ),
    );
  }

  Widget _buildFaqItem(FaqItem item) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              for (var faqItem in _faqItems) {
                faqItem.isExpanded = faqItem == item ? !faqItem.isExpanded : false;
              }
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    item.question,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp, color: Colors.black),
                  ),
                ),
                _buildIcon(item.isExpanded),
              ],
            ),
          ),
        ),
        // Content area
        AnimatedCrossFade(
          firstChild: const SizedBox(height: 0),
          secondChild: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(item.answer, style: TextStyle(fontSize: 12.sp, color: Colors.grey[700])),
            ),
          ),
          crossFadeState: item.isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
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
      child: Icon(isExpanded ? Icons.remove : Icons.add, key: ValueKey<bool>(isExpanded), color: AppTheme.greyColor),
    );
  }
}

class FaqItem {
  final String question;
  final String answer;
  bool isExpanded;

  FaqItem({required this.question, required this.answer, required this.isExpanded});
}
