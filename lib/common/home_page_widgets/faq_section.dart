import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../modules/home_page/home_page.dart';
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
          Text('FAQ\'s', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 16.h),
          ExpansionPanelList(
            elevation: 0,
            expandedHeaderPadding: EdgeInsets.zero,
            dividerColor: Colors.grey[300],
            animationDuration: Duration(milliseconds: 300),
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _faqItems[index].isExpanded = !_faqItems[index].isExpanded;
              });
            },
            children:
                _faqItems.map<ExpansionPanel>((FaqItem item) {
                  return ExpansionPanel(
                    canTapOnHeader: true,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                item.question,
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                              ),
                            ),
                            Icon(item.isExpanded ? Icons.remove : Icons.add, color: AppTheme.secondaryColor),
                          ],
                        ),
                      );
                    },
                    body: Padding(
                      padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, bottom: 16.0.h),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(item.answer, style: TextStyle(fontSize: 14.sp, color: Colors.grey[700])),
                      ),
                    ),
                    isExpanded: item.isExpanded,
                    backgroundColor: AppTheme.whiteColor,
                  );
                }).toList(),
          ),

          SizedBox(height: 24.h),
          // See all questions button
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                'See all questions',
                style: TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FaqItem {
  final String question;
  final String answer;
  bool isExpanded;

  FaqItem({required this.question, required this.answer, required this.isExpanded});
}
