// ignore_for_file: sort_child_properties_last, duplicate_ignore, prefer_const_constructors, avoid_print, unused_import, file_names, recursive_getters
import 'package:flutter/material.dart';
import 'package:maternityhelperap/screen/profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:maternityhelperap/screen/food.dart';
import 'package:maternityhelperap/screen/Exercise and  wellness.dart';
import 'package:maternityhelperap/screen/home.dart';
import 'package:maternityhelperap/screen/cale.dart';

// ignore: depend_on_referenced_packages, unused_import
class AppointTracker extends StatefulWidget {
  const AppointTracker({super.key, required this.title});
  final String title;
  @override
  // ignore: library_private_types_in_public_api
  _AppointTrackerState createState() => _AppointTrackerState();
}

class _AppointTrackerState extends State<AppointTracker> {
  var currentPageIndex = 0;
  int _selectedIndex = 0;
  int _selectedTab = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            onPressed: () {
                                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
            },
            icon: const Icon(Icons.account_circle),
          ),
        ],
        title: const Text(
          'Appoint Tracker',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalendarPagee(),)
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
                              image: AssetImage('images/maternity (1).png'),
                            ),
                          ),
                          height: 100,
                          width: 150,
                        ),
                        const SizedBox(),
                        Expanded(
                          child: Text(
                            'ChildBirth',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalendarPagee(),)
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
                              image: AssetImage('images/first-aid-kit.gif'),
                            ),
                          ),
                          height: 100,
                          width: 150,
                        ),
                        const SizedBox(),
                        Expanded(
                          child: Text(
                            'Medical Visits',
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
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalendarPagee(),)
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
                              image: AssetImage('images/drugs.gif'),
                            ),
                          ),
                          height: 100,
                          width: 150,
                        ),
                        const SizedBox(),
                        Expanded(
                          child: Text(
                            'Medication Time',
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
