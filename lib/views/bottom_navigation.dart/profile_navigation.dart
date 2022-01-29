import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehjz_flutter/utils/app_style.dart';
import 'package:ehjz_flutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfileNavigation extends StatefulWidget {
  const ProfileNavigation({Key? key}) : super(key: key);

  @override
  State<ProfileNavigation> createState() => _FavouritesNavigationState();
}

class _FavouritesNavigationState extends State<ProfileNavigation> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: neutralBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(29.0, 20.0, 35.0, 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                Column(
                  children: [
                    profileInfo(),
                    const SizedBox(
                      height: 69.0,
                    ),
                    profileOption(
                      icon: const Icon(
                        IconlyLight.profile,
                        color: Color(0xFFD99453),
                      ),
                      text: 'Personal Info',
                    ),
                    divider(),
                    profileOption(
                      icon: const Icon(
                        IconlyLight.wallet,
                        color: Color(0xFFD99453),
                      ),
                      text: 'My Wallet',
                    ),
                    divider(),
                    profileOption(
                      icon: const Icon(
                        IconlyLight.calling,
                        color: Color(0xFFD99453),
                      ),
                      text: 'Support',
                    ),
                    divider(),
                    profileOption(
                      icon: const Icon(
                        IconlyLight.paper,
                        color: Color(0xFFD99453),
                      ),
                      text: 'Privacy & Policy',
                    ),
                    divider(),
                    profileOption(
                      icon: const Icon(
                        IconlyLight.logout,
                        color: Color(0xFFFFFFFF),
                      ),
                      text: 'Sign Out',
                    ),
                    const SizedBox(
                      height: 56.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget profileInfo() {
  return Column(
    children: [
      const CircleAvatar(
        backgroundImage: AssetImage('assets/images/avatar.png'),
        radius: 50.0,
      ),
      const SizedBox(
        height: 15.0,
      ),
      Text(
        'Licht Agile',
        style: profileNameStyle,
      ),
      const SizedBox(
        height: 8.0,
      ),
      Text(
        '@lichtagilee',
        style: profileUserIDStyle,
      ),
    ],
  );
}

Widget divider() {
  return Column(
    children: const [
      SizedBox(
        height: 16.0,
      ),
      Divider(
        color: Color(0xFF151515),
      ),
      SizedBox(
        height: 16.0,
      ),
    ],
  );
}

Widget profileOption({Icon? icon, required String text}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Container(
            height: 46.9,
            width: 46.9,
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(11.0),
            ),
            child: icon,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Text(
            text,
            style: profileOptionTextStyle,
          ),
        ],
      ),
      const Icon(
        IconlyLight.arrow_right_2,
        color: Color(0xFFD99453),
      ),
    ],
  );
}
