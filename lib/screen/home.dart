// ignore_for_file: sort_child_properties_last, duplicate_ignore, prefer_const_constructors, avoid_print, unused_import, prefer_typing_uninitialized_variables, dead_code, use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maternityhelperap/commuinty/chat_screen.dart';
import 'package:maternityhelperap/screen/AppointTracker.dart';
import 'package:maternityhelperap/screen/Exercise and  wellness.dart';
import 'package:maternityhelperap/screen/cale.dart';
import 'package:maternityhelperap/screen/camera.dart';
import 'package:maternityhelperap/screen/camerrra.dart';
import 'package:maternityhelperap/screen/doctor.dart';
import 'package:maternityhelperap/screen/food.dart';
import 'package:maternityhelperap/screen/imagepaker.dart';
import 'package:maternityhelperap/screen/profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:maternityhelperap/src/models/code.dart';
// ignore: depend_on_referenced_packages, unused_import

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title = 'Home'});
  final String title;
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: non_constant_identifier_names

  get currentPageIndex => 0;
  int _selectedIndex = 0;
  int _selectedTab = 0;

  get color => null;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/love this maternity photo.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
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
              'Home',
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
                  child: Text('Maternity Helper'),
                ),
                ListTile(
                  leading: Icon(Icons.help_sharp),
                  title: const Text('Help&Support'),
                  selected: _selectedIndex == 0,
                  onTap: () {
                    _onItemTapped(0);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: const Text('Setting'),
                  selected: _selectedIndex == 1,
                  onTap: () {
                    _onItemTapped(1);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout_outlined),
                  title: const Text('Login Out'),
                  selected: _selectedIndex == 2,
                  onTap: () async {
                    GoogleSignIn googleSignIn = GoogleSignIn();
                    googleSignIn.disconnect();
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("Login", (route) => false);
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
                        MaterialPageRoute(builder: (context) => ChatScreen()),
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
                                  image: AssetImage('images/mother.gif'),
                                ),
                              ),
                              height: 100,
                              width: 130,
                            ),
                            const SizedBox(),
                            Expanded(
                              child: Text(
                                'Mothers Experiences',
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorListPage()),
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
                                  image:
                                      AssetImage('images/doctors-office.gif'),
                                ),
                              ),
                              height: 100,
                              width: 150,
                            ),
                            const SizedBox(),
                            Expanded(
                              child: Text(
                                'Doctor address',
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
                        MaterialPageRoute(
                            builder: (context) => CalendarPagee()),
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
                                  image:
                                      AssetImage('images/ultrasound (1).gif'),
                                ),
                              ),
                              height: 100,
                              width: 150,
                            ),
                            const SizedBox(),
                            Expanded(
                              child: Text(
                                'Ultrasound Scans',
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
          floatingActionButton: SpeedDial(
            icon: Icons.add,
            activeIcon: Icons.remove,
            visible: true,
            closeManually: false,
            renderOverlay: false,
            curve: Curves.bounceIn,
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            // ignore: avoid_print
            onOpen: () => print('OPENING DIAL'),
            // ignore: avoid_print
            onClose: () => print('DIAL CLOSED'),
            tooltip: 'Speed Dial',
            heroTag: 'speed-dial-hero-tag',
            backgroundColor: const Color(0xFF806BB2),
            foregroundColor: Colors.white,
            elevation: 8.0,
            shape: const CircleBorder(),
            children: [
              SpeedDialChild(
                  child: const Icon(Icons.camera_alt_sharp),
                  backgroundColor: Colors.red,
                  label: 'Take a Photo',
                  labelStyle: const TextStyle(fontSize: 18.0),
                  // ignore: avoid_print
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ObjectDetectionScreen()),
                      ),
                  // ignore: avoid_print
                  onLongPress: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage(
                                  title: "",
                                )),
                      )),
              SpeedDialChild(
                child: ImageIcon(AssetImage('images/ultrasound.png')),
                backgroundColor: Colors.blue,
                label: 'Ultrasound scan',
                labelStyle: const TextStyle(fontSize: 18.0),
                // ignore: avoid_print
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>HomePage()),
                ),
                onLongPress: () => print('SECOND CHILD LONG PRESS'),
              ),
            ],
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
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(title: "")),
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
                    MaterialPageRoute(
                        builder: (context) => Exercise(title: "")),
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
        ),
      ),
    );
  }
}
