import 'package:flutter/material.dart';
import 'package:second_app/features/presentation/components/shop_drawer.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false, home: new SplashLogo()));
}

class SplashLogo extends StatefulWidget {
  @override
  _SplashLogoState createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      routeName: "/",
      seconds: 15,
      backgroundColor: Colors.black,
      image: Image.asset('assets/images/spinner2.gif'),
      loaderColor: Colors.blue[300],
      photoSize: 150.0,
      navigateAfterSeconds: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          '🏆🤑🏆 Get Hyped 🏆🤑🏆',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: ShopDrawer(),
      body: Container(
        height: 500,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage("assets/images/hypeweek.gif"),
          ),
        ),
      ),
    );
  }
}
