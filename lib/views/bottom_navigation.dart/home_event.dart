import 'dart:convert';

import 'package:ehjz_flutter/components/filter_bottom_sheet.dart';
import 'package:ehjz_flutter/components/global.dart';
import 'package:ehjz_flutter/components/event_widget.dart';
import 'package:ehjz_flutter/constants.dart';

import 'package:ehjz_flutter/utils/app_colors.dart';

import 'package:ehjz_flutter/utils/app_icons.dart';
import 'package:ehjz_flutter/utils/app_strings.dart';
import 'package:ehjz_flutter/utils/app_text_style.dart';
import 'package:ehjz_flutter/views/event_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeEvent extends StatefulWidget {
  final String categoryId;
  const HomeEvent({Key? key, required this.categoryId}) : super(key: key);

  @override
  State<HomeEvent> createState() => _HomeEventState();
}

class _HomeEventState extends State<HomeEvent> {
  List eventsJson = [];
  String id = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    events();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showModalBottomSheet<dynamic>(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => Container(
                                  height: MediaQuery.of(context).size.height *
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
                            childAspectRatio: 1 / 1.30,
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,

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
                          itemCount: eventsJson.length,
                          itemBuilder: (_, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EventDetails(
                                      id: eventsJson[index]['id'].toString(),
                                    ),
                                  ));
                            },
                            child: EventWidget(
                                duration: eventsJson[index]['duration'],
                                index: index,
                                title: eventsJson[index]['title'].toString(),
                                price: eventsJson[index]['price'].toString(),
                                image: eventsJson[index]['image'].toString()),
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

  Future events() async {
    Future.delayed(Duration.zero, () {
      showLoading(true, context);
    });

    try {
      final response = await http.get(
          Uri.parse('https://ehjzapp.com/api/event/search?category_id=${id}'));

      if (response.statusCode == 200) {
        setState(
          () {
            eventsJson = json.decode(response.body)['data'];
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
      showError('Sorry', context, events);
    }
  }
}
