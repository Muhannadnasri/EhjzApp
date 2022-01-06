import 'dart:async';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:ehjz_flutter/components/navigate.dart';
import 'package:ehjz_flutter/views/splash/onboard_screen.dart';
import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   @override
//   initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(
//         seconds: 2,
//       ),
//       vsync: this,
//       value: 0.1,
//     );
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.bounceIn,
//     );
//     Timer(const Duration(seconds: 2), () {
//       pushRemove(context: context, widget: OnBoardScreen());
//     });
//   }

//   @override
//   dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   Timer(const Duration(seconds: 2), () {
//   //     pushRemove(context: context, widget: OnBoardScreen());
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.app_bg_color,
//       // appBar: AppBar(
//       //   backgroundColor: AppColors.app_bg_color,
//       //   elevation: 0,
//       // ),
//       // body: Center(
//       //   child: Stack(
//       //     alignment: Alignment.center,
//       //     children: [
//       //       Center(
//       //         child: Image(
//       //             image: AssetImage('assets/logos/dd1.png'),
//       //             height: 340,
//       //             width: 340,
//       //             color: Color(0xfff101010)),
//       //       ),
//       //       // Center(
//       //       //   child: Image(
//       //       //     image: AssetImage('assets/icons/logo.png'),
//       //       //     height: 180,
//       //       //     width: 180,
//       //       //   ),
//       //       // ),
//       //       Container(
//       //         child: ScaleTransition(
//       //           scale: _animation,
//       //           alignment: Alignment.center,
//       //           child: Center(
//       //             child: Row(
//       //               mainAxisAlignment: MainAxisAlignment.center,
//       //               crossAxisAlignment: CrossAxisAlignment.center,
//       //               children: [
//       //                 Image(
//       //                   image: AssetImage('assets/icons/logo.png'),
//       //                   height: 300,
//       //                   width: 300,
//       //                 ),
//       //               ],
//       //             ),
//       //           ),
//       //         ),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//       body: LayoutBuilder(builder: (context, constraints) {
//         return Stack(
//           children: [
//             Positioned(
//               top: constraints.maxHeight * 0.30,
//               left: constraints.maxWidth * 0.10,
//               child: Image(
//                   image: AssetImage('assets/logos/dd1.png'),
//                   height: 340,
//                   width: 340,
//                   color: Color(0xfff101010)),
//             ),
//             ScaleTransition(
//               scale: _animation,
//               alignment: Alignment.center,
//               child: Center(
//                 child: Image(
//                   image: AssetImage('assets/icons/logo.png'),
//                   height: 300,
//                   width: 300,
//                 ),
//               ),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }

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
    )..repeat(reverse: false);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );
    Timer(const Duration(seconds: 3), () {
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
        backgroundColor: Colors.black,
        body: SizedBox(
          height: 600,
          width: 400,
          child: Stack(
            children: [
              Positioned(
                top: 220,
                left: 25,
                child: Image.asset(
                  "assets/logos/dd1.png",
                  height: 340,
                  width: 340,
                  color: Color(0xfff101010),
                ),
              ),
              Positioned(
                top: 308,
                left: 103,
                child: FadeAnimation(
                  duration: Duration(seconds: 3),
                  child: Image.asset(
                    "assets/icons/logo.png",
                    height: 170,
                    width: 170,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
