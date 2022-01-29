import 'dart:convert';

import 'package:ehjz_flutter/components/global.dart';
import 'package:ehjz_flutter/components/home_vehcle_horizontal.dart';
import 'package:ehjz_flutter/components/navigate.dart';
import 'package:ehjz_flutter/components/event_widget.dart';
import 'package:ehjz_flutter/constants.dart';

import 'package:ehjz_flutter/utils/app_colors.dart';

import 'package:ehjz_flutter/utils/app_icons.dart';
import 'package:ehjz_flutter/views/event_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'home_event.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  List clubsJson = [];
  List barsJson = [];
  List beachClubsJson = [];
  List loungeJson = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    products();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.app_bg_color,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
            ),
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
                            child: Container(),
                            // child: TextField(
                            //   style: AppTextStyle.event_text_field_style,
                            //   decoration: InputDecoration(
                            //     hintText: AppStrings.text_field_hint,
                            //     hintStyle: AppTextStyle.event_text_field_style,
                            //     border: InputBorder.none,
                            //   ),
                            // ),
                          ),
                          GestureDetector(
                            onTap: () {
                              push(
                                  context: context,
                                  widget: HomeEvent(
                                    categoryId: 'null',
                                  ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0, 7.12, 7.12, 7.12),
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
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: defaultPadding + 15),
                    // Category(),
                    // SizedBox(height: defaultPadding + 5),
                    // Container(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text('Discover',
                    //       style: GoogleFonts.montserrat(
                    //         fontSize: 22,
                    //         fontWeight: FontWeight.w500,
                    //         color: Colors.white,
                    //       )),
                    // ),
                    // SizedBox(height: 15),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: [
                    //       DiscoveryHorizontal(
                    //         onpress: () {},
                    //         image: 'assets/icons/white_dub.png',
                    //         label: 'WHITE Dubai',
                    //         date: 'Sunday',
                    //       ),
                    //       SizedBox(
                    //         width: 15,
                    //       ),
                    //       DiscoveryHorizontal(
                    //         onpress: () {},
                    //         image: 'assets/icons/ladies.png',
                    //         label: 'Ladies Night',
                    //         date: 'Tuesday',
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: defaultPadding + 5),
                    GestureDetector(
                      onTap: () {
                        //
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeEvent(
                                categoryId: "14",

                                // id: clubsJson[index]['id'].toString(),
                              ),
                            ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text('Clubs',
                                style: GoogleFonts.montserrat(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                )),
                          ),
                          Row(
                            children: [
                              Text(
                                'See all',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.blue,
                                size: 17,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),

                    Container(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          // gridDelegate:
                          //     SliverGridDelegateWithFixedCrossAxisCount(
                          //         crossAxisCount:
                          //             (MediaQuery.of(context).orientation ==
                          //                     Orientation.portrait)
                          //                 ? 2
                          //                 : 3),
                          itemCount: clubsJson.length,
                          itemBuilder: (_, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EventDetails(
                                      id: clubsJson[index]['id'].toString(),
                                    ),
                                  ));
                            },
                            child: EventWidget(
                                duration: clubsJson[index]['duration'],
                                index: index,
                                title: clubsJson[index]['title'].toString(),
                                price: clubsJson[index]['price'].toString(),
                                image: clubsJson[index]['image'].toString()),
                          ),
                        )),
                    SizedBox(height: defaultPadding + 5),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeEvent(
                                categoryId: "15",

                                // id: clubsJson[index]['id'].toString(),
                              ),
                            ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text('Bars',
                                style: GoogleFonts.montserrat(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                )),
                          ),
                          Row(
                            children: [
                              Text(
                                'See all',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.blue,
                                size: 17,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15),

                    Container(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          // gridDelegate:
                          //     SliverGridDelegateWithFixedCrossAxisCount(
                          //         crossAxisCount:
                          //             (MediaQuery.of(context).orientation ==
                          //                     Orientation.portrait)
                          //                 ? 2
                          //                 : 3),
                          itemCount: barsJson.length,
                          itemBuilder: (_, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EventDetails(
                                      id: barsJson[index]['id'].toString(),
                                    ),
                                  ));
                            },
                            child: EventWidget(
                                duration: barsJson[index]['duration'],
                                index: index,
                                title: barsJson[index]['title'].toString(),
                                price: barsJson[index]['price'].toString(),
                                image: barsJson[index]['image'].toString()),
                          ),
                        )),
                    SizedBox(height: defaultPadding + 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeEvent(
                                categoryId: "16",

                                // id: clubsJson[index]['id'].toString(),
                              ),
                            ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text('Beach Clubs',
                                style: GoogleFonts.montserrat(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                )),
                          ),
                          Row(
                            children: [
                              Text(
                                'See all',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.blue,
                                size: 17,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15),

                    Container(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          // gridDelegate:
                          //     SliverGridDelegateWithFixedCrossAxisCount(
                          //         crossAxisCount:
                          //             (MediaQuery.of(context).orientation ==
                          //                     Orientation.portrait)
                          //                 ? 2
                          //                 : 3),
                          itemCount: beachClubsJson.length,
                          itemBuilder: (_, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EventDetails(
                                      id: beachClubsJson[index]['id']
                                          .toString(),
                                    ),
                                  ));
                            },
                            child: EventWidget(
                                duration: beachClubsJson[index]['duration'],
                                index: index,
                                title:
                                    beachClubsJson[index]['title'].toString(),
                                price:
                                    beachClubsJson[index]['price'].toString(),
                                image:
                                    beachClubsJson[index]['image'].toString()),
                          ),
                        )),
                    SizedBox(height: defaultPadding + 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeEvent(
                                categoryId: "17",

                                // id: clubsJson[index]['id'].toString(),
                              ),
                            ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text('Lounge',
                                style: GoogleFonts.montserrat(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                )),
                          ),
                          Row(
                            children: [
                              Text(
                                'See all',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.blue,
                                size: 17,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15),

                    Container(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          // gridDelegate:
                          //     SliverGridDelegateWithFixedCrossAxisCount(
                          //         crossAxisCount:
                          //             (MediaQuery.of(context).orientation ==
                          //                     Orientation.portrait)
                          //                 ? 2
                          //                 : 3),
                          itemCount: loungeJson.length,
                          itemBuilder: (_, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EventDetails(
                                      id: loungeJson[index]['id'].toString(),
                                    ),
                                  ));
                            },
                            child: EventWidget(
                                duration: loungeJson[index]['duration'],
                                index: index,
                                title: loungeJson[index]['title'].toString(),
                                price: loungeJson[index]['price'].toString(),
                                image: loungeJson[index]['image'].toString()),
                          ),
                        )),

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
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Future products() async {
    Future.delayed(Duration.zero, () {
      showLoading(true, context);
    });
    try {
      var response1 = await http.get(
          Uri.parse('https://ehjzapp.com/api/event/search?category_id=14'));
      var response2 = await http.get(
          Uri.parse('https://ehjzapp.com/api/event/search?category_id=15'));
      var response3 = await http.get(
          Uri.parse('https://ehjzapp.com/api/event/search?category_id=16'));
      var response4 = await http.get(
          Uri.parse('https://ehjzapp.com/api/event/search?category_id=17'));

      if (response1.statusCode == 200) {
        setState(
          () {
            clubsJson = json.decode(response1.body)['data'];
            barsJson = json.decode(response2.body)['data'];
            beachClubsJson = json.decode(response3.body)['data'];
            loungeJson = json.decode(response4.body)['data'];
          },
        );
        showLoading(false, context);
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
        showLoading(false, context);
      }
    } catch (x) {
      print(x);
      showError('Sorry', context, products);
    }
  }
}
