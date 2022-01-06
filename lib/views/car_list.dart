import 'package:ehjz_flutter/components/car_list_card.dart';
import 'package:ehjz_flutter/components/navigate.dart';
import 'package:ehjz_flutter/constants.dart';
import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:ehjz_flutter/utils/app_icons.dart';
import 'package:ehjz_flutter/views/car_booking.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CarList extends StatefulWidget {
  const CarList({Key? key}) : super(key: key);

  @override
  State<CarList> createState() => _CarListState();
}

class _CarListState extends State<CarList> {
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
          onTap: (val) {},
        ),
      ),
      // body: screens[_selectedItem],
      backgroundColor: AppColors.app_bg_color,
      // backgroundColor: AppColors.app_bg_color,
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: defaultPadding * 2 + 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Icon(
                        IconlyLight.filter,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CarListCard(
                onpress: () {
                  push(context: context, widget: CarBooking());
                },
                image: 'assets/images/aston.png',
                year: '2011',
                aed: 'AED',
                day: 'day',
                money: '1,400/',
                label: 'Aston Martin\nRapide',
              ),
              SizedBox(
                height: 15,
              ),
              CarListCard(
                onpress: () {},
                image: 'assets/images/rolls.png',
                year: '2019',
                aed: 'AED',
                day: 'day',
                money: '2,950/',
                label: 'Rollce Royce\nRapide',
              ),
              SizedBox(
                height: 15,
              ),
              CarListCard(
                onpress: () {},
                image: 'assets/images/aston.png',
                year: '2011',
                aed: 'AED',
                day: 'day',
                money: '1,400/',
                label: 'Aston Martin\nRapide',
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
