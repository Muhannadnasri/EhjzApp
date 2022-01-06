import 'package:ehjz_flutter/components/navigate.dart';
import 'package:ehjz_flutter/components/re_usable_buttons/re_usable_primary_button.dart';
import 'package:ehjz_flutter/components/re_usable_buttons/social_button.dart';
import 'package:ehjz_flutter/constants.dart';
import 'package:ehjz_flutter/utils/app_icons.dart';
import 'package:ehjz_flutter/views/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                child: Text('Sign in',
                    style: GoogleFonts.montserrat(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffD99453),
                    )),
              ),
              ListView(
                shrinkWrap: true,
                // scrollDirection: Axis.vertical,
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
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 50,
                        child: GFToggle(
                          type: GFToggleType.ios,
                          enabledTrackColor: Color(0xffD99453),
                          onChanged: (val) {},
                          value: true,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Remember Me',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: Colors.white,
                          )),
                      Spacer(),
                      TextButton(
                        child: Text('Forgot Password?',
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Colors.white,
                            )),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  ReusablePrimaryButton(
                      childText: 'SIGN IN',
                      textColor: Colors.white,
                      onPressed: () {},
                      icon: 'assets/icons/right.png'),
                  Row(children: [
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 15.0),
                          child: Divider(
                            color: Colors.white,
                            height: 80,
                          )),
                    ),
                    SizedBox(
                      height: defaultPadding,
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
                            height: 80,
                          )),
                    ),
                  ]),
                  SocialButton(
                    icon: 'assets/icons/apple.png',
                    label: 'Continue with Apple',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SocialButton(
                    icon: 'assets/icons/google.png',
                    label: 'Continue with Google',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SocialButton(
                    icon: 'assets/icons/fb.png',
                    label: 'Continue with Facebook',
                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
