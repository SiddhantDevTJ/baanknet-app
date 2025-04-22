import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/global_widgets/my_svg.dart';
import '../../utils/theme/app_theme.dart';
import '../../utils/theme/my_icon_path.dart';
import '../home_page/app_bar.dart';
import '../home_page/home_page.dart';

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
          SliverAppBarExample(),
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
