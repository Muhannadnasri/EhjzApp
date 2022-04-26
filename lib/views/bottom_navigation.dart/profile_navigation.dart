import 'dart:convert';

import 'package:ehjz_flutter/components/global.dart';
import 'package:ehjz_flutter/utils/app_style.dart';
import 'package:ehjz_flutter/utils/utils.dart';
import 'package:ehjz_flutter/views/Profile/profile_change_password.dart';
import 'package:ehjz_flutter/views/Profile/profile_info.dart';
import 'package:ehjz_flutter/views/Profile/profile_privacy.dart';
import 'package:ehjz_flutter/views/auth/login_page.dart';
import 'package:ehjz_flutter/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileNavigation extends StatefulWidget {
  const ProfileNavigation({Key? key}) : super(key: key);

  @override
  State<ProfileNavigation> createState() => _ProfileNavigationState();
}

class _ProfileNavigationState extends State<ProfileNavigation> {
  Map profileJson = {};
  void initState() {
    super.initState();
    profile();
  }

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
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              profileJson['avatar_url'] == null
                                  ? 'https://ehjzapp.com/images/avatar.png'
                                  : profileJson['avatar_url']),
                          radius: 50.0,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          profileJson['name'] == null
                              ? 'Name'
                              : profileJson['name'].toString(),
                          // 'Licht Agile',
                          style: profileNameStyle,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          profileJson['email'] == null
                              ? 'Email'
                              : profileJson['email'].toString(),
                          style: profileUserIDStyle,
                        ),
                      ],
                    ),

                    // profileInfo(),
                    const SizedBox(
                      height: 69.0,
                    ),
                    profileOption(
                        icon: const Icon(
                          IconlyLight.profile,
                          color: Color(0xFFD99453),
                        ),
                        text: 'Personal Info',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileInfo(),
                              ));
                        }),
                    divider(),
                    profileOption(
                        icon: const Icon(
                          IconlyLight.wallet,
                          color: Color(0xFFD99453),
                        ),
                        text: 'Change Password',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileChangePassword(),
                              ));
                        }),
                    divider(),

                    profileOption(
                        icon: const Icon(
                          IconlyLight.paper,
                          color: Color(0xFFD99453),
                        ),
                        text: 'Privacy & Policy',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePrivacy(),
                              ));
                        }),

                    divider(),
                    profileOption(
                        icon: const Icon(
                          IconlyLight.logout,
                          color: Color(0xFFFFFFFF),
                        ),
                        text: 'Sign Out',
                        onTap: () {
                          setState(() {
                            logOut(context);
                          });
                        }),
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

  Future logOut(context) async {
    Future.delayed(Duration.zero, () {
      showLoading(true, context);
    });

    try {
      final response = await http
          .post(Uri.parse('https://ehjzapp.com/api/auth/logout'), body: {
        'token': accessToken,
      });

      if (response.statusCode == 200) {
        showLoading(false, context);

        email = '';
        password = '';
        loggedin = false;
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString('email', email);

        prefs.setString('password', password); // runApp(const MyApp());
        setState(() {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => ScaleTransitionWidgetDemo()),
              (Route<dynamic> route) => false);
        });

        // Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (context) => LoginPage()),
        //     (Route<dynamic> route) => false);

      } else {
        showLoading(false, context);
      }
    } catch (x) {
      print(x);
      showError('Sorry', context, logOut);
    }
  }

  Future profile() async {
    Future.delayed(Duration.zero, () {
      showLoading(true, context);
    });

    try {
      final response = await http
          .get(Uri.parse('https://ehjzapp.com/api/auth/me?token=$accessToken'));

      if (response.statusCode == 200) {
        setState(
          () {
            profileJson = json.decode(response.body)['data'];
          },
        );
        showLoading(false, context);
      } else {
        showLoading(false, context);
      }
    } catch (x) {
      print(x);
      showError('Sorry', context, profile);
    }
  }
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

Widget profileOption({Icon? icon, required String text, onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: onTap,
        child: Row(
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
      ),
      const Icon(
        IconlyLight.arrow_right_2,
        color: Color(0xFFD99453),
      ),
    ],
  );
}
