import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscoveryHorizontal extends StatelessWidget {
  const DiscoveryHorizontal({
    Key? key,
    this.image,
    this.label,
    required this.onpress,
    this.date,
  }) : super(key: key);

  final image;
  final label;
  final date;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress as VoidCallback,
      child: SizedBox(
        height: 110,
        width: 200,
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
                  bottom: 15,
                  left: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        date,
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
