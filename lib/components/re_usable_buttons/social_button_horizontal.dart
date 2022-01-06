import 'package:ehjz_flutter/constants.dart';
import 'package:flutter/material.dart';

class SocialButtonHorizontal extends StatelessWidget {
  const SocialButtonHorizontal({
    Key? key,
    this.icon,
  }) : super(key: key);
  final icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonTheme(
        minWidth: 374.0,
        height: 63.0,
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 65,
            width: MediaQuery.of(context).size.width / 4.50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Colors.white24, //                   <--- border color
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Center(
                child: Image(
                  image: AssetImage(icon),
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          ),
        ),
      ),
      flex: 0,
    );
  }
}
