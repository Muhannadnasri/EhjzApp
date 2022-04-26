import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehjz_flutter/components/global.dart';
import 'package:ehjz_flutter/utils/app_style.dart';
import 'package:ehjz_flutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:iconly/iconly.dart';
import 'package:http/http.dart' as http;

class FavouritesNavigation extends StatefulWidget {
  const FavouritesNavigation({Key? key}) : super(key: key);

  @override
  State<FavouritesNavigation> createState() => _FavouritesNavigationState();
}

class _FavouritesNavigationState extends State<FavouritesNavigation> {
  List favoritesJson = [];
  @override
  void initState() {
    super.initState();
    favorites();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // bottomNavigationBar: BlockNavigationBar(
      //   index: 1,
      // ),
      backgroundColor: neutralBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(29.0, 20.0, 35.0, 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => const PurchaseView(),
                            // ));
                          },
                          borderRadius: BorderRadius.circular(10.0),
                          child: Ink(
                            height: height * 0.05,
                            width: width * 0.09,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E1E1E),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Icon(
                              IconlyLight.arrow_left_2,
                              color: Colors.white,
                              size: height * 0.023,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        AutoSizeText(
                          'Favorite',
                          style: titleStyle,
                          stepGranularity: 0.1,
                          maxFontSize: (height * 0.0215).roundToDouble(),
                          minFontSize: (height * 0.0215).roundToDouble(),
                        ),
                      ],
                    ),
                    // InkWell(
                    //   onTap: () {},
                    //   borderRadius: BorderRadius.circular(10.0),
                    //   child: Ink(
                    //     height: height * 0.05,
                    //     width: width * 0.09,
                    //     decoration: BoxDecoration(
                    //       color: const Color(0xFF1E1E1E),
                    //       borderRadius: BorderRadius.circular(10.0),
                    //     ),
                    //     child: Icon(
                    //       IconlyLight.setting,
                    //       color: Colors.white,
                    //       size: height * 0.023,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 42.0,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: favoritesJson.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing:
                        MediaQuery.of(context).size.width * 0.0467,
                    mainAxisSpacing:
                        MediaQuery.of(context).size.height * 0.0215,
                    mainAxisExtent:
                        (MediaQuery.of(context).size.height * 0.1943),
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              favoritesJson[index]['service']['image']
                                  .toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              19.0, 15.0, 13.25, 18.40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GlassContainer.clearGlass(
                                    color: const Color(0x33000000),
                                    height: MediaQuery.of(context).size.height *
                                        0.048,
                                    width: MediaQuery.of(context).size.height *
                                        0.048,
                                    blur: 4.0,
                                    borderColor: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: (MediaQuery.of(context).size.width *
                                          0.05),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 7.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      RatingBarIndicator(
                                        rating: favoritesJson[index]['service']
                                                        ['review_score']
                                                    ['score_total'] ==
                                                0
                                            ? 0.0
                                            : double.parse(favoritesJson[index]
                                                    ['service']['review_score']
                                                ['score_total']),
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 4,
                                        itemSize: 13.0,
                                      ),
                                      const SizedBox(
                                        width: 6.0,
                                      ),
                                      Text(
                                        favoritesJson[index]['service']
                                                            ['review_score']
                                                        ['total_review']
                                                    .toString() ==
                                                '0'
                                            ? '0.0'
                                            : favoritesJson[index]['service']
                                                        ['review_score']
                                                    ['total_review']
                                                .toString(),
                                        style: favoriteEventsTileRatingStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.048,
                                    child: AutoSizeText(
                                      favoritesJson[index]['service']['title'],
                                      style: favoriteEventsTileTitleStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future favorites() async {
    Future.delayed(Duration.zero, () {
      showLoading(true, context);
    });

    try {
      final response = await http.get(Uri.parse(
          'https://ehjzapp.com/api/user/wishlist?token=$accessToken'));

      print(accessToken);
      if (response.statusCode == 200) {
        setState(
          () {
            favoritesJson = json.decode(response.body)['data'];
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
      showError('Sorry', context, favorites);
    }
  }
}

// class FavoriteTileGrid {
//   String image;
//   String title;
//   double rating;

//   FavoriteTileGrid({
//     required this.image,
//     required this.title,
//     required this.rating,
//   });
// }

// List<FavoriteTileGrid> getFavoriteEventsList = [
//   FavoriteTileGrid(
//       title: 'Holiday Inn Manhattan',
//       image: 'assets/images/favorite_event (1).png',
//       rating: 4),
//   FavoriteTileGrid(
//       title: 'Holiday Inn Manhattan',
//       image: 'assets/images/favorite_event (2).png',
//       rating: 4),
//   FavoriteTileGrid(
//       title: 'Holiday Inn Manhattan',
//       image: 'assets/images/favorite_event (3).png',
//       rating: 4),
// ];
