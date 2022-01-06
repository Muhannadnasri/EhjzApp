import 'package:ehjz_flutter/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      title: 'EHJZ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScaleTransitionWidgetDemo(),
   
    );
  }
}



// class Splash extends StatefulWidget {
//   @override
//   SplashState createState() => new SplashState();
// }

// class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
//   Future checkFirstSeen() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool _seen = (prefs.getBool('seen') ?? false);

//     if (_seen) {
//       Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => VerifyOtp()));
//     } else {
//       await prefs.setBool('seen', true);
//       Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => SplashScreenFirst()));
//     }
//   }

//   @override
//   void afterFirstLayout(BuildContext context) => checkFirstSeen();

//   @override
//   Widget build(BuildContext context) {
//     return Material();
//   }
// }
