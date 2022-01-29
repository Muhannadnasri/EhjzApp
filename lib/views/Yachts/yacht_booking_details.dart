import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehjz_flutter/components/global.dart';
import 'package:ehjz_flutter/components/load_view.dart';
import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:ehjz_flutter/utils/app_icons.dart';
import 'package:ehjz_flutter/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:iconly/iconly.dart';

class YachtBookingDetails extends StatefulWidget {
  final String id;
  YachtBookingDetails({Key? key, required this.id}) : super(key: key);

  @override
  _YachtBookingDetailsState createState() => _YachtBookingDetailsState();
}

class _YachtBookingDetailsState extends State<YachtBookingDetails> {
  Map yachtJson = {};
  List<TileGridYacht> getYachInfoList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    yacht();
  }

  @override
  Widget build(BuildContext context) {
    return yachtJson.isEmpty
        ? LoadView()
        : Scaffold(
            backgroundColor: neutralBackgroundColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22.0, 20.0, 23.0, 00),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Image.network(
                              yachtJson['image'],
                              fit: BoxFit.cover,
                              height: 300,
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
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
                                    color: Colors.black,
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
                                    color: Colors.black,
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
                          // Positioned.fill(
                          //   child: Padding(
                          //     padding:
                          //         const EdgeInsets.fromLTRB(14.0, 26.0, 15.0, 36.0),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Row(
                          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             GlassContainer.clearGlass(
                          //               height: 43.39,
                          //               width: 43.39,
                          //               blur: 4.0,
                          //               borderColor: Colors.transparent,
                          //               borderRadius: BorderRadius.circular(10.0),
                          //               child: Icon(
                          //                 IconlyLight.arrow_left_2,
                          //                 color: Colors.white,
                          //                 size: (MediaQuery.of(context).size.width *
                          //                     0.05),
                          //               ),
                          //             ),
                          //             Row(
                          //               children: [
                          //                 GlassContainer.clearGlass(
                          //                   height: 43.39,
                          //                   width: 43.39,
                          //                   blur: 4.0,
                          //                   borderColor: Colors.transparent,
                          //                   borderRadius: BorderRadius.circular(10.0),
                          //                   child: Icon(
                          //                     IconlyLight.send,
                          //                     color: Colors.white,
                          //                     size:
                          //                         (MediaQuery.of(context).size.width *
                          //                             0.05),
                          //                   ),
                          //                 ),
                          //                 const SizedBox(
                          //                   width: 7.0,
                          //                 ),
                          //                 GlassContainer.clearGlass(
                          //                   height: 43.39,
                          //                   width: 43.39,
                          //                   blur: 4.0,
                          //                   borderColor: Colors.transparent,
                          //                   borderRadius: BorderRadius.circular(10.0),
                          //                   child: Icon(
                          //                     IconlyLight.heart,
                          //                     color: Colors.white,
                          //                     size:
                          //                         (MediaQuery.of(context).size.width *
                          //                             0.05),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ],
                          //         ),
                          //         Padding(
                          //           padding: const EdgeInsets.only(left: 10.0),
                          //           child: Column(
                          //             crossAxisAlignment: CrossAxisAlignment.start,
                          //             children: [
                          //               Text(
                          //                 yachtJson['title'],
                          //                 style: yatchBookingHeroTitleStyle,
                          //               ),
                          //               Text(
                          //                 'yachtCaptionText',
                          //                 style: yatchBookingHeroCaptionStyle,
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Positioned(
                            bottom: 15,
                            left: 20,
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
                                      yachtJson['title'],
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
                                              yachtJson['price'].toString() +
                                              ' / ',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          'Day',
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
                    ),
                    const SizedBox(
                      height: 22.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 43.39,
                                width: 43.39,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Image.asset('assets/images/host.png'),
                              ),
                              const SizedBox(
                                width: 13.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Elise Aarohi',
                                    style: yatchBookingHostNameStyle,
                                  ),
                                  Text(
                                    'Member Since Jul 2021',
                                    style: yatchBookingHostCaptionStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(10.0),
                                child: Ink(
                                  height: 43.39,
                                  width: 43.39,
                                  decoration: BoxDecoration(
                                    color: neutralBackButtonColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Icon(
                                    IconlyLight.calling,
                                    color: Colors.white,
                                    size: (MediaQuery.of(context).size.width *
                                        0.05),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 7.0,
                              ),
                              InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(10.0),
                                child: Ink(
                                  height: 43.39,
                                  width: 43.39,
                                  decoration: BoxDecoration(
                                    color: neutralBackButtonColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Icon(
                                    IconlyLight.message,
                                    color: Colors.white,
                                    size: (MediaQuery.of(context).size.width *
                                        0.05),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 26.61,
                    ),
                    yachtJson['gallery'] == null
                        ? SizedBox()
                        : SizedBox(
                            height: 80.0,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: yachtJson['gallery'].length,
                              separatorBuilder: (_, index) {
                                return const SizedBox(
                                  width: 11.0,
                                );
                              },
                              itemBuilder: (_, index) {
                                if (index == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 22.0),
                                    child: Container(
                                      height: 100.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Image.network(
                                          yachtJson['gallery'][index]),
                                    ),
                                  );
                                } else if (index == yachtJson.length) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 22.0),
                                    child: Container(
                                      height: 100.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Image.network(
                                          yachtJson['gallery'][index]),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    height: 100.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Image.network(
                                        yachtJson['gallery'][index]),
                                  );
                                }
                              },
                            ),
                          ),
                    const SizedBox(
                      height: 22.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: SizedBox(
                        child: Html(
                          data: yachtJson['content'],
                          style: {
                            "body": Style(
                              color: Colors.white,
                              fontSize: FontSize(18.0),
                              // fontWeight: FontWeight.bold,
                            ),
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: SizedBox(
                        height: 135.0,
                        child: Image.asset('assets/images/map.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 22.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32.0, 0.0, 23.0, 0.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: getYachInfoList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing:
                              MediaQuery.of(context).size.width * 0.0327,
                          mainAxisSpacing:
                              MediaQuery.of(context).size.height * 0.02,
                          mainAxisExtent:
                              (MediaQuery.of(context).size.height * 0.11),
                        ),
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.03,
                              MediaQuery.of(context).size.height * 0.032,
                              0.0,
                              0.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: const Color(0xFF3C3C3C),
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      AutoSizeText(
                                        getYachInfoList[index].value,
                                        style: yatchBookingTileValueStyle,
                                        maxLines: 1,
                                        minFontSize: 2.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // SvgPicture.asset(
                                          //   getYachInfoList[index].icon,
                                          // ),
                                          const SizedBox(
                                            width: 4.0,
                                          ),
                                          Expanded(
                                            child: AutoSizeText(
                                              getYachInfoList[index].type,
                                              style: yatchBookingTileTypeStyle,
                                              maxLines: 1,
                                              minFontSize: 6.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 21.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22.0, 0.0, 22.0, 30.0),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(16.0),
                        child: Ink(
                          height: 84.42,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: gradientEnd,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Center(
                            child: Text(
                              'Rent Now',
                              style: yatchBookingButtonStyle,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Future yacht() async {
    Future.delayed(Duration.zero, () {
      // showLoading(true, context);
    });
    try {
      final response = await http
          .get(Uri.parse('https://ehjzapp.com/api/car/detail/${widget.id}'));

      if (response.statusCode == 200) {
        setState(
          () {
            yachtJson = json.decode(response.body)['data'];
            getYachInfoList = [
              TileGridYacht(
                value: yachtJson['location']['name'].toString(),
                type: "Location",
              ),
              TileGridYacht(
                value: yachtJson['gear'].toString(),
                type: "Gear",
              ),
              TileGridYacht(
                value: yachtJson['baggage'].toString(),
                type: "Baggage",
              ),
            ];
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
      // print(x);
      showError('Sorry', context, yacht);
    }
  }
}

class TileGridYacht {
  String value;
  // String icon;
  String type;

  TileGridYacht({
    required this.value,
    // required this.icon,
    required this.type,
  });
}

// List<TileGridYacht> getYachInfoList = [
//   TileGridYacht(
//     value: '2,100',
//     // icon: 'assets/icons/yacht_info_icons (6).svg',
//     type: "Location",
//   ),
//   TileGridYacht(
//     value: '1,050',
//     // icon: 'assets/icons/yacht_info_icons (3).svg',
//     type: "Lengthss",
//   ),
//   TileGridYacht(
//     value: 'Travel',
//     // icon: 'assets/icons/yacht_info_icons (5).svg',
//     type: "Purpose",
//   ),
//   TileGridYacht(
//     value: '6',
//     // icon: 'assets/icons/yacht_info_icons (2).svg',
//     type: "Staff",
//   ),
//   TileGridYacht(
//     value: 'Cruise  ',
//     // icon: 'assets/icons/yacht_info_icons (4).svg',
//     type: "Type",
//   ),
//   TileGridYacht(
//     value: '24',
//     // icon: 'assets/icons/yacht_info_icons (1).svg',
//     type: "Workdsing Hours",
//   ),
// ];
