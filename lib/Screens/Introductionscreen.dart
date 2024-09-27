import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:netflix_clone/Screens/Homescreen.dart';

class IntroductionScreenPage extends StatelessWidget {
  const IntroductionScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black, 
        title: Padding(
          padding: const EdgeInsets.only(right: 110),
          child: Image.asset(
            "assets/images/netflixlogo.png",
            fit: BoxFit.cover,
          ),
        ),
        toolbarHeight: 90,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Row(
              children: [
                Text(
                  "PRIVACY",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white, 
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "SIGN IN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white, 
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
       
      body: IntroductionScreen(
        globalBackgroundColor: Colors.black,
        pages: [
          PageViewModel(
            title: "Unlimited movies, TV shows & more",
            body: "Watch anywhere, cancel anytime",
            image: Center(
              child: Image.asset('assets/images/onboarding2.png', height: 500),
            ),
            decoration: const PageDecoration(
              pageColor: Colors.black, 
              titleTextStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white, 
              ),
              bodyTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.white54, 
              ),
            ),
          ),
          PageViewModel(
            title: "Cancel online, anytime",
            body: " Join today, no reason to wait.",
            image: Center(
              child: Image.asset('assets/images/onboarding1.png', height: 500),
            ),
            decoration: const PageDecoration(
              pageColor: Colors.black, 
              titleTextStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white, 
              ),
              bodyTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.white54, 
              ),
            ),
          ),
          PageViewModel(
            title: "Watch everywhere",
            body: "Stream on your phone, tablet, laptop and TV",
            image: Center(
              child: Image.asset('assets/images/onboarding3.png', height: 500),
            ),
            decoration: const PageDecoration(
              pageColor: Colors.black, 
              titleTextStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white, 
              ),
              bodyTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.white54, 
              ),
            ),
          ),
        ],
        onDone: () {
          
          Get.off(const Homescreen());
        },
        onSkip: () {
           
          Get.off(const Homescreen());
        },
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, 
          ),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: Colors.white, 
        ),
        done: const Text(
          "Done",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, 
          ),
        ),
        dotsDecorator: DotsDecorator(
          
          size: const Size(10.0, 10.0),
          color: Colors.white, 
          activeSize: const Size(22.0, 10.0),
          activeColor: Colors.red, 
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
    );
  }
}
