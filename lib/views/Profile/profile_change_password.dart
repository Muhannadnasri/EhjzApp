import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehjz_flutter/components/global.dart';
import 'package:ehjz_flutter/utils/app_style.dart';
import 'package:ehjz_flutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iconly/iconly.dart';

class ProfileChangePassword extends StatefulWidget {
  const ProfileChangePassword({Key? key}) : super(key: key);

  @override
  State<ProfileChangePassword> createState() => _ProfileChangePasswordState();
}

class _ProfileChangePasswordState extends State<ProfileChangePassword> {
  Map profileChangePasswordJson = {};
  String currentPassword = '';
  String newPassword = '';

  var currentPasswordCnt = TextEditingController();
  final _scaffoldKeyProfile = GlobalKey<ScaffoldState>();

  final _profileForm = GlobalKey<FormState>();

  bool obscure = true;
  void initState() {
    super.initState();
    currentPasswordCnt.text = password;

    // getString();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKeyProfile,
      backgroundColor: neutralBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(29.0, 20.0, 35.0, 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        borderRadius: BorderRadius.circular(10.0),
                        child: Ink(
                          height: height * 0.05,
                          width: width * 0.09,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E1E1E),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Icon(
                            IconlyLight.arrow_left_2,
                            color: Colors.white,
                            size: height * 0.023,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      AutoSizeText(
                        'Change Password',
                        style: titleStyle,
                        stepGranularity: 0.1,
                        maxFontSize: (height * 0.0215).roundToDouble(),
                        minFontSize: (height * 0.0215).roundToDouble(),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (_profileForm.currentState!.validate()) {
                          _profileForm.currentState!.save();
                          postProfileChangePassword();
                        }
                      });
                      // setState(() {
                      //   check = !check;
                      //   switch (check) {
                      //     case true:
                      //       {
                      //         check = false;

                      //         // postProfile();
                      //       }
                      //       break;

                      //     case false:
                      //       {
                      //         check = true;
                      //       }
                      //       break;
                      //     default:
                      //   }
                      //   // check!check;
                      //   // check != false;
                      // });
                    },
                    borderRadius: BorderRadius.circular(10.0),
                    child: Ink(
                      height: height * 0.05,
                      width: width * 0.09,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Icon(
                        IconlyBroken.shield_done,
                        color: Colors.green,
                        size: height * 0.023,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Expanded(
                child: ListView(
                  children: [
                    // CircleAvatar(
                    //   backgroundImage: NetworkImage(
                    //       profileJson['avatar_url'] == null
                    //           ? 'https://ehjzapp.com/images/avatar.png'
                    //           : profileJson['avatar_url']),
                    //   radius: 50.0,
                    // ),
                    // const SizedBox(
                    //   height: 25.0,
                    // ),
                    Form(
                      key: _profileForm,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: neutralBackButtonColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: TextFormField(
                              obscureText: obscure,
                              controller: currentPasswordCnt,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscure = !obscure;
                                    });
                                  },
                                  icon: obscure == true
                                      ? Icon(IconlyLight.hide)
                                      : Icon(IconlyLight.show),
                                  color: AppColors.event_text_field_icon_color,
                                ),

                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(IconlyBroken.lock),
                                  color: Colors.white,
                                ),
                                // hintText: 'Correo Electrónico',
                                // hintStyle: TextStyle(color: Colors.white),
                                label: Text('Current Password'),
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              onSaved: (x) {
                                currentPassword = x!;
                              },
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          divider(),
                          Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: neutralBackButtonColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: TextFormField(
                              obscureText: obscure,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    obscure = !obscure;
                                  },
                                  icon: obscure == true
                                      ? Icon(IconlyLight.hide)
                                      : Icon(IconlyLight.show),
                                  color: AppColors.event_text_field_icon_color,
                                ),
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(IconlyBroken.lock),
                                  color: Colors.white,
                                ),
                                // hintText: 'Correo Electrónico',
                                // hintStyle: TextStyle(color: Colors.white),
                                label: Text('New Password'),
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              onSaved: (x) {
                                newPassword = x!;
                              },
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future postProfileChangePassword() async {
    Future.delayed(Duration.zero, () {
      showLoading(true, context);
    });

    try {
      final response = await http.post(
          Uri.parse('https://ehjzapp.com/api/auth/change-password'),
          body: {
            'current-password': currentPassword.toString(),
            'new-password': newPassword.toString(),
            'token': accessToken,
          });

      if (response.statusCode == 200) {
        setState(
          () {
            profileChangePasswordJson = json.decode(response.body);
            // nameCnt.text = profileJson['name'];

            final snackBar = SnackBar(
                content: Text(profileChangePasswordJson['message'].toString()));
            _scaffoldKeyProfile.currentState!.showSnackBar(snackBar);
          },
        );
        showLoading(false, context);
      } else {
        showLoading(false, context);
      }
    } catch (x) {
      print(x);
      showError('Sorry', context, postProfileChangePassword);
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

// Widget profileOption({Icon? icon, required String text}) {
