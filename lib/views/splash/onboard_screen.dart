import 'package:ehjz_flutter/components/navigate.dart';
import 'package:ehjz_flutter/constants.dart';
import 'package:ehjz_flutter/views/auth/login_page.dart';
import 'package:ehjz_flutter/views/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bottom_navigation.dart/homepage_routes.dart';

class OnBoardScreen extends StatelessWidget {
  Color gradientStart = Colors.transparent;
  Color gradientEnd = Colors.black;
  final List<String> imgList = [
    'assets/images/bg.png',
    'assets/images/bg.png',
    'assets/images/bg.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [gradientStart, gradientEnd],
            ).createShader(
                Rect.fromLTRB(0, -140, rect.width, rect.height - 20));
          },
          blendMode: BlendMode.darken,
          child: Container(
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   colors: [gradientStart, gradientEnd],
              //   begin: FractionalOffset(0, 0),
              //   end: FractionalOffset(0, 1),
              //   stops: [0.0, 1.0],
              //   tileMode: TileMode.clamp
              // ),
              image: DecorationImage(
                image: ExactAssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Column(
          children: [
            Container(
              child: Align(
                alignment: FractionalOffset(0.5, 0.0),
                child: Container(
                    margin: EdgeInsets.only(top: 55.0, left: 230),
                    decoration: BoxDecoration(),
                    child: TextButton(
                      onPressed: () {
                        push(context: context, widget: HomePageRoutes());
                      },
                      child: Text(
                        'SKIP',
                        style: GoogleFonts.montserrat(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    )),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Container(
                alignment: Alignment.bottomLeft,
                // margin: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Find & Book\nevents\n around you',
                  style: GoogleFonts.montserrat(
                      fontSize: 54,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 28.0),
              child: Text(
                'With you can find & book all the finest places to have an extraordinary day',
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 18.0),
              constraints: BoxConstraints(
                maxWidth: 330.0,
              ),
            ),
            InkWell(
              onTap: () {
                push(context: context, widget: SignUpPage());
              },
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffD29052),
                      Color(0xffAB713D),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Create an account',
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                push(context: context, widget: LoginPage());
              },
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    'Or Sign in',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
