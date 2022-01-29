import 'dart:convert';

import 'package:ehjz_flutter/components/global.dart';
import 'package:ehjz_flutter/components/navigate.dart';
import 'package:ehjz_flutter/components/re_usable_buttons/re_usable_primary_button.dart';
import 'package:ehjz_flutter/constants.dart';
import 'package:ehjz_flutter/utils/app_icons.dart';
import 'package:ehjz_flutter/views/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../bottom_navigation.dart/homepage_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKeyLogin = GlobalKey<ScaffoldState>();
  final _logInForm = GlobalKey<FormState>();

  String email = '';
  String password = '';
  var emailCnt = TextEditingController();
  var passwordCnt = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getString();
  }

  Future getString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    email = (prefs.getString('email') ?? '');
    password = (prefs.getString('password') ?? '');

    if (email != "" && password != "") {
      emailCnt.text = email;
      passwordCnt.text = password;
      login();
    } else {
      emailCnt.text = email;
      passwordCnt.text = password;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKeyLogin,
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: defaultPadding * 2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Sign in',
                    style: GoogleFonts.montserrat(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffD99453),
                    )),
              ),
              Form(
                key: _logInForm,
                child: ListView(
                  shrinkWrap: true,
                  // scrollDirection: Axis.vertical,
                  children: [
                    TextFormField(
                      onSaved: (x) {
                        email = x!;
                      },
                      controller: emailCnt,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: const Color(0xff2E2E2E),
                          hintText: 'abc@email.com',
                          prefixIcon: Icon(
                            AppIcons.email,
                            color: Color(0xff6F6F6F),
                          ),
                          hintStyle: const TextStyle(
                            color: Color(0xff6F6F6F),
                          )),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onSaved: (x) {
                        password = x!;
                      },
                      obscureText: true,
                      controller: passwordCnt,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: const Color(0xff2E2E2E),
                          hintText: 'Your password',
                          prefixIcon: Icon(
                            AppIcons.locked,
                            color: Color(0xff6F6F6F),
                          ),
                          // suffixIcon: Icon(
                          //   AppIcons.obscureText,
                          //   color: Color(0xff6F6F6F),
                          // ),
                          hintStyle: const TextStyle(
                            color: Color(0xff6F6F6F),
                          )),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    ReusablePrimaryButton(
                        childText: 'SIGN IN',
                        textColor: Colors.white,
                        onPressed: () {
                          if (_logInForm.currentState!.validate()) {
                            _logInForm.currentState!.save();
                          } else {
                            return;
                          }
                          setState(() {
                            login();
                          });
                        },
                        icon: 'assets/icons/right.png'),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: GoogleFonts.montserrat(
                              fontSize: 14, color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            push(context: context, widget: SignUpPage());
                          },
                          child: Text(
                            'Sign up',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Color(0xffD99453),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future login() async {
    Future.delayed(Duration.zero, () {
      showLoading(true, context);
    });
    try {
      final response = await http.post(
        Uri.parse('https://ehjzapp.com/api/auth/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        setState(
          () {
            loginJson = json.decode(response.body);
            accessToken = loginJson['access_token'];
          },
        );
        showLoading(false, context);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);
        prefs.setString('password', password);
        loggedin = true;
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePageRoutes()),
            (Route<dynamic> route) => false);
      } else if (loginJson['status'] == 0) {
        final snackBar =
            SnackBar(content: Text(loginJson['message'].toString()));
        _scaffoldKeyLogin.currentState!.showSnackBar(snackBar);
        showLoading(false, context);
      } else {
        showLoading(false, context);
      }
    } catch (x) {
      showError('Sorry', context, login);
    }
  }
}
