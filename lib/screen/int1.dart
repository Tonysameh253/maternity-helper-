import 'package:animated_introduction/animated_introduction.dart';
import 'package:flutter/material.dart';

final List<SingleIntroScreen> pages = [
  const SingleIntroScreen(
    title: 'A personalized support',
    description:
        'Each day, a dashboard specially designed for your profile, the stage of your pregnancy and your symptoms.',
    imageAsset:
        'images/Woman Head PNG Picture, Face Headed Head Pregnant Woman, Woman, Plant, Plant And Woman PNG Image For Free Download.png',
  ),
  const SingleIntroScreen(
    title: 'The only credible pregnancy application',
    description:
        'advice recipes quizzes the whole content written experts and approved by doctors',
    imageAsset: 'images/imagetwo.png',
  ),
  const SingleIntroScreen(
    title: 'this is not an app this is love ',
    description:
        'The mont complete pregnancy appication,which ansists you to be the best Moms ',
    imageAsset: 'images/imagethree.png',
  ),
];
// ignore: file_names
// ignore_for_file: unused_import

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _page3State();
}

// ignore: camel_case_types
class _page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Introduction',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF806BB2)),
        useMaterial3: true,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedIntroduction(
      slides: pages,
      indicatorType: IndicatorType.circle,
      onDone: () {},
    );
  }
}
