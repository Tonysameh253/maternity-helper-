// ignore_for_file: unused_import, library_private_types_in_public_api, unnecessary_import, depend_on_referenced_packages, prefer_const_constructors
import 'dart:async';
import 'dart:ui';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maternityhelperap/screen/AppointTracker.dart';
import 'package:maternityhelperap/screen/camera.dart';
import 'package:maternityhelperap/screen/imagepaker.dart';
import 'package:maternityhelperap/screen/intro_slider_screen.dart';
import 'package:maternityhelperap/screen/splashscreen.dart';
import 'package:maternityhelperap/screen/home.dart';
import 'package:maternityhelperap/screen/components/login_page.dart';
import 'package:maternityhelperap/screen/components/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:maternityhelperap/screen/auth.dart';
import 'package:maternityhelperap/screen/cale.dart';
import 'package:maternityhelperap/screen/camerrra.dart';

void main() async {  
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  
  runApp(
    const MaterialApp(home:LoginPage()),
  );
}
class MYAPP extends StatefulWidget {
   const MYAPP({super.key});

  @override
  _MYAPPState createState() => _MYAPPState();
}

class _MYAPPState extends State<MYAPP> {

  @override
  void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser==null && FirebaseAuth.instance.currentUser!.emailVerified) ? MyHomePage(title: "") : LoginPage(),
      routes:{ "LOGIN": (context) => LoginPage(),
      "SignUp": (context) => SignupPage(),
      "Home": (context) => MyHomePage(title: "home"),
      
      },
      
    );
  }
}

