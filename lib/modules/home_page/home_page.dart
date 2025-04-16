import 'package:baanknet/common/global_widgets/my_image.dart';
import 'package:baanknet/common/global_widgets/my_svg.dart';
import 'package:baanknet/common/home_page_widgets/propertyListingScreen.dart';
import 'package:baanknet/utils/theme/app_theme.dart';
import 'package:baanknet/utils/theme/my_image_path.dart';
import 'package:flutter/material.dart';

import '../../common/home_page_widgets/layered_container_example.dart';
import '../../common/home_page_widgets/properties_available.dart';
import '../../utils/theme/my_icon_path.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomePage(),
          Center(child: Text('Properties')),
          Center(child: Text('Auctions')),
          Center(child: Text('Profile')),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 0, blurRadius: 10)],
          border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppTheme.secondaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: MySvg(assetName: MyIconPath.smartHome, color: AppTheme.greyColor),
              activeIcon: MySvg(assetName: MyIconPath.smartHome, color: AppTheme.secondaryColor),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: MySvg(assetName: MyIconPath.buildingSkyscraper, color: AppTheme.greyColor),
              activeIcon: MySvg(assetName: MyIconPath.buildingSkyscraper, color: AppTheme.secondaryColor),
              label: 'Properties',
            ),
            BottomNavigationBarItem(
              icon: MySvg(assetName: MyIconPath.hammer, color: AppTheme.greyColor),
              activeIcon: MySvg(assetName: MyIconPath.hammer, color: AppTheme.secondaryColor),
              label: 'Auctions',
            ),
            BottomNavigationBarItem(
              icon: MySvg(assetName: MyIconPath.user, color: AppTheme.greyColor),
              activeIcon: MySvg(assetName: MyIconPath.user, color: AppTheme.secondaryColor),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildPropertyTypeTab(String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: isSelected ? AppTheme.secondaryColor : AppTheme.greyColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          if (isSelected) Container(height: 2, width: 60, color: AppTheme.secondaryColor),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header with blue background
              Container(
                color: AppTheme.primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo and menu
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          IconButton(icon: const Icon(Icons.menu, color: Colors.white), onPressed: () {}),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Row(
                              children: [
                                MyImage(assetName: MyImagePath.baankknet, color: AppTheme.whiteColor),
                                const SizedBox(width: 10),
                                Container(width: 1, height: 24, color: Colors.white30),
                                const SizedBox(width: 10),
                                MySvg(assetName: MyImagePath.psbAlliance, color: AppTheme.whiteColor),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Hero text
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          Text(
                            'Your Search for a Property ends here',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'An advanced property listing and e-auction platform tailored for banks and lenders.',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),

                    // Search bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search "Property"...',
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(Icons.search, color: Colors.grey),
                            suffixIcon: Container(
                              padding: const EdgeInsets.all(10),
                              child: const Icon(Icons.arrow_forward, color: Colors.deepOrange),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),

              // Mega Auction Banner
              LayeredContainerExample(),
              Center(
                child: Text('Explore Assets by Category', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),

              // Category Tabs
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Real Estate',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Automobiles',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Property Listings
              PropertyHorizontalList(),

              // See all Properties button
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'See all Properties',
                        style: TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 5),
                      Icon(Icons.arrow_forward, color: AppTheme.secondaryColor, size: 16),
                    ],
                  ),
                ),
              ),

              // Bid Live Section
              Container(
                color: AppTheme.blackColor,
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Text(
                      'Bid Live, Win Big:',
                      style: TextStyle(color: AppTheme.secondaryColor, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Explore Property Auctions\nwith Happy Buyers!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: StatCard(icon: Icons.emoji_emotions, value: '1.5M +', label: 'Happy customer')),
                        const SizedBox(width: 16),
                        Expanded(child: StatCard(icon: Icons.business, value: '69447', label: 'Property Listed')),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: StatCard(icon: Icons.gavel, value: '88192', label: 'Auction Conducted')),
                        const SizedBox(width: 16),
                        Expanded(
                          child: StatCard(
                            icon: Icons.account_balance_wallet,
                            value: '7181 Cr',
                            label: 'Auctioned Property Value',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Upcoming Auctions Section
              Container(
                color: Color(0xFFFCF8F6),
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Upcoming Auctions in 30 Days',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Category Tabs
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Real Estate',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Automobiles',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Property Type Tabs
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          _buildPropertyTypeTab('Residential', true),
                          _buildPropertyTypeTab('Commercial', false),
                          _buildPropertyTypeTab('Agricultural', false),
                          _buildPropertyTypeTab('Industrial', false),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Auction Cards
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          AuctionCard(
                            id: '105539',
                            title: 'Flat for Sale in Himachal Pradesh',
                            bank: 'Bank of Baroda',
                            location: 'Bengaluru, Karnataka',
                            days: '08',
                            hours: '08',
                            mins: '08',
                          ),
                          const SizedBox(width: 16),
                          AuctionCard(
                            id: '105539',
                            title: 'Flat for Sale in Himachal Pradesh',
                            bank: 'Bank of Baroda',
                            location: 'Bengaluru, Karnataka',
                            days: '08',
                            hours: '08',
                            mins: '08',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // See all auctions button
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'See all auctions',
                              style: TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            Icon(Icons.arrow_forward, color: AppTheme.secondaryColor, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Properties Available Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Properties Available', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'See all',
                            style: TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5),
                          Icon(Icons.arrow_forward, color: AppTheme.secondaryColor, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // About BaankNet Section
              Container(
                color: AppTheme.whiteColor,
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('About BAANKNET', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const Text(
                      '(Bank Asset Auction Network)',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'A state-of-the-art innovative property listing and e-auction platform designed specifically for banks and lending institutions, addressing recovery of Non-Performing Assets.',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Read more',
                            style: TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5),
                          Icon(Icons.arrow_downward, color: AppTheme.secondaryColor, size: 16),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Features Grid
                    Row(
                      children: [
                        Expanded(child: FeatureCard(title: 'From Search to sale', subtitle: 'One solution')),
                        const SizedBox(width: 16),
                        Expanded(child: FeatureCard(title: 'Seamless Process', subtitle: 'Transparent &')),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: FeatureCard(title: 'Property & Auction', subtitle: 'Simple Search')),
                        const SizedBox(width: 16),
                        Expanded(child: FeatureCard(title: '& Fair Pricing', subtitle: 'Smart Auctions')),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: FeatureCard(title: 'Seamless Process', subtitle: 'Transparent &')),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Property listings
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('An initiative of'),
                          SizedBox(height: 5),

                          Row(
                            children: [
                              MyImage(assetName: MyImagePath.image22, height: 30, width: 120),
                              const SizedBox(width: 16),
                              MyImage(assetName: MyImagePath.image24),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text('Powered by'),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              MySvg(assetName: MyImagePath.psbAlliance, color: AppTheme.greyColor),
                              const SizedBox(width: 10),

                              MyImage(assetName: MyImagePath.baankknet),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Properties Available
              PropertiesAvailable(onSeeAllPressed: () {}),

              // Promoters Bank Section
              Container(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Promoters Bank', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(MyImagePath.image39),
                        Image.asset(MyImagePath.image40),
                        Image.asset(MyImagePath.image41),
                        Image.asset(MyImagePath.image42),
                      ],
                    ),
                  ],
                ),
              ),

              // FAQ Section
              Container(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('FAQ\'s', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    FaqItem(
                      question: 'What is eAuction',
                      answer:
                          'To participate as a Bidder, registration is a simple process. Go to the registration form from the homepage. Select "Register as Individual or Company" and fill out all required details, completing eKYC online.',
                      isExpanded: true,
                    ),
                    const Divider(),
                    FaqItem(question: 'What is Bidder', answer: '', isExpanded: false),
                    const Divider(),
                    FaqItem(
                      question: 'How Can a Bidder Register on the Auction Portal?',
                      answer: '',
                      isExpanded: false,
                    ),
                    const Divider(),
                    FaqItem(question: 'Are Auction Events Private or Public?', answer: '', isExpanded: false),
                    const Divider(),
                    FaqItem(question: 'Are Auction Events Private or Public?', answer: '', isExpanded: false),
                    const SizedBox(height: 24),
                    // See all questions button
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'See all questions',
                              style: TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 5),
                            Icon(Icons.arrow_forward, color: AppTheme.secondaryColor, size: 16),
                          ],
                        ),
                      ),
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

class PropertyListingScreen {}

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(imageUrl, height: 120, width: double.infinity, fit: BoxFit.cover),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(category, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        const SizedBox(height: 6),
        Row(
          children: [
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(width: 8),
            Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
            Text(location, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
          ],
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const StatCard({Key? key, required this.icon, required this.value, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.grey[800]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: Colors.grey[400], fontSize: 14)),
        ],
      ),
    );
  }
}

class AuctionCard extends StatelessWidget {
  final String id;
  final String title;
  final String bank;
  final String location;
  final String days;
  final String hours;
  final String mins;

  const AuctionCard({
    Key? key,
    required this.id,
    required this.title,
    required this.bank,
    required this.location,
    required this.days,
    required this.hours,
    required this.mins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 5)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(id, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Text(bank, style: TextStyle(color: Colors.grey[700], fontSize: 14)),
            const SizedBox(height: 4),
            Text(location, style: TextStyle(color: Colors.grey[700], fontSize: 14)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildTimeBox(days, 'days'), _buildTimeBox(hours, 'hours'), _buildTimeBox(mins, 'mins')],
            ),
            const SizedBox(height: 16),
            // Property Detail Button
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.secondaryColor,
                side: BorderSide(color: AppTheme.secondaryColor),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Property Detail', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            // Auction Detail Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.secondaryColor,
                foregroundColor: AppTheme.whiteColor,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Auction Detail', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeBox(String value, String label) {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(color: const Color(0xFFFCF8F6), borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const FeatureCard({Key? key, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppTheme.lightOrange, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.secondaryColor),
            ),
            child: Icon(Icons.check_circle_outline, color: AppTheme.secondaryColor, size: 20),
          ),
          const SizedBox(height: 12),
          Text(subtitle, style: TextStyle(color: Colors.grey[700], fontSize: 14)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;
  final bool isExpanded;

  const FaqItem({Key? key, required this.question, required this.answer, this.isExpanded = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(question, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
            Icon(isExpanded ? Icons.remove : Icons.add, color: Colors.black),
          ],
        ),
        if (isExpanded) ...[
          const SizedBox(height: 8),
          Text(answer, style: TextStyle(color: Colors.grey[700], fontSize: 14)),
        ],
      ],
    );
  }
}
