// ignore_for_file: unused_import, library_private_types_in_public_api, unnecessary_import
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/rendering.dart';
import 'package:maternityhelperap/screen/int1.dart';
import 'package:maternityhelperap/screen/home.dart';
import 'package:maternityhelperap/screen/intro_slider_screen.dart';
import 'package:maternityhelperap/screen/articles.dart';
import 'package:maternityhelperap/commuinty/chat_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.scale(

          backgroundColor: const Color(0xFF806BB2),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF806BB2),
              Color(0xFF806BB2),
            ],
          ),
          childWidget: SizedBox(
            child: Image.asset("images/into.png"),
          ),
          duration: const Duration(seconds: 10),
          animationDuration: const Duration(seconds: 10),
          onAnimationEnd: () => debugPrint("On Scale End"),
          nextScreen: const AnimatedIntroductionSlider()),
    );
  }
}