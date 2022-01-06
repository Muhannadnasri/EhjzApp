import 'dart:async';

import 'package:ehjz_flutter/components/navigate.dart';
import 'package:ehjz_flutter/views/splash/onboard_screen.dart';
import 'package:flutter/material.dart';

class ScaleTransitionWidgetDemo extends StatefulWidget {
  @override
  _ScaleTransitionWidgetDemoState createState() =>
      _ScaleTransitionWidgetDemoState();
}

class _ScaleTransitionWidgetDemoState extends State<ScaleTransitionWidgetDemo>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        seconds: 2,
      ),
      vsync: this,
      value: 0.1,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );
    Timer(const Duration(seconds: 2), () {
      pushRemove(context: context, widget: OnBoardScreen());
    });
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: ScaleTransition(
          scale: _animation,
          alignment: Alignment.center,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/icons/logo.png'),
                  height: 180,
                  width: 180,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
