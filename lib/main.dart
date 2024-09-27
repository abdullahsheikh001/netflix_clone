import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
 import 'package:netflix_clone/Screens/Splashscreen.dart';
 
Future main() async {
  FlutterNativeSplash.remove();
  runApp(const Netflix_clone());
}

// ignore: camel_case_types
class Netflix_clone extends StatelessWidget {
  const Netflix_clone({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const Splashscreen(),
    );
  }
}
