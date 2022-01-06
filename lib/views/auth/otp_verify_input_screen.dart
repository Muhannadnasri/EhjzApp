import 'dart:async';
import 'package:ehjz_flutter/components/navigate.dart';
import 'package:ehjz_flutter/components/re_usable_buttons/re_usable_primary_button.dart';
import 'package:ehjz_flutter/constants.dart';
import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:ehjz_flutter/views/homepage_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpInputScreen extends StatefulWidget {
  const VerifyOtpInputScreen({Key? key}) : super(key: key);

  @override
  _VerifyOtpInputScreenState createState() => _VerifyOtpInputScreenState();
}

class _VerifyOtpInputScreenState extends State<VerifyOtpInputScreen> {
  bool hasError = false;
  String? currentText = "";
  Timer? _timer;
  int _start = 20;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: defaultPadding * 3),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Verification',
                    style: GoogleFonts.montserrat(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffD99453),
                    )),
              ),
              const SizedBox(
                height: defaultPadding + 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'We’ve send you the verification\n code on +971 55 22 825 33',
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: PinCodeTextField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            appContext: context,
                            pastedTextStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 22.0,
                                color: Colors.white),
                            length: 4,
                            obscureText: false,

                            hintCharacter: "",
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 100.0,
                              color: Colors.white,
                            ),
                            errorTextSpace: 25.0,
                            pinTheme: PinTheme(
                              borderRadius: BorderRadius.circular(5),
                              shape: PinCodeFieldShape.box,
                              fieldHeight: 65,
                              activeColor: Colors.white10,
                              fieldWidth: 65,
                              inactiveColor: Colors.white10,
                              activeFillColor:
                                  hasError ? Colors.orange : Colors.amber,
                            ),
                            animationType: AnimationType.fade,
                            // controller: _otpController,
                            validator: (v) {
                              if (v!.length < 5) {
                                return "Please Fill all fields";
                              } else {
                                return null;
                              }
                            },
                            cursorColor: Colors.white,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            textStyle: const TextStyle(
                                fontSize: 30, color: Colors.white),
                            // errorAnimationController: errorController,

                            keyboardType: TextInputType.number,

                            onCompleted: (v) {
                              print("Completed");
                            },
                            // onTap: () {
                            //   print("Pressed");
                            // },
                            onChanged: (value) {
                              setState(() {
                                currentText = value;
                                print(currentText);
                              });
                            },
                            beforeTextPaste: (text) {
                              return true;
                            },
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              ReusablePrimaryButton(
                  childText: 'CONTINUE',
                  textColor: Colors.white,
                  icon: 'assets/icons/right.png',
                  onPressed: () {
                    push(context: context, widget: HomePageRoutes());
                  }),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Re-send code in',
                    style: GoogleFonts.montserrat(
                        fontSize: 17, color: Colors.white),
                  ),
                  InkWell(
                      onTap: () {
                        startTimer();
                      },
                      child: Text(" 00:$_start",
                          style: const TextStyle(
                              fontSize: 14, color: AppColors.gradient_end))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
