import 'package:ehjz_flutter/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarListCard extends StatelessWidget {
  const CarListCard({
    Key? key,
    @required this.label,
    @required this.money,
    @required this.day,
    @required this.aed,
    @required this.year,
    @required this.image,
    required this.onpress,
  }) : super(key: key);
  final label;
  final money;
  final aed;
  final day;
  final year;
  final image;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onpress as VoidCallback,
        child: Container(
            height: 270,
            width: MediaQuery.of(context).size.width / 1.00,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white10,
            ),
            child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(
                //     right: defaultPadding,
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Container(
                //         height: 45,
                //         width: 45,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(8),
                //             color: Colors.white12),
                //         // clipBehavior: Clip.antiAlias,
                //         child: Center(
                //             child: Icon(
                //           AppIcons.heart_icon,
                //           color: Colors.white,
                //         )),
                //       ),
                //     ],
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15, top: 10),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white12),
                        child: Center(
                            child: Icon(
                          AppIcons.heart_icon,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ],
                ),
                Image(
                  image: AssetImage(
                    image,
                  ),
                  // fit: BoxFit.cover,
                  height: 150,
                ),
                Spacer(),
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white12),
                  // clipBehavior: Clip.antiAlias,
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 8,
                          ),
                          child: Text(
                            label,
                            style: GoogleFonts.montserrat(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 0),
                          child: Text(
                            year,
                            style: GoogleFonts.montserrat(
                              fontSize: 11,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(children: [
                          Text(
                            money,
                            style: GoogleFonts.montserrat(
                                fontSize: 28,
                                color: Color(0xffD99453),
                                fontWeight: FontWeight.w900),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 15, top: 10, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ' $aed',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    color: Color(0xffD99453),
                                  ),
                                ),
                                Text(
                                  day,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ],
                    )
                  ]),
                ),
              ],
            )));
  }
}
