import 'package:flutter/material.dart';

class CouponsNavigation extends StatefulWidget {
  const CouponsNavigation({Key? key}) : super(key: key);

  @override
  State<CouponsNavigation> createState() => _FavouritesNavigationState();
}

class _FavouritesNavigationState extends State<CouponsNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Text(
            'THIS IS CouponsNavigation PAGE',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
