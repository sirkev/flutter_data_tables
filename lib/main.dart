import 'package:flutter/material.dart';

import 'data/data.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    getWeekdayFromDate(parseDate("2021-10-01"));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(title: 'Employee working hours table widget'),
    );
  }
}
