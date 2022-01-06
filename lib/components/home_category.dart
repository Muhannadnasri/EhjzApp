// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:ehjz_flutter/constants.dart';
// import 'package:ehjz_flutter/utils/app_colors.dart';
// import 'package:ehjz_flutter/utils/app_text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Category extends StatefulWidget {
//   @override
//   _CategoryState createState() => _CategoryState();
// }

// List<String> categories = ["Clubs", "Lounge", "Bars", "Beach Club"];
// List<String> categoriesImage = [
//   "assets/icons/clubs.png",
//   "assets/icons/lounge.png",
//   "assets/icons/bars.png",
//   "assets/icons/beach.png",
// ];

// class _CategoryState extends State<Category> {
//   int selectedIndex = 0;
//   bool isSelected = false;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 120,
//       child: ListView.builder(
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         itemCount: 4,
//         itemBuilder: (context, index) => InkWell(
//           onTap: () {
//             setState(() {
//               selectedIndex = index;
//             });
//           },
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: _buildCategory(index),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCategory(int index) {
//     return Container(
//       width: 96,
//       height: 116.25,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16.0),
//         color: isSelected ? null : AppColors.event_tile_unselected_bg_color,
//         gradient: isSelected
//             ? const LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [AppColors.gradient_begin, AppColors.gradient_end],
//               )
//             : null,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           AutoSizeText(
//             categories[index],
//             style: AppTextStyle.event_tile_title_style,
//             minFontSize: 12.0,
//             maxFontSize: 14.0,
//           ),
//           Spacer(),
//           Image(
//             image: AssetImage(categoriesImage[index]),
//             // color: selectedIndex == index ? Colors.white : Color(0xffa17041),
//           ),
//         ],
//       ),
//     );
//   }
// }

// //  Spacer(),
// //             Image(
// //               image: AssetImage(categoriesImage[index]),
// //               color: selectedIndex == index ? Colors.white : Color(0xffa17041),
// //             ),

// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:ehjz_flutter/models/event_list_model.dart';
// import 'package:ehjz_flutter/utils/app_colors.dart';
// import 'package:ehjz_flutter/utils/app_icons.dart';
// import 'package:ehjz_flutter/utils/app_text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:iconly/iconly.dart';

// class EventList extends StatefulWidget {
//   const EventList({
//     Key? key,
//     required this.events,
//   }) : super(key: key);

//   final List<EventListModel> events;

//   @override
//   State<EventList> createState() => _EventListState();
// }

// class _EventListState extends State<EventList> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemCount: widget.events.length,
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       separatorBuilder: (_, index) {
//         return const SizedBox(
//           width: 16.0,
//         );
//       },
//       itemBuilder: (_, index) {
//         EventListModel event = widget.events[index];
//         return EventTile(
//           title: event.title!,
//           icon: event.icon!,
//           isSelected: event.isSelected!,
//         );
//       },
//     );
//   }

//   Widget EventTile({
//     required String title,
//     required String icon,
//     bool isSelected = false,
//   }) {
//     return InkWell(
//       onTap: () {},
//       child: Container(
//         width: 85,
//         height: 116.0,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16.0),
//           color: isSelected ? null : AppColors.event_tile_unselected_bg_color,
//           gradient: isSelected
//               ? const LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [AppColors.gradient_begin, AppColors.gradient_end],
//                 )
//               : null,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AutoSizeText(
//               title,
//               style: AppTextStyle.event_tile_title_style,
//               minFontSize: 12.0,
//               maxFontSize: 14.0,
//             ),
//             const SizedBox(
//               height: 13.25,
//             ),
//             SvgPicture.asset(
//               icon,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<String> labels = ["Clubs", "Lounge", "Bars", "Beach Club"];
  List<ImageProvider> iconsPicker = [];
  List<String> icons = [
    "assets/icons/2.png",
    "assets/icons/4.png",
    "assets/icons/3.png",
    "assets/icons/1.png",
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: labels.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _buildCategory(index),
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(int index) {
    return Container(
      width: 85,
      height: 116.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: selectedIndex == index
            ? null
            : AppColors.event_tile_unselected_bg_color,
        gradient: selectedIndex == index
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.gradient_begin, AppColors.gradient_end],
              )
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            labels[index],
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 13.25,
          ),
          // SvgPicture.asset(
          //   'assets/icons/ticket.png',
          // ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Image(
              image: AssetImage(icons[index]),
              height: selectedIndex == index ? 44 : 35,
              color: selectedIndex == index ? Colors.white : Color(0xffa17041),
            ),
          ),
        ],
      ),
    );
  }
}
