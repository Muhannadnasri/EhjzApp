import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:ehjz_flutter/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CouponsNavigation extends StatefulWidget {
  const CouponsNavigation({Key? key}) : super(key: key);

  @override
  State<CouponsNavigation> createState() => _FavouritesNavigationState();
}

class _FavouritesNavigationState extends State<CouponsNavigation> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // bottomNavigationBar: BlockNavigationBar(
      //   index: 2,
      // ),
      backgroundColor: neutralBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(29.0, 20.0, 35.0, 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const ProfileView(),
                      //   ),
                      // );
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
                    'Purchase',
                    style: titleStyle,
                    stepGranularity: 0.1,
                    maxFontSize: (height * 0.0215).roundToDouble(),
                    minFontSize: (height * 0.0215).roundToDouble(),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 180.0,
                      width: 188.0,
                      child: Image.asset('assets/images/purchase (1).png'),
                    ),
                    const SizedBox(
                      height: 13.0,
                    ),
                    Text(
                      'No purchases yet',
                      style: purchaseTitleStyle,
                    ),
                    const SizedBox(
                      height: 13.0,
                    ),
                    SizedBox(
                      width: 230.0,
                      child: Text(
                        'Buy or Book something in the app and it will appear here',
                        textAlign: TextAlign.center,
                        style: purchaseCaptionStyle,
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
