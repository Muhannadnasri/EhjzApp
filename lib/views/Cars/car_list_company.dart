import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:ehjz_flutter/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'car_list.dart';

class CarListCompany extends StatefulWidget {
  const CarListCompany({Key? key}) : super(key: key);

  @override
  State<CarListCompany> createState() => _CarListCompanyState();
}

class _CarListCompanyState extends State<CarListCompany> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const BlockNavigationBar(),
      backgroundColor: neutralBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22.0, 20.0, 23.0, 0.0),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(10.0),
                      child: Ink(
                        height: 46.9,
                        width: 46.9,
                        decoration: BoxDecoration(
                          color: neutralBackButtonColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Icon(
                          IconlyLight.arrow_left_2,
                          color: Colors.white,
                          size: 18.17,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'Cars Companies',
                      style: titleStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 28.0,
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 190.0,
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: getCarsCompanyCarouselList.length,
                        onPageChanged: (int index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        itemBuilder: (_, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(
                                getCarsCompanyCarouselList[index].image,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(
                            getCarsCompanyCarouselList.length,
                            (index) => Container(
                              height: 8.0,
                              width: 8.0,
                              margin: const EdgeInsets.only(right: 8.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == index
                                    ? const Color(0xFFD99453)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 28.0,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: getCarsCompanyList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 21,
                    mainAxisSpacing: 28,
                    mainAxisExtent: 184,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GridTile(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CarList(),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(15.0),
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: neutralGridTileColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.097,
                                width: MediaQuery.of(context).size.width * 0.28,
                                child: Image.asset(
                                  getCarsCompanyList[index].image,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    getCarsCompanyList[index].title,
                                    style: gridTitleStyle,
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    getCarsCompanyList[index].caption,
                                    style: gridCaptionStyle,
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 21.0,
                              ),
                            ],
                          ),
                        ),
                      ), //just for testing, will fill with image later
                    );
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Carousel {
  String image;

  Carousel({
    required this.image,
  });
}

List<Carousel> getCarsCompanyCarouselList = [
  Carousel(
    image: 'assets/images/cars_company_carousel.png',
  ),
  Carousel(
    image: 'assets/images/cars_company_carousel.png',
  ),
  Carousel(
    image: 'assets/images/cars_company_carousel.png',
  ),
  Carousel(
    image: 'assets/images/cars_company_carousel.png',
  ),
];

class TileGrid {
  String image;
  String title;
  String caption;

  TileGrid({
    required this.image,
    required this.title,
    required this.caption,
  });
}

List<TileGrid> getCarsCompanyList = [
  TileGrid(
      title: 'National Car Rental',
      image: 'assets/images/cars_company (1).png',
      caption: "Luxury Cars"),
  TileGrid(
      title: 'Luxury Car Rental',
      image: 'assets/images/cars_company (2).png',
      caption: "Luxury Cars"),
  TileGrid(
      title: 'Xcar Rental',
      image: 'assets/images/cars_company (3).png',
      caption: "Luxury Cars"),
  TileGrid(
      title: 'Superios Car Rental',
      image: 'assets/images/cars_company (4).png',
      caption: "MSport & Luxury Cars"),
  TileGrid(
      title: 'Xcar Rental',
      image: 'assets/images/cars_company (5).png',
      caption: "Luxury Cars"),
  TileGrid(
      title: 'Xcar Rental',
      image: 'assets/images/cars_company (6).png',
      caption: "Luxury Cars"),
];
