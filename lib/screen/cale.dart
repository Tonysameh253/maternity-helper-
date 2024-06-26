// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;



class CalendarPagee extends StatefulWidget {
  const CalendarPagee({super.key});

  @override
  _CalendarPageeState createState() => _CalendarPageeState();
}

class _CalendarPageeState extends State<CalendarPagee> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Map<String, dynamic>>> _events = {};
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _loadFirestoreEvents();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _scheduleNotification(DateTime scheduledTime, String eventTitle) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Event Reminder',
      eventTitle,
      tz.TZDateTime.from(scheduledTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your_channel_id',
          'your_channel_name',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> _loadFirestoreEvents() async {
    final snapshot = await FirebaseFirestore.instance.collection('events').get();
    final events = snapshot.docs.map((doc) {
      final data = doc.data();
      final date = (data['date'] as Timestamp).toDate();
      final title = data['title'] as String;
      final time = (data['time'] as Timestamp).toDate();
      return MapEntry(date, [{'title': title, 'time': time}]);
    }).toList();

    setState(() {
      _events = Map.fromEntries(events);
    });
  }

  List<Map<String, dynamic>> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar App'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            eventLoader: _getEventsForDay,
          ),
          Expanded(
            child: ListView(
              children: _getEventsForDay(_selectedDay ?? _focusedDay)
                  .map((event) => ListTile(
                        title: Text(event['title']),
                        subtitle: Text(event['time'].toString()),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addEvent(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _addEvent() async {
    if (_selectedDay != null) {
      final newEventDetails = await _showAddEventDialog();
      if (newEventDetails != null) {
        final newEventTitle = newEventDetails['title'];
        final newEventTime = newEventDetails['time'];

        FirebaseFirestore.instance.collection('events').add({
          'date': _selectedDay,
          'title': newEventTitle,
          'time': newEventTime,
        });

        setState(() {
          _events[_selectedDay!] = [..._getEventsForDay(_selectedDay!), {'title': newEventTitle, 'time': newEventTime}];
        });

        await _scheduleNotification(newEventTime, newEventTitle);
      }
    }
  }

  Future<Map<String, dynamic>?> _showAddEventDialog() {
    final TextEditingController titleController = TextEditingController();
    TimeOfDay? selectedTime;

    return showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Event'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Event Title'),
            ),
            TextButton(
              onPressed: () async {
                selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
              },
              child: const Text('Select Time'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (selectedTime != null) {
                final now = DateTime.now();
                final selectedDateTime = DateTime(now.year, now.month, now.day, selectedTime!.hour, selectedTime!.minute);
                Navigator.of(context).pop({'title': titleController.text, 'time': selectedDateTime});
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
