import 'package:ehjz_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    required this.childText,
    required this.textColor,
    required this.onPressed,
  });

  final String childText;
  final Function onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed as VoidCallback,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 1.20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Color(0xffD99453).withOpacity(0.70),
              Color(0xffA17041).withOpacity(0.70),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            children: [
              Spacer(),
              Text(
                childText,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: textColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              // Image(
              //   image: AssetImage(icon),
              // ),

              // Container(
              //   height: 30,
              //   width: 30,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //     gradient: LinearGradient(
              //       colors: [
              //         Color(0xffD99453).withOpacity(0.70),
              //         Color(0xffA17041).withOpacity(0.70),
              //       ],
              //       begin: Alignment.centerLeft,
              //       end: Alignment.centerRight,
              //     ),
              //   ),
              //   // child: Center(
              //   //   child: Icon(IconlyLight.arrow_right,
              //   //       color: Colors.white, size: 17),
              //   // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
