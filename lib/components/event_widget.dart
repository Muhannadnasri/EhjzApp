import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatefulWidget {
  final String title;
  final String price;
  final String duration;
  final String image;

  final int index;
  EventWidget({
    required this.title,
    required this.price,
    required this.image,
    required this.index,
    required this.duration,
  });

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: yachtListsSubtitleColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        // border: Border.all(
        //   color: Colors.grey,
        //   width: 1,
        // ),
      ),
      margin: EdgeInsets.only(
          right: widget.index != null ? 16 : 0,
          left: widget.index == 0 ? 16 : 0,
          bottom: 16),
      width: 165,
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Image.network(
                widget.image,
                height: 100,
                fit: BoxFit.cover,
                width: 200,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: pet.favorite ? Colors.red[400] : Colors.white,
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
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
                Row(
                  children: [
                    Text(
                      widget.price,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "(" + widget.duration + ")",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
