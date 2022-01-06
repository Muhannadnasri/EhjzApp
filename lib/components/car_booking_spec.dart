import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarBookingSpec extends StatelessWidget {
  const CarBookingSpec({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.40,
      height: 117,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white12,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/icons/auto.png'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Gear',
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    color: Color(0xff9D9D9D),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Automatic',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
