import 'dart:ui';

import 'package:ehjz_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedEventsHorizontal extends StatelessWidget {
  const FeaturedEventsHorizontal({
    Key? key,
    this.image,
    this.label,
    required this.onpress,
  }) : super(key: key);

  final image;
  final label;

  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress as VoidCallback,
      child: SizedBox(
        height: 200,
        width: 160,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff979797), Color(0xff979797)],
                  ).createShader(
                      Rect.fromLTRB(0, -140, rect.width, rect.height - 20));
                },
                blendMode: BlendMode.darken,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 145,
                child: Container(
                  height: 44,
                  width: 40,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white10),
                  clipBehavior: Clip.antiAlias,
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Column(
                        children: [
                          Text(
                            '04',
                            style: GoogleFonts.montserrat(
                              fontSize: 8,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Dec',
                            style: GoogleFonts.montserrat(
                              fontSize: 8,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Positioned(
                left: 110,
                bottom: 145,
                child: Container(
                  height: 44,
                  width: 40,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white10),
                  clipBehavior: Clip.antiAlias,
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Center(
                        child:
                            Image(image: AssetImage('assets/icons/heart.png')),
                      )),
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Container(
                    height: 70,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color(0xff191919),
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: Center(
                        child: Text(
                          label,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
