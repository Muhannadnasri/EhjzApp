import 'package:ehjz_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarSpecificationCard extends StatelessWidget {
  const CarSpecificationCard({
    Key? key,
    @required this.icon,
    @required this.label,
    @required this.spec,
  }) : super(key: key);
  final icon;
  final label;
  final spec;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.40,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white12,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: defaultPadding, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(icon),
              height: 20,
              width: 20,
            ),
            SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    spec,
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: Color(0xff9D9D9D),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    label,
                    style: GoogleFonts.montserrat(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
