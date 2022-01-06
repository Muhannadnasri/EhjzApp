import 'package:ehjz_flutter/constants.dart';
import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:ehjz_flutter/views/car_list.dart';
import 'package:ehjz_flutter/views/yacts_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeVehcleHorizontal extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

List<String> categories = [
  "YACHTS",
  "CARS",
];
List<String> categoriesImage = [
  "assets/images/ship.png",
  "assets/images/car.png",
];

final screens = [
  YactList(),
  CarList(),
];

class _CategoryState extends State<HomeVehcleHorizontal> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 180,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                  context, CupertinoPageRoute(builder: (c) => screens[index]));
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: _buildCategory(index),
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(int index) {
    return Container(
        height: 214,
        width: MediaQuery.of(context).size.width / 2.10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColors.event_tile_unselected_bg_color,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.gradient_begin,
              AppColors.gradient_end,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: defaultPadding * 2, bottom: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categories[index],
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image(
                image: AssetImage(categoriesImage[index]),
              ),
            ],
          ),
        ));
  }
}
