import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:second_app/features/presentation/components/shop_drawer.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:second_app/features/presentation/pages/shop/landing_screen.dart';

// void main() {
//   runApp(new MaterialApp(
//       debugShowCheckedModeBanner: false, home: new SplashLogo()));
// }

class SplashLogo extends StatefulWidget {
  @override
  _SplashLogoState createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      routeName: "/",
      seconds: 5,
      backgroundColor: Colors.black,
      image: Image.asset('assets/images/spinner2.gif'),
      loadingText: Text(
        '🚀 Let\'s get Hype! 🚀',
        style: GoogleFonts.permanentMarker(
          textStyle: TextStyle(
              color: Colors.purple[500], letterSpacing: .5, fontSize: 30),
        ),
      ),
      loaderColor: Colors.black,
      photoSize: 150.0,
      navigateAfterSeconds: LandingScreen(),
    );
  }
}
