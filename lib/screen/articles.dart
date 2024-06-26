// ignore_for_file: sort_child_properties_last, duplicate_ignore, prefer_const_constructors, avoid_print, unused_import, unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:maternityhelperap/screen/AppointTracker.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:maternityhelperap/screen/food.dart';
import 'package:maternityhelperap/screen/Exercise and  wellness.dart';

// ignore: depend_on_referenced_packages, unused_import

class Articles extends StatefulWidget {
  const Articles({super.key, required this.title});
  final String title;
  @override
  // ignore: library_private_types_in_public_api
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Food(title: "")));
          },
        ),
        title: const Text(
          'Articles',style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 244, 240, 240),
        toolbarHeight: 50,
        toolbarOpacity: 1,
      ),
body:SingleChildScrollView(
      child: Center(
        child: Padding(padding:  const EdgeInsets.all(8.0),
        child: Text(
              'Certainly! Proper nutrition during pregnancy is crucial for the health and well-being of both the mother and the developing baby. Here are some key articles that can guide you in understanding the dietary needs during pregnancy:1.The Importance of Nutrition During Pregnancy This article would discuss the significance of nutrition during pregnancy, highlighting how it supports the baby\'s growth and development while also aiding the mother\'s health.2. Essential Nutrients for Pregnant Women Its essential to know which nutrients are particularly important during pregnancy. This article should cover nutrients like folic acid, iron, calcium, vitamin D, omega-3 fatty acids, and others, explaining why they are crucial and which foods are good sources.3. Foods to Avoid During Pregnancy Certain foods can pose risks during pregnancy due to the potential for foodborne illnesses or other complications. This article should outline foods to avoid or limit during pregnancy, such as raw fish, unpasteurized dairy products, deli meats, and excessive caffeine.4. Healthy Meal Planning for Pregnant Women**: Planning balanced meals is key to ensuring proper nutrition during pregnancy. This article can provide tips and sample meal plans that include a variety of nutrient-rich foods to support the needs of both the mother and the growing baby.5. Managing Pregnancy Cravings**: Many pregnant women experience cravings, which can sometimes be for unhealthy foods. This article should offer strategies for managing cravings in a healthy way, such as finding nutritious alternatives and practicing moderation.6. Gestational Diabetes and Nutrition**: Gestational diabetes is a condition that can develop during pregnancy and requires careful management of blood sugar levels through diet and lifestyle. This article should discuss dietary recommendations for women with gestational diabetes, including monitoring carbohydrate intake and choosing nutrient-dense foods.',
              textAlign: TextAlign.justify,
            ),
        ),
        
),
   ),
    );
  }
}
