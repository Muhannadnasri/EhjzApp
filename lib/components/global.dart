import 'package:ehjz_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Map loginJson = {};
bool loggedin = false;
String accessToken = '';

String email = '';
String password = '';
void showLoading(isLoading, context) {
  if (isLoading) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: null,
            child: new AlertDialog(
              backgroundColor: neutralGridTileColor,
              // title: Image.asset(
              //   'assets/logos/logo.png',
              //   height: 50,
              //   // color: isDark(context) ? Colors.white : Colors.black,
              // ),
              // shape: SuperellipseShape(
              //   borderRadius: BorderRadius.all(
              //     Radius.circular(20),
              //   ),
              // ),
              content: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: <Widget>[
                    SpinKitFadingCircle(
                      color: AppColors.gradient_begin,
                    ),
                    new Text(
                      'Please Wait....',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  } else {
    Navigator.pop(context);
  }
}

void showError(String msg, context, action) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: null,
          child: new AlertDialog(
            title: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/logos/logo.png',
                  color: Colors.white,
                  height: 50,
                ),
                Image.asset(
                  'assets/logos/logo.png',
                  height: 50,
                ),
              ],
            ),
            content: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: FittedBox(
                child: new Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: new Icon(
                        Icons.wifi_off,
                        color: Colors.white,
                      ),
                    ),
                    new Text(msg)
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: new Text('Back'),
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.pop(context);

                  action();
                },
                child: new Text('Try again'),
              ),
            ],
          ),
        );
      });
}
