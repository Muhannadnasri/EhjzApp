// ignore_for_file: file_names
import 'package:ehjz_flutter/components/re_usable_buttons/primary_button.dart';
import 'package:ehjz_flutter/utils/app_style.dart';
import 'package:ehjz_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

class LoadView extends StatefulWidget {
  const LoadView({Key? key}) : super(key: key);

  @override
  _LoadViewState createState() => _LoadViewState();
}

class _LoadViewState extends State<LoadView> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // bottomNavigationBar: BlockNavigationBar(
      //   index: 2,
      // ),
      backgroundColor: neutralBackgroundColor,
      body: SafeArea(
        child: Center(
          // padding: const EdgeInsets.fromLTRB(29.0, 20.0, 35.0, 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 180.0,
                width: 188.0,
                child: Image.asset('assets/icons/logo.png'),
              ),
              const SizedBox(
                height: 13.0,
              ),
              Text(
                'No data yet',
                style: purchaseTitleStyle,
              ),
              const SizedBox(
                height: 13.0,
              ),
              SizedBox(
                width: 230.0,
                child: Text(
                  'Please wait it will appear here',
                  textAlign: TextAlign.center,
                  style: purchaseCaptionStyle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                childText: 'Back',
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
