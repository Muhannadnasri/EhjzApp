import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:ehjz_flutter/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class CarWidget extends StatefulWidget {
  final String title;
  final String price;

  final String image;

  final int index;
  CarWidget({
    required this.title,
    required this.price,
    required this.image,
    required this.index,
  });

  @override
  State<CarWidget> createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> {
  @override
  Widget build(BuildContext context) {
    return
        // Column(
        //   children: [
        //     Container(
        //       height: 150.0,
        //       // width: double.infinity,
        //       decoration: const BoxDecoration(
        //         color: neutralGridTileColor,
        //         borderRadius: BorderRadius.only(
        //           topLeft: Radius.circular(16.0),
        //           topRight: Radius.circular(16.0),
        //         ),
        //       ),
        //       child: Column(
        //         children: [
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.end,
        //             children: [
        //               Container(
        //                 height: 31.0,
        //                 width: 31.0,
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(10.0),
        //                   color: yachListsActionBGColor,
        //                 ),
        //                 child: const Icon(
        //                   IconlyLight.heart,
        //                   size: 16.0,
        //                   color: Colors.white,
        //                 ),
        //               ),
        //             ],
        //           ),
        //           Image.network(
        //             widget.image,
        //           ),
        //         ],
        //       ),
        //     ),
        //     Container(
        //       height: 40.0,
        //       // width: double.infinity,
        //       padding: const EdgeInsets.all(5),
        //       decoration: const BoxDecoration(
        //         color: Color(0xFF1F1F1F),
        //         borderRadius: BorderRadius.only(
        //           bottomLeft: Radius.circular(16.0),
        //           bottomRight: Radius.circular(16.0),
        //         ),
        //       ),
        //       child: Row(
        //         children: [
        //           Expanded(
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   widget.title,
        //                   style: GoogleFonts.montserrat(
        //                     fontSize: 10.0,
        //                     height: 1.24,
        //                     color: Colors.white,
        //                     fontWeight: FontWeight.w500,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.end,
        //             children: [
        //               Text(
        //                 widget.price + '/',
        //                 style: GoogleFonts.montserrat(
        //                   fontSize: 20.0,
        //                   color: gradientBegin,
        //                   fontWeight: FontWeight.w800,
        //                 ),
        //               ),
        //               const SizedBox(
        //                 width: 2.0,
        //               ),
        //               Text(
        //                 'AED',
        //                 style: yatchListsListPriceCurrencyStyle,
        //               )
        //             ],
        //           )
        //         ],
        //       ),
        //     ),
        //   ],
        // );

        Container(
      decoration: BoxDecoration(
        color: yachtListsSubtitleColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                child: Image.network(
                  widget.image,
                  height: 100,
                  fit: BoxFit.contain,
                  width: 200,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 31.0,
                    width: 31.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: yachListsActionBGColor,
                    ),
                    child: const Icon(
                      IconlyLight.heart,
                      size: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  widget.price + " AED",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
