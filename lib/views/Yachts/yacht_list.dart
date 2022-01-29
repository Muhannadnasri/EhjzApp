import 'dart:convert';

import 'package:ehjz_flutter/components/car_widget.dart';
import 'package:ehjz_flutter/components/filter_bottom_sheet.dart';
import 'package:ehjz_flutter/components/global.dart';
import 'package:ehjz_flutter/components/load_view.dart';
import 'package:ehjz_flutter/constants.dart';
import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:ehjz_flutter/utils/app_icons.dart';
import 'package:ehjz_flutter/utils/app_strings.dart';
import 'package:ehjz_flutter/utils/app_text_style.dart';
import 'package:ehjz_flutter/views/Yachts/yacht_booking_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'yacht_booking_details.dart';

class YachtList extends StatefulWidget {
  const YachtList({Key? key}) : super(key: key);

  @override
  State<YachtList> createState() => _YachtListState();
}

class _YachtListState extends State<YachtList> {
  // List<CarTypeList> getCarsList = [];
  List yachtsJson = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    yachts();
  }

  @override
  Widget build(BuildContext context) {
    return yachtsJson.isEmpty
        ? LoadView()
        : Scaffold(
            backgroundColor: AppColors.app_bg_color,
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
              ),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                // height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    SizedBox(
                      height: defaultPadding * 3 + 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Ink(
                            height: 46.9,
                            width: 46.9,
                            decoration: BoxDecoration(
                              color: neutralBackButtonColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
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
                                    hintStyle:
                                        AppTextStyle.event_text_field_style,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showModalBottomSheet<dynamic>(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) => Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.836,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            topRight: Radius.circular(30.0),
                                          ),
                                        ),
                                        child: const FilterBottomSheet(),
                                      ),
                                    );
                                  });
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
                        SizedBox(height: defaultPadding + 5),
                        Container(
                            height: MediaQuery.of(context).size.height,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: GridView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                // physics: BouncingScrollPhysics(),

                                // shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1 / 1.15,
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 15,
                                        mainAxisSpacing: 15
                                        // crossAxisCount: 2,
                                        // crossAxisSpacing: 10.0,

                                        // childAspectRatio: 0.9
                                        ),
                                //     SliverGridDelegateWithFixedCrossAxisCount(
                                //         crossAxisCount:
                                //             (MediaQuery.of(context).orientation ==
                                //                     Orientation.portrait)
                                //                 ? 2
                                //                 : 3),
                                itemCount: yachtsJson.length,
                                itemBuilder: (_, index) => GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            YachtBookingDetails(
                                          id: yachtsJson[index]['id']
                                              .toString(),
                                        ),
                                      ),
                                    );
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => EventDetails(
                                    //         id: eventsJson[index]['id']
                                    //             .toString(),
                                    //       ),
                                    //     ));
                                  },
                                  child: CarWidget(
                                      index: index,
                                      title:
                                          yachtsJson[index]['title'].toString(),
                                      price:
                                          yachtsJson[index]['price'].toString(),
                                      image: yachtsJson[index]['image']
                                          .toString()),
                                ),
                              ),
                            )),
                        SizedBox(height: defaultPadding + 10),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Future yachts() async {
    Future.delayed(Duration.zero, () {
      // showLoading(true, context);
    });
    try {
      final response = await http
          .get(Uri.parse('https://ehjzapp.com/api/car/search?category_id=5'));

      if (response.statusCode == 200) {
        setState(
          () {
            yachtsJson = json.decode(response.body)['data'];
          },
        );
      }
    } catch (x) {
      showError('Sorry', context, yachts);
    }
  }
}
