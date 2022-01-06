import 'package:flutter/material.dart';

class ProfileNavigation extends StatefulWidget {
  const ProfileNavigation({Key? key}) : super(key: key);

  @override
  State<ProfileNavigation> createState() => _FavouritesNavigationState();
}

class _FavouritesNavigationState extends State<ProfileNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Text(
            'THIS IS ProfileNavigation PAGE',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
