import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:receptyUser/core/constants/app_strings.dart';
import 'package:receptyUser/features/screens/bookmarks/view/bookmarks_homepage.dart';
import 'package:receptyUser/features/screens/dashboard/widget/bottom_bar.dart';
import 'package:receptyUser/features/screens/dashboard/widget/dashboard_component.dart';
import 'package:receptyUser/features/screens/profile/view/profile_screen.dart';
import 'package:receptyUser/generated/assets.dart';

import '../../../components/custom_dialogs.dart';
import '../../home/view/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key, this.index = 0}) : super(key: key);
  final int? index;

  @override
  State<DashboardScreen> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> {
  var pageController = PageController();
  int _selectedIndex = 0;
  final List<Widget> _screen = [
    HomeScreen(),
    BookmarksHomepage(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  /*@override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }*/
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          return _onBackPressed();
        } else {
          setState(() {
            _selectedIndex = 0;
            _onItemTapped(0);
          });
        }
        return false;
      },
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: CustomBottomBar(
          children: [
            bottomBarItem(
                onTap: () {
                  _onItemTapped(0);
                },
                icon: Assets.iconsHome,
                isBorder: _selectedIndex == 0 ? true : false),
            bottomBarItem(
                onTap: () {
                  _onItemTapped(1);
                },
                icon: Assets.iconsFavourite,
                isBorder: _selectedIndex == 1 ? true : false),
            bottomBarItem(
                onTap: () {
                  _onItemTapped(2);
                },
                icon: Assets.iconsProfile,
                isBorder: _selectedIndex == 2 ? true : false),
          ],
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: _screen,
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showCustomDialog(
      context: context,
      title: AppStrings.areYouSure.tr(),
      details: AppStrings.exitDesc.tr(),
      onYes: () => SystemNavigator.pop(),
    ).show().then(
          (value) => value as bool,
        );
  }
}
