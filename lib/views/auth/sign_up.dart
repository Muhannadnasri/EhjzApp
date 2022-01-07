import 'package:ehjz_flutter/components/global.dart';
import 'package:ehjz_flutter/components/navigate.dart';
import 'package:ehjz_flutter/components/re_usable_buttons/re_usable_primary_button.dart';
import 'package:ehjz_flutter/components/re_usable_buttons/social_button_horizontal.dart';
import 'package:ehjz_flutter/constants.dart';
import 'package:ehjz_flutter/utils/app_icons.dart';
import 'package:ehjz_flutter/views/auth/login_page.dart';
import 'package:ehjz_flutter/views/auth/otp_verify_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: defaultPadding * 2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Sign up',
                    style: GoogleFonts.montserrat(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffD99453),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              ListView(
                // scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  TextFormField(
                    // controller: 'controller',
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
                      color: Color(0xff6F6F6F),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    // controller: 'controller',
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
                        suffixIcon: Icon(
                          AppIcons.obscureText,
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
                    // controller: 'controller',
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
                    // controller: 'controller',
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
                          AppIcons.email,
                          color: Color(0xff6F6F6F),
                        ),
                        suffixIcon: Icon(
                          AppIcons.obscureText,
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
                    height: defaultPadding,
                  ),
                  ReusablePrimaryButton(
                      childText: 'SIGN UP',
                      textColor: Colors.white,
                      onPressed: () {
                        push(context: context, widget: VerifyOtpInputScreen());
                      },
                      icon: 'assets/icons/right.png'),
                  Row(children: [
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 15.0),
                          child: Divider(
                            color: Colors.white,
                            height: 50,
                          )),
                    ),
                    Container(
                      height: 26,
                      width: 47,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Color(0xff242424),
                      ),
                      child: Center(
                        child: Text(
                          "OR",
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 15.0, right: 10.0),
                          child: Divider(
                            color: Colors.white,
                            height: 100,
                          )),
                    ),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SocialButtonHorizontal(
                        icon: 'assets/icons/iphone.png',
                      ),
                      SocialButtonHorizontal(
                        icon: 'assets/icons/google.png',
                      ),
                      SocialButtonHorizontal(
                        icon: 'assets/icons/fb.png',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          push(context: context, widget: LoginPage());
                        },
                        child: Text(
                          'Sign in',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Color(0xffD99453),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
    // if (_register.currentState.validate()) {
    //   _register.currentState.save();
    // } else {
    //   return;
    // }
    Future.delayed(Duration.zero, () {
      showLoading(true, context);
    });

    try {
      final response = await http.post(
        Uri.parse('https://app.qserve.ml/code/register.php'),
        body: {
          // 'mobile': mobile,
          // 'secretkey': secretKey,
          // 'fullName': fullName,
          // 'email': email,
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          showLoading(false, context);
          // globalName = fullName;
          // globalEmail = email;
          // Navigator.of(context).pushNamedAndRemoveUntil(
          //     HomePage.tag, (Route<dynamic> route) => false);
        });
      }
    } catch (x) {
      showError('',context, register);
    }
  }
}
