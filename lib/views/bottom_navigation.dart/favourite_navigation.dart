import 'package:flutter/material.dart';

class FavouritesNavigation extends StatefulWidget {
  const FavouritesNavigation({Key? key}) : super(key: key);

  @override
  State<FavouritesNavigation> createState() => _FavouritesNavigationState();
}

class _FavouritesNavigationState extends State<FavouritesNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Text(
            'THIS IS FavouritesNavigation PAGE',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
