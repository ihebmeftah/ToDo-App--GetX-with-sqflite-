// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/ui/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payLoad}) : super(key: key);
  final String payLoad;
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String? _payLoad;
  @override
  void initState() {
    super.initState();
    _payLoad = widget.payLoad;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            _payLoad.toString().split('|')[1],
            style:
                TextStyle(color: Get.isDarkMode ? Colors.white : darkGreyClr),
          ),
          elevation: 0,
          backgroundColor: context.theme.backgroundColor,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back),
          )),
      body: SafeArea(
          child: Column(
        children: [
          Text(
            'Hello,Iheb',
            style: TextStyle(
                color: Get.isDarkMode ? Colors.white : darkGreyClr,
                fontSize: 26,
                fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'You have new reminder',
            style: TextStyle(
                color: Get.isDarkMode ? Colors.grey[100] : darkGreyClr,
                fontSize: 18,
                fontWeight: FontWeight.w300),
          ),
        ],
      )),
    );
  }
}
