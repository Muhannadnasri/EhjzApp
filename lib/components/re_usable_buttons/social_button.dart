import 'package:ehjz_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    this.icon,
    this.label,
  }) : super(key: key);
  final icon;
  final label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 1.20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Colors.white24, //                   <--- border color
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            children: [
              Image(
                image: AssetImage(icon),
                height: 24,
                width: 24,
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                label,
                style:
                    GoogleFonts.montserrat(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
