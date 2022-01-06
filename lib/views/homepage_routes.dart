import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:ehjz_flutter/utils/app_icons.dart';
import 'package:ehjz_flutter/views/bottom_navigation.dart/coupons_navigation.dart';
import 'package:ehjz_flutter/views/bottom_navigation.dart/favourite_navigation.dart';
import 'package:ehjz_flutter/views/bottom_navigation.dart/home_navigation.dart';
import 'package:ehjz_flutter/views/bottom_navigation.dart/profile_navigation.dart';
import 'package:flutter/material.dart';

class HomePageRoutes extends StatefulWidget {
  HomePageRoutes({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

int _selectedItem = 0;
final screens = [
  const HomeNavigation(),
  FavouritesNavigation(),
  const CouponsNavigation(),
  const ProfileNavigation(),
];

class _HomePageState extends State<HomePageRoutes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 75.00,
        child: BottomNavigationBar(
          backgroundColor: AppColors.gradient_begin,
          selectedItemColor: Colors.white,
          unselectedItemColor: AppColors.navigation_bar_unselected_color,
          iconSize: 27.78,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(AppIcons.home_icon),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.heart_icon),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.ticket_icon),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.profile_icon),
              label: '',
            ),
          ],
          currentIndex: 0,
          onTap: (val) {
            setState(() {
              _selectedItem = val;
            });
          },
        ),
      ),
      body: screens[_selectedItem],
      backgroundColor: AppColors.app_bg_color,
    );
  }
}
