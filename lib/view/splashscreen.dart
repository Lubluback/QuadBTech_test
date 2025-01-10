import 'package:flutter/material.dart';
import 'package:quadbtech_test/view/homescreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    _navigateToHome();
    super.initState();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3)); // Splash screen duration
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Homescreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/splashscreenimage.png"))),
            child: const Padding(
              padding: EdgeInsets.only(top: 300, left: 135),
              child: Text(
                "Welcome!",
                style: TextStyle(color: Colors.red, fontSize: 30),
              ),
            )));
  }
}
