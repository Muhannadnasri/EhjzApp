import 'dart:convert';
import 'dart:ui';

import 'package:ehjz_flutter/components/car_details_image_row.dart';
import 'package:ehjz_flutter/components/event_details_information_row.dart';
import 'package:ehjz_flutter/components/global.dart';
import 'package:ehjz_flutter/components/load_view.dart';
import 'package:ehjz_flutter/components/re_usable_big_buton.dart';
import 'package:ehjz_flutter/constants.dart';
import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:ehjz_flutter/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:iconly/iconly.dart';

class EventDetails extends StatefulWidget {
  final String id;
  const EventDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  Map eventJson = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    event();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return eventJson.isEmpty
        ? LoadView()
        : Scaffold(
            bottomNavigationBar:
                ReUsableBigButton(onPressed: () {}, label: 'Book Now'),
            backgroundColor: AppColors.app_bg_color,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: defaultPadding * 2),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image(
                                image: NetworkImage(eventJson['image']),
                                height: height / 3,
                                fit: BoxFit.cover,
                                width: width,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        eventJson['title'],
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
                                            'AED ' +
                                                eventJson['price'].toString() +
                                                ' / ',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            'Night',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                              color: Colors.white70,
                                            ),
                                          ),
                                          Spacer(),
                                          //TODO:Add Reviews
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
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  EventDetailsInformationRow(
                                    date: eventJson['start_time'],
                                    icon: 'assets/icons/calendar.png',
                                    label: 'Start Time',
                                    ContainerColor:
                                        Colors.white24.withOpacity(0.1),
                                  ),
                                  EventDetailsInformationRow(
                                    icon: 'assets/icons/map.png',
                                    date: eventJson['address'].toString(),
                                    label: eventJson['location'] == null
                                        ? ''
                                        : eventJson['location']['name']
                                            .toString(),
                                    ContainerColor:
                                        Colors.white24.withOpacity(0.1),
                                  ),
                                ],
                              ),
                              SizedBox(height: defaultPadding),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  EventDetailsInformationRow(
                                    date: eventJson['duration'].toString(),
                                    icon: 'assets/icons/calendar.png',
                                    label: 'Duration',
                                    ContainerColor: Colors.white,
                                  ),
                                  // EventDetailsInformationRow(
                                  //   icon: 'assets/icons/call.png',
                                  //   date: 'Al Meydan Road',
                                  //   label: 'Information',
                                  //   ContainerColor: Colors.white24.withOpacity(0.1),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        eventJson['gallery'] == null
                            ? SizedBox()
                            : Container(
                                height: 150,
                                child: ListView.builder(
                                  itemCount: eventJson['gallery'].length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CarDetailsImageRow(
                                      image: eventJson['gallery'][index],
                                    );
                                  },
                                  // child: Row(
                                  //   children: [
                                  //     CarDetailsImageRow(
                                  //       image: 'assets/images/car_int1.png',
                                  //     ),
                                  //     SizedBox(
                                  //       width: 6,
                                  //     ),
                                  //     CarDetailsImageRow(
                                  //       image: 'assets/images/car_int2.png',
                                  //     ),
                                  //     SizedBox(
                                  //       width: 6,
                                  //     ),
                                  //     CarDetailsImageRow(
                                  //       image: 'assets/images/car_int3.png',
                                  //     ),
                                  //     SizedBox(
                                  //       width: 6,
                                  //     ),
                                  //     CarDetailsImageRow(
                                  //       image: 'assets/images/car_int4.png',
                                  //     ),
                                  //     SizedBox(
                                  //       width: 6,
                                  //     ),
                                  //     CarDetailsImageRow(
                                  //       image: 'assets/images/car_int5.png',
                                  //     ),
                                  //   ],
                                  // ),
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
                        Html(
                          data: eventJson['content'],
                          style: {
                            "body": Style(
                              color: Colors.white,
                              fontSize: FontSize(18.0),
                              // fontWeight: FontWeight.bold,
                            ),
                          },
                        ),
                        SizedBox(height: defaultPadding + 10),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0.0,
                    right: 0.0,
                    // bottom: 250,
                    top: 50,
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
                ],
              ),
            ));
  }

  Future event() async {
    Future.delayed(Duration.zero, () {
      // showLoading(true, context);
    });
    try {
      final response = await http
          .get(Uri.parse('https://ehjzapp.com/api/event/detail/${widget.id}'));

      if (response.statusCode == 200) {
        setState(
          () {
            eventJson = json.decode(response.body)['data'];
            // barsJson = json.decode(response2.body)['data'];
            // beachClubsJson = json.decode(response3.body)['data'];
            // loungeJson = json.decode(response4.body)['data'];
          },
        );
        // showLoading(false, context);
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString('email', email);
        // prefs.setString('password', password);
        // loggedin = true;
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (context) => HomePageRoutes()),
        //     (Route<dynamic> route) => false);
      }
      // else if (loginJson['status'] == 0) {
      // final snackBar =
      // SnackBar(content: Text(loginJson['message'].toString()));
      // _scaffoldKeyLogin.currentState!.showSnackBar(snackBar);
      // showLoading(false, context);
      // }
      else {
        // showLoading(false, context);
      }
    } catch (x) {
      showError('Sorry', context, event);
    }
  }
}
