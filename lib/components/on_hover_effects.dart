// import 'package:flutter/material.dart';

// class OnHoverButton extends StatefulWidget {
//   OnHoverButton({Key? key, required this.builder}) : super(key: key);

//   final Widget Function(bool isHovered) builder;
//   @override
//   _OnHoverButtonState createState() => _OnHoverButtonState();
// }

// class _OnHoverButtonState extends State<OnHoverButton> {
//   bool isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     final hovered = Matrix4.identity()..translate(1.6);
//     final transformCon = isHovered ? hovered : Matrix4.identity();
//     return MouseRegion(
//       onEnter: (event) => onEntered(true),
//       onExit: (event) => onEntered(false),
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 300),
//         child: widget.builder(isHovered),
//         transform: transformCon,
//       ),
//     );
//   }

//   void onEntered(bool isHovered) => {
//         setState(() {
//           isHovered = !isHovered;
//         })
//       };
// }
