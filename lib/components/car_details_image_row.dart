import 'package:flutter/material.dart';

class CarDetailsImageRow extends StatelessWidget {
  const CarDetailsImageRow({
    Key? key,
    this.image,
  }) : super(key: key);
  final image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image(
        image: AssetImage(
          image,
        ),
        height: 80.0,
        width: 85.0,
      ),
    );
  }
}
