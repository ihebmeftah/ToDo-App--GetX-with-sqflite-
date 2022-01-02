// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/ui/pages/notification_screen.dart';

import 'ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primaryColor: Colors.teal, backgroundColor: Colors.teal),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const NotificationScreen(
        payLoad: 'title|description|10:20',
      ),
    );
  }
}
