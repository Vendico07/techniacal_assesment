import 'package:flutter/material.dart';
import 'package:ago/ago.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Attendance Records'),
        ),
        body: Column(
          children: [
            ToggleButtons(
              children: <Widget>[
                const Text('Time Ago'),
                const Text('Date & Time'),
              ],
              onPressed: (int index) {
                setState(() {
                  if (index == 0) {
                    timeFormat.value = 'time_ago';
                  } else {
                    timeFormat.value = 'dd MMM yyyy, h:mm a';
                  }
                });
              },
              isSelected: [
                timeFormat.value == 'time_ago',
                timeFormat.value == 'dd MMM yyyy, h:mm a'
              ],
            ),
            const AttendanceRecordList(),
          ],
        ),
      ),
    );
  }
}

class AttendanceRecord {
  final DateTime date;
  final String name;

  AttendanceRecord({required this.date, required this.name});
}

class AttendanceRecordList extends StatefulWidget {
  const AttendanceRecordList({super.key});

  @override
  State<AttendanceRecordList> createState() => _AttendanceRecordListState();
}

class _AttendanceRecordListState extends State<AttendanceRecordList> {
  final List<AttendanceRecord> attendanceRecords = [
    AttendanceRecord(date: DateTime.now(), name: 'John Doe'),
    AttendanceRecord(
        date: DateTime.now().add(const Duration(hours: 1)), name: 'Jane Doe'),
    // Add more attendance records here
  ];

  final ValueNotifier<String> timeFormat = ValueNotifier('time_ago');

  @override
  Widget build(BuildContext context) {
    attendanceRecords.sort((a, b) => b.date.compareTo(a.date));

    return ListView.builder(
      itemCount: attendanceRecords.length,
      itemBuilder: (context, index) {
        AttendanceRecord record = attendanceRecords[index];
        return ListTile(
          title: Text(record.name),
          subtitle: Text(
            DateFormat(timeFormat.value).format(record.date),
          ),
        );
      },
    );
  }
}
