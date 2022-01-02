import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/services/theme_services.dart';
import 'package:todo/ui/pages/notification_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: context.theme.backgroundColor,
          leading: IconButton(
            onPressed: () {
              ThemeServices().switchTheme();
              Get.to(const NotificationScreen(
                payLoad: 'title|dfugfdfqfhfdf|10.00',
              ));
            },
            icon: const Icon(Icons.dark_mode_outlined),
          )),
      body: Container(),
    );
  }
}
