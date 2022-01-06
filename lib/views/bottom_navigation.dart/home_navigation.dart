import 'package:ehjz_flutter/components/discovery_horizontal.dart';
import 'package:ehjz_flutter/components/featured_events_horizontal.dart';
import 'package:ehjz_flutter/components/home_category.dart';
import 'package:ehjz_flutter/components/home_vehcle_horizontal.dart';
import 'package:ehjz_flutter/components/navigate.dart';
import 'package:ehjz_flutter/constants.dart';
import 'package:ehjz_flutter/models/event_list_model.dart';
import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:ehjz_flutter/utils/app_data-provider.dart';
import 'package:ehjz_flutter/utils/app_icons.dart';
import 'package:ehjz_flutter/utils/app_strings.dart';
import 'package:ehjz_flutter/utils/app_text_style.dart';
import 'package:ehjz_flutter/views/event_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

List<EventListModel> events = AppDataProvider.getEventList();

class _HomeNavigationState extends State<HomeNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.app_bg_color,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, ),
            child: Column(
              children: [
                SizedBox(
                  height: defaultPadding * 3 + 10,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Current Location',
                          style: GoogleFonts.montserrat(
                            fontSize: 11,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Image(
                                image: AssetImage('assets/icons/location.png'),
                              ),
                            ),
                            Text(
                              'Dubai, UAE',
                              style: GoogleFonts.montserrat(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Image(
                      image: AssetImage("assets/images/img.png"),
                      height: 40,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: [
                    Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: AppColors.event_text_field_bg_color,
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(19.0, 0, 33.25, 0),
                            child: Icon(
                              AppIcons.search_icon,
                              size: 28.5,
                              color: AppColors.event_text_field_icon_color,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              style: AppTextStyle.event_text_field_style,
                              decoration: InputDecoration(
                                hintText: AppStrings.text_field_hint,
                                hintStyle: AppTextStyle.event_text_field_style,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0, 7.12, 7.12, 7.12),
                            child: Container(
                              width: 50.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    AppColors.gradient_begin,
                                    AppColors.gradient_end
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: const Icon(
                                AppIcons.filter_icon,
                                size: 28.5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: defaultPadding + 15),
                    Category(),
                    SizedBox(height: defaultPadding + 5),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Discover',
                          style: GoogleFonts.montserrat(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          DiscoveryHorizontal(
                            onpress: () {},
                            image: 'assets/icons/white_dub.png',
                            label: 'WHITE Dubai',
                            date: 'Sunday',
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          DiscoveryHorizontal(
                            onpress: () {},
                            image: 'assets/icons/ladies.png',
                            label: 'Ladies Night',
                            date: 'Tuesday',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: defaultPadding + 5),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Featured Events',
                          style: GoogleFonts.montserrat(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FeaturedEventsHorizontal(
                            onpress: () {
                              push(context: context, widget: EventDetails());
                            },
                            label: 'Midnight Music\nConcert',
                            image: 'assets/images/bg.png',
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          FeaturedEventsHorizontal(
                            onpress: () {},
                            label: 'Midnight Music\nConcert',
                            image: 'assets/icons/ladies.png',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: defaultPadding + 5),
                    Container(
                      height: 130,
                      width: MediaQuery.of(context).size.width / 1.25,
                      decoration: BoxDecoration(
                        color: AppColors.refferal_container,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding, vertical: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Invite Your\nFriend',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffD99453),
                                    )),
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xffC37A34),
                                        Color(0xffD39458),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Center(
                                    child: Image(
                                      image:
                                          AssetImage('assets/icons/ticket.png'),
                                      height: 23,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Get AED 100 Voucher',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13,
                                      color: Colors.white,
                                    )),
                                Container(
                                    height: 35,
                                    width: MediaQuery.of(context).size.width /
                                        4.30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Center(
                                      child: Text('INVITE',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: defaultPadding + 10),
                    HomeVehcleHorizontal(),
                    SizedBox(height: defaultPadding + 10),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Featured Events',
                          style: GoogleFonts.montserrat(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FeaturedEventsHorizontal(
                            onpress: () {},
                            label: 'Midnight Music\nConcert',
                            image: 'assets/images/event_3.png',
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          FeaturedEventsHorizontal(
                            onpress: () {},
                            label: 'Midnight Music\nConcert',
                            image: 'assets/images/event_4.png',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
