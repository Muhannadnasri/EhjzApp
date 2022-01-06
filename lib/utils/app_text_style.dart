
import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle location_style = GoogleFonts.montserrat(
    color: AppColors.location_text_color,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
  );

  static TextStyle local_style = GoogleFonts.montserrat(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 12.0,
  );

  static TextStyle event_text_field_style = GoogleFonts.montserrat(
    color: AppColors.event_text_field_icon_color,
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
  );

  static TextStyle event_tile_title_style = GoogleFonts.inter(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 14.0,
  );

  static TextStyle section_header_style = GoogleFonts.inter(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 22.0,
  );

  static TextStyle festival_tile_title_style = GoogleFonts.montserrat(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 15.0,
  );

  static TextStyle festival_tile_caption_style = GoogleFonts.montserrat(
    color: Colors.white,
    fontWeight: FontWeight.w200,
    fontSize: 13.0,
  );

  static TextStyle featured_events_tile_date_style = GoogleFonts.montserrat(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 10.0,
  );

  static TextStyle featured_events_tile_title_style = GoogleFonts.montserrat(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
  );

  static TextStyle referral_tile_title_style = GoogleFonts.montserrat(
    color: AppColors.gradient_begin,
    fontWeight: FontWeight.w900,
    fontSize: 26.0,
  );

  static TextStyle referral_caption_title_style = GoogleFonts.montserrat(
    color: Colors.white,
    letterSpacing: 1,
    fontSize: 16.0,
  );

  static TextStyle referral_button_style = GoogleFonts.montserrat(
    color: AppColors.event_tile_unselected_bg_color,
    fontWeight: FontWeight.bold,
    fontSize: 19.0,
  );

  static TextStyle transports_tile_title_style = GoogleFonts.inter(
    color: Colors.white,
    fontWeight: FontWeight.w900,
    fontSize: 30.0,
  );
}
