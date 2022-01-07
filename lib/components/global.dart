import 'package:flutter/material.dart';

Map loginJson = {};
bool loggedin = false;
void showLoading(isLoading, context) {
  if (isLoading) {
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
                    height: 50,
                    // color: isDark(context) ? Colors.white : Colors.black,
                  ),
                  Image.asset(
                    'assets/logos/logo.png',
                    height: 50,
                  ),
                ],
              ),
              // shape: SuperellipseShape(
              //   borderRadius: BorderRadius.all(
              //     Radius.circular(20),
              //   ),
              // ),
              content: Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Row(
                  children: <Widget>[
                    new Text('Please Wait....'),
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
