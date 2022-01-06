import 'package:ehjz_flutter/components/car_details_image_row.dart';
import 'package:ehjz_flutter/components/car_specification_card.dart';
import 'package:ehjz_flutter/components/navigate.dart';
import 'package:ehjz_flutter/components/re_usable_big_buton.dart';
import 'package:ehjz_flutter/constants.dart';
import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:ehjz_flutter/utils/app_icons.dart';
import 'package:ehjz_flutter/views/car_booking_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class CarBooking extends StatefulWidget {
  const CarBooking({Key? key}) : super(key: key);

  @override
  State<CarBooking> createState() => _CarBookingState();
}

class _CarBookingState extends State<CarBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.app_bg_color,
        body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: 0),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: defaultPadding * 2 + 5),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
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
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 110,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 15, right: 8, top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white10),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aston Martin\nRapide',
                        style: GoogleFonts.montserrat(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '2011',
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          Row(children: [
                            Text(
                              '1,400/',
                              style: GoogleFonts.montserrat(
                                  fontSize: 30,
                                  color: Color(0xffD99453),
                                  fontWeight: FontWeight.w900),
                            ),
                            Column(
                              children: [
                                Text(
                                  ' AED',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    color: Color(0xffD99453),
                                  ),
                                ),
                                Text(
                                  'day',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ])
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width / 1.00,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white12,
                  ),
                  child: Image(
                    image: AssetImage('assets/images/aston.png'),
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CarDetailsImageRow(
                        image: 'assets/images/car_int1.png',
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      CarDetailsImageRow(
                        image: 'assets/images/car_int2.png',
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      CarDetailsImageRow(
                        image: 'assets/images/car_int3.png',
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      CarDetailsImageRow(
                        image: 'assets/images/car_int4.png',
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      CarDetailsImageRow(
                        image: 'assets/images/car_int5.png',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CarSpecificationCard(
                      icon: 'assets/icons/auto.png',
                      label: 'Automatic',
                      spec: 'Gear',
                    ),
                    CarSpecificationCard(
                      icon: 'assets/icons/power.png',
                      label: '4.8s 100km/hr',
                      spec: 'Acceleration',
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CarSpecificationCard(
                      icon: 'assets/icons/climate.png',
                      label: 'Two-zone',
                      spec: 'Climate Control',
                    ),
                    CarSpecificationCard(
                      icon: 'assets/icons/seat.png',
                      label: 'Four Seat',
                      spec: 'Seat Heating',
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CarSpecificationCard(
                      icon: 'assets/icons/cylinders.png',
                      label: '12, V engine',
                      spec: 'Cylinders',
                    ),
                    CarSpecificationCard(
                      icon: 'assets/icons/fuel.png',
                      label: 'Gasoline',
                      spec: 'Fuel',
                    ),
                  ],
                ),
                SizedBox(height: defaultPadding),
                ReUsableBigButton(
                  label: 'Rent Now',
                  onPressed: () => push(
                    context: context,
                    widget: CarBookingDetails(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ]),
            )));
  }
}
