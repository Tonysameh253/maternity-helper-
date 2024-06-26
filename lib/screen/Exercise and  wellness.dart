// ignore_for_file: sort_child_properties_last, duplicate_ignore, prefer_const_constructors, avoid_print, unused_import, file_names
import 'package:flutter/material.dart';
import 'package:maternityhelperap/screen/food.dart';
import 'package:maternityhelperap/src/multi_video_model.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:maternityhelperap/screen/home.dart';
import 'package:maternityhelperap/screen/Appointtracker.dart';
import 'package:maternityhelperap/screen/meal plan.dart';
import 'package:maternityhelperap/screen/video.dart';
import 'package:maternityhelperap/src/multi_video_player_home.dart';


// ignore: depend_on_referenced_packages, unused_import
class Exercise extends StatefulWidget {
  const Exercise({super.key, required this.title});
  final String title;
  @override
  // ignore: library_private_types_in_public_api
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  var currentPageIndex = 0;
  int _selectedIndex = 0;
  int _selectedTab = 0;
  
  get flickManager =>0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<dynamic> videos = [
    'https://www.youtube.com/watch?v=D75ClMK09TA',
    'https://www.youtube.com/watch?v=D75ClMK09TA',
    'https://www.youtube.com/watch?v=D75ClMK09TA',
    'https://www.youtube.com/watch?v=D75ClMK09TA',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFdbd7d2),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50)),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
          ),
        ],
        title: const Text(
          'Exercise and wellness',
        ),
        backgroundColor: const Color(0xFF806BB2),
        toolbarHeight: 100,
        toolbarOpacity: 1,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF806BB2),
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Help'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('School'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      // ignore: prefer_const_constructors
    body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Add your logic here for what happens when the card is pressed
                                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>MultiVideoPlayer.network(videoSourceList: videos, height:400, width: 400)),
);
              },
              child: Card(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                margin: const EdgeInsets.all(30.0),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            alignment: Alignment.centerLeft,
                            image: AssetImage('images/pregnant.gif'),
                          ),
                        ),
                        height: 100,
                        width: 150,
                      ),
                      const SizedBox(),
                      Expanded(
                        child: Text(
                          'Yoga Routine',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Add your logic here for what happens when the card is pressed
                print('Card pressed!');
              },
              child: Card(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                margin: const EdgeInsets.all(30.0),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            alignment: Alignment.centerLeft,
                            image: AssetImage('images/gym.gif'),
                          ),
                        ),
                        height: 100,
                        width: 150,
                      ),
                      const SizedBox(),
                      Expanded(
                        child: Text(
                          'Wellness Advice',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedTab,
        onTap: (position) {
          setState(() {
            _selectedTab = position;
          });
          switch (position) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: "")),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AppointTracker(title: "")),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Food(title: "")),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Exercise(title: "")),
              );
              break;
            default:
              break;
          }
        },
        items: [
          SalomonBottomBarItem(
              selectedColor: const Color(0xFF806BB2),
              title: const Text('Home'),
              icon: const Icon(Icons.home)),
          SalomonBottomBarItem(
              selectedColor: const Color(0xFF806BB2),
              title: const Text('Appoint trackr'),
              icon: const Icon(Icons.calendar_month)),
          SalomonBottomBarItem(
              selectedColor: const Color(0xFF806BB2),
              title: const Text('H&N Guide'),
              icon: const Icon(Icons.food_bank_sharp)),
          SalomonBottomBarItem(
            selectedColor: const Color(0xFF806BB2),
            title: const Text('Fitness'),
            icon: const Icon(Icons.fitness_center_sharp),
          ),
        ],
      ),
    );
  }
}
