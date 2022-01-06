import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReUsableBigButton extends StatelessWidget {
  const ReUsableBigButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);
  final Function onPressed;
  final label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed as VoidCallback,
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width / 1.10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Color(0xffD99453).withOpacity(0.70),
              Color(0xffA17041).withOpacity(0.70),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
