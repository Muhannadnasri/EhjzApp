import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventDetailsInformationRow extends StatelessWidget {
  const EventDetailsInformationRow({
    Key? key,
    @required this.icon,
    @required this.ContainerColor,
    @required this.label,
    @required this.date,
  }) : super(key: key);
  final icon;
  final ContainerColor;
  final label;
  final date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 39,
          width: 38,
          decoration: BoxDecoration(
            color: ContainerColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Image(
              image: AssetImage(icon),
              height: 21,
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        ConstrainedBox(
          constraints: new BoxConstraints(
            // minHeight: 5.0,
            minWidth: 100.0,
            // maxHeight: 30.0,
            maxWidth: 100.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Text(
                date,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  color: Color(0xff717171),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
