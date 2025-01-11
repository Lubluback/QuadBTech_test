import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quadbtech_test/view/bottomnav.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    //_navigateToHome();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _navigateToHome(),
    );
    super.initState();
  }

  void _navigateToHome() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNav()),
            ));
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
            child: const Center(
              child: Text(
                "Welcome!",
                style: TextStyle(color: Colors.red, fontSize: 30),
              ),
            )));
  }
}
