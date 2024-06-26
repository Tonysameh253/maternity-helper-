// ignore_for_file: unused_import, duplicate_import

import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:maternityhelperap/introduction_pages/introduction_pages.dart';
import 'package:maternityhelperap/screen/home.dart';
import 'package:maternityhelperap/screen/components/login_page.dart';

class AnimatedIntroductionSlider extends StatelessWidget {
  const AnimatedIntroductionSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'introduction Slider', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          onTapDoneButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          pageButtonTextStyles: const TextStyle(
            color: Colors.white,
            fontSize: 15.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}
