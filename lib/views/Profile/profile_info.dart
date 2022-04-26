import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ehjz_flutter/components/global.dart';
import 'package:ehjz_flutter/utils/app_style.dart';
import 'package:ehjz_flutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iconly/iconly.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  Map profileJson = {};
  Map postProfileJson = {};
  String firstName = '';
  String lastName = '';

  String email = '';

  String city = '';

  String country = '';

  String phone = '';

  var firstNameCnt = TextEditingController();

  var lastNameCnt = TextEditingController();

  var emailCnt = TextEditingController();

  var cityCnt = TextEditingController();

  var countryCnt = TextEditingController();
  var phoneCnt = TextEditingController();
  final _scaffoldKeyProfile = GlobalKey<ScaffoldState>();

  final _profileForm = GlobalKey<FormState>();
  bool check = false;
  void initState() {
    super.initState();
    profile();
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
                        'Personal Info',
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
                        check = !check;

                        if (check ==
                            false & _profileForm.currentState!.validate()) {
                          _profileForm.currentState!.save();
                          postProfile();
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
                      child: check == true
                          ? Icon(
                              IconlyBroken.shield_done,
                              color: Colors.green,
                              size: height * 0.023,
                            )
                          : Icon(
                              IconlyLight.edit,
                              color: Colors.white,
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
                              enabled: check,
                              controller: firstNameCnt,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.people),
                                  color: check == true
                                      ? Colors.white
                                      : AppColors.event_text_field_icon_color,
                                ),
                                // hintText: 'Correo Electrónico',
                                // hintStyle: TextStyle(color: Colors.white),
                                label: Text('First Name'),
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              onSaved: (x) {
                                firstName = x!;
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
                              enabled: check,
                              controller: lastNameCnt,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.people),
                                  color: check == true
                                      ? Colors.white
                                      : AppColors.event_text_field_icon_color,
                                ),
                                // hintText: 'Correo Electrónico',
                                // hintStyle: TextStyle(color: Colors.white),
                                label: Text('Last Name'),
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              onSaved: (x) {
                                lastName = x!;
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
                              enabled: check,
                              controller: emailCnt,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.people),
                                  color: check == true
                                      ? Colors.white
                                      : AppColors.event_text_field_icon_color,
                                ),
                                // hintText: 'Correo Electrónico',
                                // hintStyle: TextStyle(color: Colors.white),
                                label: Text('Email'),
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              onSaved: (x) {
                                email = x!;
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
                              enabled: check,
                              controller: cityCnt,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.people),
                                  color: check == true
                                      ? Colors.white
                                      : AppColors.event_text_field_icon_color,
                                ),
                                // hintText: 'Correo Electrónico',
                                // hintStyle: TextStyle(color: Colors.white),
                                label: Text('City'),
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              onSaved: (x) {
                                city = x!;
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
                              enabled: check,
                              controller: countryCnt,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.people),
                                  color: check == true
                                      ? Colors.white
                                      : AppColors.event_text_field_icon_color,
                                ),
                                // hintText: 'Correo Electrónico',
                                // hintStyle: TextStyle(color: Colors.white),
                                label: Text('Country'),
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              onSaved: (x) {
                                country = x!;
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
                              enabled: check,
                              controller: phoneCnt,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.people),
                                  color: check == true
                                      ? Colors.white
                                      : AppColors.event_text_field_icon_color,
                                ),
                                // hintText: 'Correo Electrónico',
                                // hintStyle: TextStyle(color: Colors.white),
                                label: Text('Phone'),
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              onSaved: (x) {
                                phone = x!;
                              },
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          divider(),
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

  Future postProfile() async {
    Future.delayed(Duration.zero, () {
      showLoading(true, context);
    });

    try {
      final response = await http.post(
          Uri.parse('https://ehjzapp.com/api/auth/me?token=$accessToken'),
          body: {
            'first_name': firstName.toString(),
            'last_name': lastName.toString(),
            'email': email.toString(),
            'city': city.toString(),
            'country': country.toString(),
            'phone': phone.toString(),
          });

      if (response.statusCode == 200) {
        setState(
          () {
            postProfileJson = json.decode(response.body);
            // nameCnt.text = profileJson['name'];
            check = false;
            if (postProfileJson['message'] == "Update successfully") {
              final snackBar = SnackBar(
                  content: Text(postProfileJson['message'].toString()));
              _scaffoldKeyProfile.currentState!.showSnackBar(snackBar);
            }
          },
        );
        showLoading(false, context);
      } else {
        showLoading(false, context);
      }
    } catch (x) {
      print(x);
      showError('Sorry', context, postProfile);
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
            firstNameCnt.text = profileJson['first_name'].toString();
            lastNameCnt.text = profileJson['last_name'].toString();
            emailCnt.text = profileJson['email'].toString();
            cityCnt.text = profileJson['city'].toString();
            countryCnt.text = profileJson['country'].toString();
            phoneCnt.text = profileJson['phone'].toString();
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

// Widget profileOption({Icon? icon, required String text}) {
