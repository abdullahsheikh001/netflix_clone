import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
 import 'package:netflix_clone/Screens/Introductionscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedSplashScreen(
          animationDuration: const Duration(seconds: 2),
          splashIconSize: 400,
          backgroundColor: Colors.black,
          splash: Column(
            children: [
              Center(
                child: SizedBox(
                    width: 400,
                    height: 400,
                    child: Lottie.asset(
                        "assets/images/Animation - 1726817810446.json",
                        fit: BoxFit.contain)),
              ),
            ],
          ),
          nextScreen: const IntroductionScreenPage()),
    );
  }
}
