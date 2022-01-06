import 'package:ehjz_flutter/components/car_booking_spec.dart';
import 'package:ehjz_flutter/components/navigate.dart';
import 'package:ehjz_flutter/constants.dart';
import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:ehjz_flutter/views/booking_confirm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarBookingDetails extends StatefulWidget {
  CarBookingDetails({Key? key}) : super(key: key);

  @override
  _CarBookingDetailsState createState() => _CarBookingDetailsState();
}

class _CarBookingDetailsState extends State<CarBookingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.app_bg_color,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: AssetImage(
                'assets/images/map.png',
              ),
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 620,
              right: 290,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffD99453).withOpacity(0.70),
                        Color(0xffA17041).withOpacity(0.70),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
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
            ),
            Positioned(
              bottom: 20,
              left: 160,
              child: InkWell(
                onTap: () => showModalBottomSheet(
                    useRootNavigator: true,
                    context: context,
                    builder: (context) => buildSheet(context)),
                child: Container(
                    height: 8,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black54,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildSheet(BuildContext context) => Container(
      height: 400,
      color: Colors.black,
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                height: 8,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white54,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: defaultPadding, right: defaultPadding, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aston Martin\nRapide',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '2011',
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                    height: 106,
                    width: MediaQuery.of(context).size.width / 2.00,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white24,
                    ),
                    child: Image(
                      image: AssetImage('assets/images/aston.png'),
                    ))
              ],
            ),
          ),
          SizedBox(height: defaultPadding * 3),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarBookingSpec(),
                  SizedBox(
                    width: 15,
                  ),
                  CarBookingSpec(),
                  SizedBox(
                    width: 15,
                  ),
                  CarBookingSpec(),
                  SizedBox(
                    width: 15,
                  ),
                  CarBookingSpec(),
                ],
              ),
            ),
          ),
          SizedBox(height: defaultPadding),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Row(children: [
              Text(
                '1,400/',
                style: GoogleFonts.montserrat(
                    fontSize: 33,
                    color: Color(0xffD99453),
                    fontWeight: FontWeight.w900),
              ),
              Column(
                children: [
                  Text(
                    ' AED',
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      color: Color(0xffD99453),
                    ),
                  ),
                  Text(
                    'day',
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  push(context: context, widget: BookingConfirm());
                },
                child: Container(
                  height: 51,
                  width: MediaQuery.of(context).size.width / 2.50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffD99453).withOpacity(0.70),
                        Color(0xffA17041).withOpacity(0.70),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Rent Now',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
