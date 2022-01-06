import 'dart:ui';
import 'package:ehjz_flutter/components/event_details_information_row.dart';
import 'package:ehjz_flutter/components/re_usable_big_buton.dart';
import 'package:ehjz_flutter/constants.dart';
import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:ehjz_flutter/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.app_bg_color,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: defaultPadding * 2),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image(
                          image: AssetImage('assets/images/event.png'),
                          height: 310),
                    ),
                    Positioned(
                      left: 15,
                      right: 15,
                      bottom: 250,
                      top: 15,
                      child: Row(
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
                          Spacer(),
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
                                IconlyLight.send,
                                color: Colors.white,
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 10,
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
                                AppIcons.heart_icon,
                                color: Colors.white,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      left: 15,
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 1.30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white24.withOpacity(0.1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Midnight Music\nConcert',
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'AED 1250/',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'Table',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffD99453),
                                    size: 14,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffD99453),
                                    size: 14,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffD99453),
                                    size: 14,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffD99453),
                                    size: 14,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          EventDetailsInformationRow(
                            date: 'Tuesday 9:00PM',
                            icon: 'assets/icons/calendar.png',
                            label: '14 Dec, 2021',
                            ContainerColor: Colors.white24.withOpacity(0.1),
                          ),
                          EventDetailsInformationRow(
                            icon: 'assets/icons/map.png',
                            date: 'Al Meydan Road',
                            label: 'Dubai',
                            ContainerColor: Colors.white24.withOpacity(0.1),
                          ),
                        ],
                      ),
                      SizedBox(height: defaultPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          EventDetailsInformationRow(
                            date: 'Host',
                            icon: 'assets/icons/toys.png',
                            label: 'Toy Room',
                            ContainerColor: Colors.white,
                          ),
                          EventDetailsInformationRow(
                            icon: 'assets/icons/call.png',
                            date: 'Al Meydan Road',
                            label: 'Informatio',
                            ContainerColor: Colors.white24.withOpacity(0.1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: defaultPadding + 10),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Info',
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'
                  's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: Colors.white30,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: defaultPadding + 10),
                ReUsableBigButton(onPressed: () {}, label: 'Book Now'),
                SizedBox(height: 10),
              ],
            ),
          ),
        ));
  }
}
