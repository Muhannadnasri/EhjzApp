import 'package:ehjz_flutter/constants.dart';
import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class BookingConfirm extends StatefulWidget {
  BookingConfirm({Key? key}) : super(key: key);

  @override
  _BookingConfirmState createState() => _BookingConfirmState();
}

class _BookingConfirmState extends State<BookingConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: AppColors.app_bg_color,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding * 2),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                          child: Image(
                              image: AssetImage('assets/icons/heart.png'),
                              color: Colors.white)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 600,
                child: ListView(
                  shrinkWrap: true,
                  // physics: AlwaysScrollableScrollPhysics(),
                  // scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width / 1.60,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xffD99453), width: 3.0),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(height: defaultPadding * 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '17 July 2021',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffD99453),
                              ),
                            ),
                            SizedBox(
                              height: defaultPadding,
                            ),
                            Text(
                              'Gate',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Gate 2',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffD99453),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Time',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '08:30 pm - 11:30 pm',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffD99453),
                              ),
                            ),
                            SizedBox(
                              height: defaultPadding,
                            ),
                            Text(
                              'Seat',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'D4, D5, D6, D7',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffD99453),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: defaultPadding * 3),
                    Text(
                      'Phasellus quam nisl, faucibus vel a faucibus sodales, venenatis non nulla. Morbi concert consectetur magna rutrum massa feugiat, a sit amet aliquet dui vulputate. Donec ac and nulla justo. Quisque id pretium nisl, a iaculis.',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff77838F),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: defaultPadding * 2),
                    InkWell(
                      // onTap: onPressed as VoidCallback,
                      child: Container(
                        height: 84,
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
                          child: SizedBox(
                            height: 70,
                            child: SfBarcodeGenerator(
                              value: 'https://github.com/tusharhow',
                              barColor: Colors.white,
                            ),
                          ),
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
