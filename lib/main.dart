import 'package:flutter/material.dart';

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
        body: AttendanceRecordList(),
      ),
    );
  }
}

class AttendanceRecord {
  final DateTime date;
  final String name;

  AttendanceRecord({required this.date, required this.name});
}

class AttendanceRecordList extends StatelessWidget {
  final List<AttendanceRecord> attendanceRecords = [
    AttendanceRecord(date: DateTime.now(), name: 'Vendico Juan'),
    AttendanceRecord(
        date: DateTime.now().add(const Duration(hours: 1)),
        name: 'Kevin Mania'),
  ];

  AttendanceRecordList({super.key});

  @override
  Widget build(BuildContext context) {
    attendanceRecords.sort((a, b) => b.date.compareTo(a.date));

    return ListView.builder(
      itemCount: attendanceRecords.length,
      itemBuilder: (context, index) {
        AttendanceRecord record = attendanceRecords[index];
        return ListTile(
          title: Text(record.name),
          subtitle: Text(record.date.toString()),
        );
      },
    );
  }
}
