import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:maternityhelperap/strings/introduction_string.dart';

final pages = [
  PageViewModel(
      pageColor: const Color(0xFF03A9F4),
      //  bubble: CachedNetworkImage(imageUrl: firstImageIcon),
      iconImageAssetPath:
          'images/Woman Head PNG Picture, Face Headed Head Pregnant Woman, Woman, Plant, Plant And Woman PNG Image For Free Download.png',
      body: const Text(firstIntrContentText),
      title: const Text(
        firstIntrTitleText,style: TextStyle(
          fontSize: 30,
        ),
      ),
      textStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      mainImage: Image.asset(
        'images/Woman Head PNG Picture, Face Headed Head Pregnant Woman, Woman, Plant, Plant And Woman PNG Image For Free Download.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      )),
  PageViewModel(
    pageColor: const Color(0xFF8BC34A),
    // bubble: CachedNetworkImage(imageUrl: secondImageIcon),
    iconImageAssetPath: 'images/imagetwo.png',

    body: const Text(secondIntrContentText),
    title: const Text(secondIntrTitleText,style: TextStyle(
      fontSize: 30,
    ),),
    mainImage: Image.asset(
      'images/imagetwo.png',
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
    textStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
  ),
  PageViewModel(
    pageColor: const Color(0xFF607D8B),
    //bubble: CachedNetworkImage(imageUrl: thirdImageIcon),
    iconImageAssetPath: 'images/imagethree.png',
    body: const Text(thirdIntrContentText),
    title: const Text(thirdIntrTitleTextt,style: TextStyle(
      fontSize: 30,
    ),),
    mainImage: Image.asset(
      'images/imagethree.png',
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
    textStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
  ),
];
