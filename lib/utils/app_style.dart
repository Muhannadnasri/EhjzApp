import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

//ONBOARDING
TextStyle onboardingTitleStyle = GoogleFonts.montserrat(
  fontSize: 54.0,
  wordSpacing: 0.0,
  height: 0.94,
  letterSpacing: -2.0,
  color: Colors.white,
  fontWeight: FontWeight.w800,
);

TextStyle onboardingCaptionStyle = GoogleFonts.montserrat(
  fontSize: 16.0,
  height: 1.21,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

TextStyle onboardingSkipStyle = GoogleFonts.montserrat(
  fontSize: 19.0,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

TextStyle onboardingButtonTitleStyle = GoogleFonts.montserrat(
  fontSize: 16.0,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

TextStyle onboardingTextButtonStyle = GoogleFonts.montserrat(
  fontSize: 14.0,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

//CARS VENDORS && YATCHS VENDORS
TextStyle titleStyle = GoogleFonts.poppins(
  fontSize: 20.0,
  color: const Color(0XFFC8C8C8),
  fontWeight: FontWeight.w500,
);

TextStyle gridTitleStyle = GoogleFonts.poppins(
  fontSize: 14.0,
  color: const Color(0XFFC68C56),
  fontWeight: FontWeight.w600,
);

TextStyle gridCaptionStyle = GoogleFonts.montserrat(
  fontSize: 11.0,
  color: const Color(0XFFF0EEE9),
  fontWeight: FontWeight.w300,
);

//YATCH LISTS

TextStyle yatchListsTitleStyle = GoogleFonts.poppins(
  fontSize: 20.0,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

TextStyle yatchListsSubtitleStyle = GoogleFonts.poppins(
  fontSize: 20.0,
  color: const Color(0xFF828282),
  fontWeight: FontWeight.w300,
);

TextStyle yatchListsTileTitleStyle = GoogleFonts.poppins(
  fontSize: 14.0,
  color: Colors.white,
  fontWeight: FontWeight.w700,
);

TextStyle yatchListsListBadgeStyle = GoogleFonts.montserrat(
  fontSize: 13.0,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

TextStyle yatchListsListTitleStyle = GoogleFonts.montserrat(
  fontSize: 24.0,
  height: 1.24,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

TextStyle yatchListsListCaptionStyle = GoogleFonts.montserrat(
  fontSize: 13.0,
  color: Colors.white,
  fontWeight: FontWeight.w200,
);

TextStyle yatchListsListPriceStyle = GoogleFonts.montserrat(
  fontSize: 35.0,
  color: gradientBegin,
  fontWeight: FontWeight.w800,
);

TextStyle yatchListsListPriceCurrencyStyle = GoogleFonts.montserrat(
  fontSize: 12.0,
  color: gradientBegin,
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.w800,
);

TextStyle yatchListsListPriceTimeStyle = GoogleFonts.montserrat(
  fontSize: 12.0,
  color: Colors.white,
  fontWeight: FontWeight.w800,
);

//YATCH BOOKING

TextStyle yatchBookingHeroTitleStyle = GoogleFonts.montserrat(
  fontSize: 26.0,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

TextStyle yatchBookingHeroCaptionStyle = GoogleFonts.montserrat(
  fontSize: 15.0,
  color: Colors.white,
  fontWeight: FontWeight.w300,
);

TextStyle yatchBookingDescriptionTitleStyle = GoogleFonts.montserrat(
  fontSize: 20.0,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

TextStyle yatchBookingDescriptionBodyStyle = GoogleFonts.montserrat(
  fontSize: 14.0,
  height: 1.21,
  color: Colors.white,
  fontWeight: FontWeight.w100,
);

TextStyle yatchBookingHostNameStyle = GoogleFonts.montserrat(
  fontSize: 16.0,
  color: Colors.white,
  fontWeight: FontWeight.w300,
);

TextStyle yatchBookingHostCaptionStyle = GoogleFonts.montserrat(
  fontSize: 12.0,
  color: const Color(0xFF717171),
  fontWeight: FontWeight.w200,
);

TextStyle yatchBookingTileValueStyle = GoogleFonts.montserrat(
  fontSize: 19.0,
  color: Colors.white,
  fontWeight: FontWeight.w400,
);

TextStyle yatchBookingTileTypeStyle = GoogleFonts.montserrat(
  fontSize: 9.0,
  color: const Color(0xFFB9B9B9),
  fontWeight: FontWeight.w400,
);

TextStyle yatchBookingTileUnitStyle = GoogleFonts.montserrat(
  fontSize: 8.0,
  color: Colors.white,
  fontWeight: FontWeight.w200,
);

TextStyle yatchBookingButtonStyle = GoogleFonts.montserrat(
  fontSize: 16.0,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);
// TextStyle titleStyle = GoogleFonts.poppins(
//   fontSize: 20.0,
//   color: const Color(0XFFFFFFFF),
//   fontWeight: FontWeight.w500,
// );

TextStyle ticketDetailsTitleStyle = GoogleFonts.montserrat(
  fontSize: 16.0,
  color: const Color(0XFFFFFFFF),
  fontWeight: FontWeight.w500,
);

TextStyle ticketDetailsDescriptionStyle = GoogleFonts.montserrat(
  fontSize: 14.0,
  color: const Color(0XFFD0D0D0),
  fontWeight: FontWeight.w300,
  height: 1.75,
);

TextStyle ticketDetailsInfoTitleStyle = GoogleFonts.montserrat(
  fontSize: 12.0,
  color: const Color(0XFFD0D0D0),
  fontWeight: FontWeight.w300,
);

TextStyle ticketDetailsInfoValueStyle = GoogleFonts.montserrat(
  fontSize: 14.0,
  color: const Color(0XFFFFFFFF),
  fontWeight: FontWeight.w400,
);

TextStyle ticketDetailsScanInfoStyle = GoogleFonts.montserrat(
  fontSize: 12.0,
  color: const Color(0XFFFFFFFF),
  fontWeight: FontWeight.w300,
);

// FAVORITE EVENTS

TextStyle favoriteEventsTileTitleStyle = GoogleFonts.manrope(
  fontSize: 14.0,
  color: const Color(0XFFFFFFFF),
  fontWeight: FontWeight.w600,
  height: 1.30,
);

TextStyle favoriteEventsTileRatingStyle = GoogleFonts.lato(
  fontSize: 10.0,
  color: const Color(0XFFFFFFFF),
  fontWeight: FontWeight.w600,
);

// PURCHASE

TextStyle purchaseTitleStyle = GoogleFonts.montserrat(
  fontSize: 16.0,
  color: const Color(0XFFFFFFFF),
  fontWeight: FontWeight.w600,
);

TextStyle purchaseCaptionStyle = GoogleFonts.montserrat(
  fontSize: 14.0,
  color: const Color(0XFFFFFFFF),
  fontWeight: FontWeight.w200,
);

// PROFILE

TextStyle profileNameStyle = GoogleFonts.montserrat(
  fontSize: 18.0,
  color: const Color(0XFFFFFFFF),
  fontWeight: FontWeight.w600,
);

TextStyle profileUserIDStyle = GoogleFonts.montserrat(
  fontSize: 14.0,
  color: const Color(0XFFCACACA),
  fontWeight: FontWeight.w300,
);

TextStyle profileOptionTextStyle = GoogleFonts.montserrat(
  fontSize: 15.0,
  color: const Color(0XFFFFFFFF),
  fontWeight: FontWeight.w300,
);

// BOTTOM SHEET

TextStyle bottomSheetTitleTextStyle = GoogleFonts.montserrat(
  fontSize: 18.0,
  color: const Color(0XFF6D6D6D),
  fontWeight: FontWeight.w400,
);

TextStyle bottomSheetCTATextStyle = GoogleFonts.montserrat(
  fontSize: 16.0,
  color: const Color(0XFFD99453),
  fontWeight: FontWeight.w600,
);

TextStyle bottomSheetSectionTitleStyle = GoogleFonts.montserrat(
  fontSize: 16.0,
  color: const Color(0XFF828282),
  fontWeight: FontWeight.w400,
);

TextStyle bottomSheetFilterChipSelectedTextStyle = GoogleFonts.montserrat(
  fontSize: 14.0,
  color: const Color(0XFF767676),
  fontWeight: FontWeight.w300,
);

TextStyle bottomSheetFilterChipUnselectedTextStyle = GoogleFonts.montserrat(
  fontSize: 14.0,
  color: const Color(0XFFFFFFFF),
  fontWeight: FontWeight.w600,
);

TextStyle bottomSheetFilterRangeTextStyle = GoogleFonts.montserrat(
  fontSize: 16.0,
  color: const Color(0XFFD99453),
  fontWeight: FontWeight.w800,
);

TextStyle bottomSheetChoiceChipSelectedTextStyle = GoogleFonts.montserrat(
  fontSize: 14.0,
  color: const Color(0XFF82A4D0),
  fontWeight: FontWeight.w300,
);

TextStyle bottomSheetChoiceChipUnselectedTextStyle = GoogleFonts.montserrat(
  fontSize: 14.0,
  color: const Color(0XFF1F1F39),
  fontWeight: FontWeight.w300,
);
